from __future__ import division

import collections
import decimal
import fnmatch
import functools
import itertools
import operator
import os
import re

import vim


infinity = decimal.Decimal("Infinity")


def is_zero(var):
    assert isinstance(var, basestring), "Unexpected type: %s" % (type(var), )
    return var == "0"


def eval_bool(var):
    return not is_zero(vim.eval(var))


def exists(s):
    return not is_zero(vim.eval("exists('%s')" % (s, )))


def has_syntax():
    return not is_zero(vim.eval('has("syntax")'))


def current_window_number():
    return int(vim.eval("winnr()"))


def single_quote_escape(s):
    # Everything in a Vim single-quoted string is literal, except single
    # quotes.  Single quotes are escaped by doubling them.
    return s.replace("'", "''")


def regex_escape(s):
    return re.sub('[%s]' % (re.escape(r'\[].~"^$*'), ), r"\\\g<0>", s)


COLUMN_SEPARATOR = "    "
ENTRY_START_VIM_REGEX = r'\%%(^\|%s\)' % (COLUMN_SEPARATOR, )
ENTRY_END_VIM_REGEX = r'\%%(\s*$\|%s\)' % (COLUMN_SEPARATOR, )


def entry_syntaxify(s, case_insensitive):
    # Create a match regex string for the given s.
    # This is for a Vim regex, not for a Python regex.
    return r"%s\zs%s\ze%s%s" % (
        ENTRY_START_VIM_REGEX, s, ENTRY_END_VIM_REGEX,
        r'\c' if case_insensitive else '')


# Print with colours
def pretty_msg(*rest):
    if len(rest) == 0:
        return
    vim.command("redraw")  # see :help echo-redraw
    for heading, message in itertools.izip_longest(
        *([iter(rest)] * 2), fillvalue=None):
        vim.command("echohl %s" % (heading, ))
        if message is not None:
            vim.command("echon '%s'" % (message, ))
    vim.command('echohl None')


# Hack for wide CJK characters.
if exists("*strwidth"):
    def strwidth(s):
        # strwidth() is defined in Vim 7.3.
        return int(
            vim.eval("strwidth('%s')" % (single_quote_escape(s), )))
else:
    def strwidth(s):
        return len(s)


def is_buffer_listed(buf_num):
    return (eval_bool("bufexists(%s)" % (buf_num, )) and
            eval_bool("getbufvar(%s, '&buflisted')" % (buf_num, )))


# Utility functions.
def simplify_path(s):
    s = os.path.expanduser(s)
    if s.startswith("~"):
        # TODO: bad path (can't expand user), do something?
        pass

    if s.endswith(os.path.sep):
        return os.path.abspath(s) + os.sep
    else:
        dirname, basename = os.path.split(s)
        dirname_expanded = os.path.abspath(dirname)
        return os.path.join(dirname_expanded, basename)


def longest_common_prefix(paths):
    lcp = os.path.commonprefix(paths)
    try:
        return lcp[:lcp.rindex(os.path.sep) + 1]
    except ValueError:
        return lcp


def is_option_set(opt_name):
    opt_name = "g:LycosaExplorer" + opt_name
    return eval_bool("exists('%s') && %s != '0'" % (opt_name, opt_name))


def chunk(iterable, size):
    assert size > 0
    output = []
    for value in iterable:
        output.append(value)
        if len(output) == size:
            yield tuple(output)
            output = []
    if output:
        yield tuple(output)


# A python translation of the Mercury fuzzy matching algorithm, written by
# Matt Tolton based on the Quicksilver and LiquidMetal fuzzy matching
# algorithms
class Mercury(object):

    _SCORE_NO_MATCH = 0.0  # do not change, this is assumed to be 0.0
    _SCORE_EXACT_MATCH = 1.0
    _SCORE_MATCH = 0.9
    _SCORE_TRAILING = 0.7
    _SCORE_TRAILING_BUT_STARTED = 0.8
    _SCORE_BUFFER = 0.7
    _SCORE_BUFFER_BUT_STARTED = 0.8

    _BRANCH_LIMIT = 100

    def __init__(self, string, abbrev):
        self.string = string
        self.lower_string = string.lower()
        self.abbrev = abbrev.lower()
        self.level = 0
        self.branches = 0

    @classmethod
    def score(cls, string, abbrev):
        return cls(string, abbrev)._score()

    def _score(self):
        if len(self.abbrev) == 0:
            return self._SCORE_TRAILING
        if len(self.abbrev) > len(self.string):
            return self._SCORE_NO_MATCH

        raw_score = self._raw_score(0, 0, 0, False)
        return raw_score / len(self.string)

    def _raw_score(self, abbrev_idx, match_idx, score_idx, first_char_matched):
        try:
            index = self.lower_string.index(self.abbrev[abbrev_idx], match_idx)
        except ValueError:
            return 0.0

        started = (index == 0) or first_char_matched

        # TODO Instead of having two scores, should there be a sliding "match"
        # score based on the distance of the matched character to the beginning
        # of the string?
        if abbrev_idx == index:
            score = self._SCORE_EXACT_MATCH
        else:
            score = self._SCORE_MATCH

        # If matching on a word boundary, score the characters
        # since the last match.
        if index > score_idx:
            if started:
                buffer_score = self._SCORE_BUFFER_BUT_STARTED
            else:
                buffer_score = self._SCORE_BUFFER
            if self.string[index - 1] in " \t/._-":
                score += self._SCORE_MATCH
                score += buffer_score * ((index - 1) - score_idx)
            elif "A" <= self.string[index] <= "Z":
                score += buffer_score * (index - score_idx)

        if (abbrev_idx + 1) == len(self.abbrev):
            if started:
                trailing_score = self._SCORE_TRAILING_BUT_STARTED
            else:
                trailing_score = self._SCORE_TRAILING
            # We just matched the last character in the pattern
            score += trailing_score * (len(self.string) - (index + 1))
        else:
            tail_score = self._raw_score(
                abbrev_idx + 1, index + 1, index + 1, started)
            if tail_score == 0.0:
                return 0.0
            score += tail_score

        if self.branches < self._BRANCH_LIMIT:
            self.branches += 1
            alternate = self._raw_score(abbrev_idx,
                                        index + 1,
                                        score_idx,
                                        first_char_matched)
            score = max(score, alternate)

        return score


# Abstract base class.
class Entry(object):

    def __init__(self, full_name, short_name, label):
        self.full_name = full_name
        self.short_name = short_name
        self.label = label

    # NOTE: very similar to BufferStack.shorten_paths()
    @classmethod
    def compute_buffer_entries(cls):
        num_to_buffer = dict((buf.number, buf) for buf in vim.buffers)
        buffer_entries = [cls(num_to_buffer[n], n)
                          for n in lycosa_buffer_stack.numbers
                          if n in num_to_buffer]
        # Put the current buffer at the end of the list.
        buffer_entries.append(buffer_entries.pop(0))

        # Shorten each buffer name by removing all path elements which are not
        # needed to differentiate a given name from other names.  This usually
        # results in only the basename shown, but if several buffers of the
        # same basename are opened, there will be more.

        # Group the buffers by common basename
        common_base = collections.defaultdict(list)
        for entry in buffer_entries:
            if entry.full_name is not None:
                basename = os.path.basename(entry.full_name)
                common_base[basename].append(entry)

        # Determine the longest common prefix for each basename group.
        basename_to_prefix = dict(
            (base, longest_common_prefix([e.full_name for e in entries]))
            for base, entries in common_base.iteritems())

        # Compute shortened buffer names by removing prefix, if possible.
        for entry in buffer_entries:
            full_name = entry.full_name

            if full_name is None:
                short_name = '[No Name]'
            elif full_name.startswith("scp://"):
                short_name = full_name
            else:
                base = os.path.basename(full_name)
                try:
                    prefix = basename_to_prefix[base]
                except KeyError:
                    short_name = base
                else:
                    short_name = full_name[len(prefix):]
            entry.short_name = short_name
        return buffer_entries


# Used in FilesystemExplorer
class FilesystemEntry(Entry):

    def __init__(self, label):
        Entry.__init__(self, "::UNSET::", "::UNSET::", label)
        self.current_score = 0.0


# Used in BufferExplorer
class BufferEntry(Entry):

    def __init__(self, vim_buffer, mru_placement):
        Entry.__init__(self, vim_buffer.name, "::UNSET::", "::UNSET::")
        self.vim_buffer = vim_buffer
        self.mru_placement = mru_placement
        self.current_score = 0.0


# Abstract base class; extended as BufferExplorer, FilesystemExplorer
class Explorer(object):

    FULL = object()
    NO_RECOMPUTE = object()
    CURRENT_TAB = object()
    NEW_SPLIT = object()
    NEW_VSPLIT = object()
    NEW_TAB = object()

    def __init__(self):
        self.settings = SavedSettings()
        self.display = Display(self.TITLE)
        self.prompt = None
        self.current_sorted_matches = []
        self.running = False

    def run(self):
        if self.running:
            return
        self.settings.save()
        self.running = True
        self.calling_window = current_window_number()
        if eval_bool("expand('#') == ''"):
            self.saved_alternate_buf_num = None
        else:
            self.saved_alternate_buf_num = vim.eval("bufnr(expand('#'))")
        self._create_explorer_window()
        self._refresh(self.FULL)

    def key_pressed(self):
        # Grab argument from the Vim function.
        i = int(vim.eval("a:code_arg"))
        refresh_mode = self.FULL
        number_of_matches = len(self.current_sorted_matches)

        if 32 <= i <= 126:  # Printable characters
            c = chr(i)
            self.prompt.add(c)
            self.selected_index = 0
        elif i == 2:  # C-b (select left)
            if number_of_matches > 0:
                new_index = self.selected_index - self.display.number_of_rows
                if new_index < 0:
                    new_index = (number_of_matches - (
                        number_of_matches % self.display.number_of_rows)
                    ) + self.selected_index
                    if new_index >= number_of_matches:
                        new_index -= self.display.number_of_rows
                self.selected_index = new_index
            refresh_mode = self.NO_RECOMPUTE
        elif i == 6:  # C-f (select right)
            if number_of_matches > 0:
                new_index = self.selected_index + self.display.number_of_rows
                if new_index >= number_of_matches:
                    new_index %= self.display.number_of_rows
                self.selected_index = new_index
            refresh_mode = self.NO_RECOMPUTE
        elif i == 8:  # Backspace/Del/C-h
            self.prompt.backspace()
            self.selected_index = 0
        elif i in (9, 13):  # Tab and Enter
            self._choose(self.CURRENT_TAB)
        elif i == 14:  # C-n (select next)
            if number_of_matches > 0:
                self.selected_index = \
                        (self.selected_index + 1) % number_of_matches
            refresh_mode = self.NO_RECOMPUTE
        elif i == 15:  # C-o choose in new horizontal split
            self._choose(self.NEW_SPLIT)
        elif i == 16:  # C-p (select previous)
            if number_of_matches > 0:
                self.selected_index = \
                    (self.selected_index - 1) % number_of_matches
            refresh_mode = self.NO_RECOMPUTE
        elif i == 20:  # C-t choose in new tab
            self._choose(self.NEW_TAB)
        elif i == 21:  # C-u clear prompt
            self.prompt.clear()
            self.selected_index = 0
        elif i == 22:  # C-v choose in new vertical split
            self._choose(self.NEW_VSPLIT)
        elif i == 23:  # C-w (delete 1 dir backward)
            self.prompt.up_one_dir()
            self.selected_index = 0

        self._refresh(refresh_mode)

    def cancel(self):
        if self.running:
            self._cleanup()
            # fix alternate file
            if self.saved_alternate_buf_num:
                cur = vim.current.buffer
                vim.command("silent b %s" % (self.saved_alternate_buf_num, ))
                vim.command("silent b %s" % (cur.number, ))

    def _refresh(self, mode):
        if not self.running:
            return

        if mode is self.FULL:
            self.current_sorted_matches = self._compute_sorted_matches()

        self._on_refresh()
        if has_syntax():
            self._highlight_selected_index()
        self.display.render([x.label for x in self.current_sorted_matches])
        self.prompt.render(Display.max_width())

    def _create_explorer_window(self):
        key_binding_prefix = "Lycosa" + self.__class__.__name__
        self.display.create(key_binding_prefix)
        self._set_syntax_matching()

    def _highlight_selected_index(self):
        vim.command('syn clear LycosaSelected')
        try:
            entry = self.current_sorted_matches[self.selected_index]
        except IndexError:
            pass
        else:
            escaped = regex_escape(entry.label)
            label_match_string = entry_syntaxify(escaped, False)
            vim.command(
                'syn match LycosaSelected "%s" contains=LycosaGrepMatch' %
                (label_match_string, ))

    def _choose(self, open_mode):
        try:
            entry = self.current_sorted_matches[self.selected_index]
        except IndexError:
            pass
        else:
            self._open_entry(entry, open_mode)

    def _cleanup(self):
        self.display.close()
        select_window(self.calling_window)
        self.settings.restore()
        self.running = False
        print


class BufferExplorer(Explorer):

    TITLE = '[LycosaExplorer-Buffers]'

    def __init__(self):
        Explorer.__init__(self)
        self.prompt = Prompt()
        self.buffer_entries = []

    def run(self):
        if self.running:
            return
        self.prompt.clear()
        self.curbuf_at_start = vim.current.buffer
        self.buffer_entries = BufferEntry.compute_buffer_entries()
        for e in self.buffer_entries:
            # Show modification indicator
            is_modified = not is_zero(vim.eval("getbufvar(%d, '&modified')" % (
                e.vim_buffer.number, )))
            e.label = "".join([e.short_name, " [+]" if is_modified else ""])
        self.selected_index = 0
        Explorer.run(self)

    def _set_syntax_matching(self):
        # Base highlighting -- more is set on refresh.
        if has_syntax():
            vim.command(r'syn match LycosaSlash "/" contained')
            vim.command(
                r'syn match LycosaDir "\%(\S\+ \)*\S\+/" contains=LycosaSlash')
            vim.command(r'syn match LycosaModified " \[+\]"')

    def curbuf_match_string(self):
        for buf in self.buffer_entries:
            if buf.vim_buffer == self.curbuf_at_start:
                escaped = regex_escape(buf.label)
                return entry_syntaxify(
                    escaped, self.prompt.insensitive())
        else:
            return ""

    def _on_refresh(self):
      # Highlighting for the current buffer name.
        if has_syntax():
            vim.command('syn clear LycosaCurrentBuffer')
            vim.command(
                'syn match LycosaCurrentBuffer "%s" contains=LycosaModified' % (
                    self.curbuf_match_string(), ))

    def current_abbreviation(self):
        return self.prompt.input

    def _compute_sorted_matches(self):
        abbrev = self.current_abbreviation()
        if len(abbrev) == 0:
            # Take (current) MRU order if we have no abbreviation.
            return self.buffer_entries
        else:
            matching_entries = []
            for entry in self.buffer_entries:
                entry.current_score = Mercury.score(entry.short_name, abbrev)
                if entry.current_score != 0.0:
                    matching_entries.append(entry)
            # Sort by score.
            return sorted(matching_entries,
                          key=lambda x: (-x.current_score, x.mru_placement))

    def _open_entry(self, entry, open_mode):
        self._cleanup()
        number = entry.vim_buffer.number

        commands = {
            self.CURRENT_TAB: "b",
            # For some reason just using tabe or e gives an error when
            # the alternate-file isn't set, hence tab split.
            self.NEW_TAB: "tab split | b",
            self.NEW_SPLIT: "sp | b",
            self.NEW_VSPLIT: "vs | b",
        }
        cmd = commands[open_mode]
        vim.command("silent %s %s" % (cmd, number))


class FilesystemExplorer(Explorer):

    TITLE = '[LycosaExplorer-Files]'

    def __init__(self):
        Explorer.__init__(self)
        self.prompt = FilesystemPrompt()
        self.memoized_dir_contents = {}
        self._yank_callback = None

    def run(self):
        if self.running:
            return
        FileMasks.create_glob_masks()
        self.vim_swaps = []
        self.selected_index = 0
        Explorer.run(self)

    def run_from_path(self, path=None):
        if self.running:
            return
        if not path:
            path = self._vim_current_directory()
        self.prompt.set(path.rstrip(os.path.sep) + os.path.sep)
        self.run()

    def key_pressed(self):
        i = int(vim.eval("a:code_arg"))

        if i in [1, 10]:  # <C-a>, <Shift-Enter>
            self._cleanup()
            # Open all non-directories currently in view.
            for e in self.current_sorted_matches:
                if self.prompt.at_dir():
                    path_str = self.prompt.input + e.label
                else:
                    path_str = os.path.join(self.prompt.dirname(), e.label)

                if os.path.isfile(path_str):
                    self.load_file(path_str, self.CURRENT_TAB)
        elif i == 5:  # <C-e> edit file, create it if necessary
            if not self.prompt.at_dir():
                self._cleanup()
                # Force a reread of this directory so that the new file will
                # show up (as long as it is saved before the next run).
                del self.memoized_dir_contents[self.view_path()]
                self.load_file(self.prompt.input, self.CURRENT_TAB)
        elif i == 18:  # <C-r> refresh
            del self.memoized_dir_contents[self.view_path()]
            self._refresh(self.FULL)
        elif i == 24:  # C-y yank to external function
            if self._yank_callback is not None:
                if self.prompt.at_dir():
                    dirname = self.prompt.input
                else:
                    dirname = self.prompt.dirname()
                self.cancel()
                vim.eval("%s('%s')" % (self._yank_callback,
                                       single_quote_escape(dirname)))
        else:
            Explorer.key_pressed(self)

    def _vim_current_directory(self):
        return vim.eval("getcwd()")

    def _set_syntax_matching(self):
        # Base highlighting -- more is set on refresh.
        if has_syntax():
            vim.command('syn match LycosaSlash "/" contained')
            vim.command(
                r'syn match LycosaDir "\%(\S\+ \)*\S\+/" contains=LycosaSlash')

    def _on_refresh(self):
        if has_syntax():
            vim.command('syn clear LycosaFileWithSwap')
            view = self.view_path()
            for file_with_swap in self.vim_swaps:
                if file_with_swap.dirname() == view:
                    base = file_with_swap.basename()
                    escaped = regex_escape(base)
                    match_str = entry_syntaxify(escaped, False)
                    vim.command(
                        'syn match LycosaFileWithSwap "%s"' % (match_str, ))
                    # NOTE: restore highlighting for open buffers?

    def current_abbreviation(self):
        if self.prompt.at_dir():
            return ""
        else:
            return os.path.basename(self.prompt.input)

    def view_path(self):
        # TODO: root is different on non-UNIX OS
        input_ = self.prompt.input
        if self.prompt.at_dir():
            # The last element in the path is a directory + '/' and we want to
            # see what's in it instead of what's in its parent directory.
            path = input_
        else:
            path = os.path.dirname(input_)
        return os.path.abspath(path)

    def _create_explorer_window(self):
        Explorer._create_explorer_window(self)
        opt_name = "g:LycosaExplorerYankCallback"
        if eval_bool("exists('%s') && %s != '0'" % (opt_name, opt_name)):
            self._yank_callback = vim.eval("%s" % opt_name)
            mapcmd = "noremap <silent> <buffer>"
            key_binding_prefix = "Lycosa" + self.__class__.__name__
            vim.command("%s %s    :call <SID>%sKeyPressed(%d)<CR>" % (
                mapcmd, '<C-y>', key_binding_prefix, 24))

    def all_files_at_view(self):
        view = self.view_path()

        try:
            all_entries = self.memoized_dir_contents[view]
        except KeyError:
            if not os.path.isdir(view):
                return []
            elif not os.access(view, os.R_OK):
                # TODO: show "-- PERMISSION DENIED --"
                return []

            # Generate an array of the files
            all_entries = []
            for name in os.listdir(view):
                # Hide masked files.
                if FileMasks.masked(name):
                    continue

                if os.path.isdir(os.path.join(view, name)):
                    name += os.path.sep
                all_entries.append(FilesystemEntry(name))
            self.memoized_dir_contents[view] = all_entries

        if (is_option_set("AlwaysShowDotFiles")
            or self.current_abbreviation().startswith(".")):  # TODO:
            return all_entries
        else:
            # Filter out dotfiles if the current abbreviation doesn't start
            # with '.'.
            return [entry for entry in all_entries
                    if not entry.label.startswith(".")]

    def _compute_sorted_matches(self):
        abbrev = self.current_abbreviation()
        all_files = self.all_files_at_view()

        if len(abbrev) == 0:
            # Sort alphabetically if we have no abbreviation.
            return sorted(all_files)
        else:
            matches = []
            for x in all_files:
                x.current_score = Mercury.score(x.label, abbrev)
                if x.current_score != 0.0:
                    matches.append(x)

            if abbrev == '.':
                # Sort alphabetically, otherwise it just looks weird.
                order_fn = operator.attrgetter("label")
            else:
                # Sort by score.
                order_fn = lambda x: -x.current_score
            return sorted(matches, key=order_fn)

    def _open_entry(self, entry, open_mode):
        path = os.path.join(self.view_path(), entry.label)

        if os.path.isdir(path):
            # Recurse into the directory instead of opening it.
            self.prompt.set(path)
            self.selected_index = 0
        elif os.path.sep in entry.label:
            # Don't open a fake file/buffer with "/" in its name.
            return
        else:
            self._cleanup()
            self.load_file(path, open_mode)

    def _filename_escape(self, s):
        # Escape slashes, open square braces, spaces, sharps, percent signs
        # and double quotes.
        return re.sub('[%s]' % (re.escape(r'[ #"%'), ), r'\\\g<0>',
                      s.replace(r'\\', r'\\\\'))

    def load_file(self, path_str, open_mode):
        # Escape for Vim and remove leading ./ for files in pwd.
        # TODO: sub replacement required
        escaped_filepath = self._filename_escape(path_str)
        if escaped_filepath.startswith("./"):  # TODO: windows?
            escaped_filepath = escaped_filepath[2:]
        single_quote_escaped = single_quote_escape(escaped_filepath)
        sanitized = vim.eval(
            "fnamemodify('%s', ':.')" % (single_quote_escaped, ))

        commands = {
            self.CURRENT_TAB: "e",
            self.NEW_TAB: "tabe",
            self.NEW_SPLIT: "sp",
            self.NEW_VSPLIT: "vs",
        }
        cmd = commands[open_mode]
        # TODO: will raise KeyError on bad open_mode
        vim.command("silent %s %s" % (cmd, sanitized))


# Used in BufferExplorer
class Prompt(object):

    _PROMPT = ">> "

    def __init__(self):
        self.input = ""

    def clear(self):
        self.input = ""

    def render(self, max_width=0):
        text = self.input
        # may need some extra characters for "..." and spacing
        max_width -= 5
        if max_width > 0 and len(text) > max_width:
            text = "..." + text[(len(text) - max_width + 3):]
        pretty_msg("Comment", self._PROMPT,
                   "None", single_quote_escape(text),
                   "Underlined", " ")

    def set(self, s):
        self.input = s

    def insensitive(self):
        return self.input == self.input.lower()

    def add(self, s):
        self.input += s

    def backspace(self):
        self.input = self.input[:-1]

    def up_one_dir(self):
        path = os.path.dirname(self.input[:-1])
        self.input = path + ("" if path.endswith(os.sep) else os.sep)


# Used in FilesystemExplorer
class FilesystemPrompt(Prompt):

    def __init__(self):
        Prompt.__init__(self)
        self.memoized = None
        self.dirty = True

    def clear(self):
        Prompt.clear(self)
        self.dirty = True

    def set(self, s):
        Prompt.set(self, s)
        self.dirty = True

    def backspace(self):
        Prompt.backspace(self)
        self.dirty = True

    def up_one_dir(self):
        Prompt.up_one_dir(self)
        self.dirty = True

    def at_dir(self):
        # We have not typed anything yet or have just typed the final '/' on
        # a directory name in pwd.  This check is interspersed throughout
        # FilesystemExplorer because of the conventions of basename and
        # dirname.
        return (len(self.input) == 0) or self.input.endswith(os.path.sep)
        # Don't think the os.path.isdir call is necessary, but leaving this
        # here as a reminder.
        #(os.path.isdir(input()) and input().ends_with?(os.path.sep))

    def insensitive(self):
        return self.at_dir() or (self.basename() == self.basename().lower())

    def add(self, s):
        # Assumption: add() will only receive enough chars at a time to
        # complete a single directory level, e.g. foo/, not foo/bar/
        self.input += s
        self.dirty = True

    def input(self):
        if self.dirty:
            self.memoized = simplify_path(self._variable_expansion(self.input))
            self.dirty = False
        return self.memoized

    def basename(self):
        return os.path.basename(self.input)

    def dirname(self):
        return os.path.dirname(self.input)

    def _variable_expansion(self, input_str):
        strings = input_str.split('$')
        # Try to expand each instance of $<word>.
        return strings[0] + "".join(os.environ.get(s, "$%s" % (s, ))
                                    for s in strings[1:])


# Simplify switching between windows.
def select_window(window_number):
    if window_number == current_window_number():
        return True

    vim.command('exe %d "wincmd w"' % (window_number, ))

    if window_number == current_window_number():
        return True
    else:
        vim.command("wincmd p")
        return False


# Save and restore settings when creating the explorer buffer.
class SavedSettings(object):

    def __init__(self):
        self.save()

    def save(self):
        self.timeoutlen = vim.eval("&timeoutlen")
        self.insertmode = eval_bool("&insertmode")
        self.showcmd = eval_bool("&showcmd")
        self.list = eval_bool("&list")
        self.report = vim.eval("&report")
        self.sidescroll = vim.eval("&sidescroll")
        self.sidescrolloff = vim.eval("&sidescrolloff")
        vim.command("let s:win_size_restore = winrestcmd()")

    def restore(self):
        vim.command("set timeoutlen=%s" % (self.timeoutlen, ))

        if self.insertmode:
            vim.command("set insertmode")
        else:
            vim.command("set noinsertmode")

        if self.showcmd:
            vim.command("set showcmd")
        else:
            vim.command("set noshowcmd")

        if self.list:
            vim.command("set list")
        else:
            vim.command("set nolist")

        vim.command("set report=%s" % (self.report, ))
        vim.command("set sidescroll=%s" % (self.sidescroll, ))
        vim.command("set sidescrolloff=%s" % (self.sidescrolloff, ))

        vim.command("exe s:win_size_restore")


def unlocked_buffer(func):
    @functools.wraps(func)
    def wrapper(*args, **kwargs):
        vim.command("setlocal modifiable")
        # Clear the explorer
        vim.current.buffer[:] = None
        result = func(*args, **kwargs)
        vim.command("setlocal nomodifiable")
        # Hide the cursor
        vim.command("normal! Gg$")
        return result
    return wrapper


class Display(object):

    _NO_MATCHES_STRING = "-- NO MATCHES --"
    _TRUNCATED_STRING = "-- TRUNCATED --"

    def __init__(self, title):
        self.title = title
        self.window_number = None
        self.buffer = None
        self.single_column_mode = False
        self.number_of_rows = 0

    def create(self, prefix):
        # Make a window for the display and move there.
        # Start at size 1 to mitigate flashing effect when
        # we resize the window later.
        vim.command("silent! botright 1split %s" % (self.title, ))

        self.window_number = current_window_number()
        self.buffer = vim.current.buffer

        #
        # Display buffer is special -- set options.
        #

        # Buffer-local.
        vim.command("setlocal bufhidden=delete")
        vim.command("setlocal buftype=nofile")
        vim.command("setlocal nomodifiable")
        vim.command("setlocal noswapfile")
        vim.command("setlocal nowrap")
        vim.command("setlocal nonumber")
        vim.command("setlocal foldcolumn=0")
        vim.command("setlocal nocursorline")
        vim.command("setlocal nospell")
        vim.command("setlocal nobuflisted")
        vim.command("setlocal textwidth=0")
        vim.command("setlocal noreadonly")
        vim.command('setlocal colorcolumn=""')

        # Non-buffer-local (Vim is annoying).
        # (Update SavedSettings if adding to below.)
        vim.command("set timeoutlen=0")
        vim.command("set noinsertmode")
        vim.command("set noshowcmd")
        vim.command("set nolist")
        vim.command("set report=9999")
        vim.command("set sidescroll=0")
        vim.command("set sidescrolloff=0")

        #
        # Syntax highlighting.
        #
        if has_syntax():
            # General syntax matching.
            vim.command(r'syn match LycosaNoEntries "\%%^\s*%s\s*\%%$"' % (
                self._NO_MATCHES_STRING, ))
            vim.command(r'syn match LycosaTruncated "^\s*%s\s*$"' % (
                self._TRUNCATED_STRING, ))

            # Colour highlighting.
            vim.command("highlight link LycosaDir Directory")
            vim.command("highlight link LycosaSlash Function")
            vim.command("highlight link LycosaSelected Type")
            vim.command("highlight link LycosaModified Special")
            vim.command("highlight link LycosaCurrentBuffer Constant")
            vim.command("highlight link LycosaGrepMatch IncSearch")
            vim.command("highlight link LycosaGrepLineNumber Directory")
            vim.command("highlight link LycosaGrepFileName Comment")
            vim.command("highlight link LycosaGrepContext None")  # transparent
            vim.command("highlight link LycosaOpenedFile PreProc")
            vim.command("highlight link LycosaFileWithSwap WarningMsg")
            vim.command("highlight link LycosaNoEntries ErrorMsg")
            vim.command("highlight link LycosaTruncated Visual")

            if exists('*clearmatches'):
                vim.eval('clearmatches()')
        #
        # Key mappings - we need to reroute user input.
        #

        # Non-special printable characters.
        printables = ('/!"#$%&\'()*+,-.0123456789:<=>?#@"'
                      'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
                      '[]^_`abcdefghijklmnopqrstuvwxyz{}~')

        mapcmd = "noremap <silent> <buffer>"

        for char in printables:
            char_code = ord(char)
            vim.command("%s <Char-%d> :call <SID>%sKeyPressed(%d)<CR>" % (
                mapcmd, char_code, prefix, char_code))

        # Special characters
        vim.command("%s <Esc>    :call <SID>%sCancel()<CR>" % (mapcmd, prefix))
        vim.command("%s <C-c>    :call <SID>%sCancel()<CR>" % (mapcmd, prefix))
        vim.command("%s <C-g>    :call <SID>%sCancel()<CR>" % (mapcmd, prefix))

        for key, code in [
            ("<C-a>", 1), ("<C-e>", 5), ("<BS>", 8), ("<C-h>", 8),
            ("<Del>", 8), ("<Tab>", 9), ("<S-CR>", 10), ("<CR>", 13),
            ("<C-b>", 2), ("<Esc>0D", 2), ("<Left>", 2),
            ("<C-f>", 6), ("<Esc>0C", 6), ("<Right>", 6),
            ("<C-n>", 14), ("<Esc>0B", 14), ("<Down>", 14),
            ("<C-p>", 16), ("<Esc>0A", 16), ("<Up>", 16),
            ("<C-o>", 15),
            ("<C-r>", 18), ("<C-t>", 20), ("<C-u>", 21), ("<C-v>", 22),
            ("<C-w>", 23), ("<Space>", 32), ("<Bslash>", 92), ("<Bar>", 124)]:
            vim.command("%s %s    :call <SID>%sKeyPressed(%d)<CR>" % (
                mapcmd, key, prefix, code))

    def render(self, strings):
        if not select_window(self.window_number):
            return

        if len(strings) == 0:
            self._print_no_entries()
            return

        row_count, col_count, col_widths, truncated = \
            self._compute_optimal_layout(strings)

        # Slice the strings into rows.
        rows = [""] * row_count
        for col_index, column in enumerate(chunk(strings, row_count)):
            if col_index >= col_count:
                break
            column_width = col_widths[col_index]
            for index, value in enumerate(column):
                row = rows[index] + value
                if col_index < col_count - 1:
                    # Add spacer to the width of the column
                    row += (" " * (column_width - strwidth(value)))
                    row += COLUMN_SEPARATOR
                rows[index] = row

        self.number_of_rows = row_count
        self._print_rows(rows, truncated)

    def close(self):
        # Only wipe the buffer if we're *sure* it's the explorer.
        if (select_window(self.window_number) and
            vim.current.buffer == self.buffer and
            vim.current.buffer.name.endswith(self.title)):
            vim.command("bwipeout!")
            self.window_number = None
            self.buffer = None

    @classmethod
    def max_height(cls):
        stored_height = vim.current.window.height
        # Vim ints are signed 32-bit.
        most_positive_integer = 2 ** (32 - 1) - 2
        vim.current.window.height = most_positive_integer
        highest_allowable = vim.current.window.height
        vim.current.window.height = stored_height
        return highest_allowable

    @classmethod
    def max_width(cls):
        return int(vim.eval("&columns"))

    def _compute_optimal_layout(self, strings):
        # Compute optimal row count and corresponding column count.
        # The display attempts to fit `strings' on as few rows as
        # possible.

        max_width = Display.max_width()
        max_height = Display.max_height()
        displayable_string_upper_bound = self._compute_displayable_upper_bound(
            strings)

        # Determine optimal row count.
        def counter():
            if self.single_column_mode:
                if len(strings) <= max_height:
                    return [len(strings), False]
                else:
                    return [max_height - 1, True]
            elif len(strings) > displayable_string_upper_bound:
                # Use all available rows and truncate results.
                # The -1 is for the truncation indicator.
                return [Display.max_height() - 1, True]
            else:
                single_row_width = (
                    sum(len(s) for s in strings)
                    + (len(COLUMN_SEPARATOR) * (len(strings) - 1)))
                if (single_row_width <= max_width) or (len(strings) == 1):
                    # All fits on a single row
                    return [1, False]
                else:
                    return self._compute_optimal_row_count(strings)
        optimal_row_count, truncated = counter()

        # Compute column_count and column_widths.
        column_count = 0
        column_widths = []
        total_width = 0
        for column in chunk(strings, optimal_row_count):
            longest = max(column, key=strwidth)
            column_width = strwidth(longest)
            total_width += column_width
            if total_width > max_width:
                break
            column_count += 1
            column_widths.append(column_width)
            total_width += len(COLUMN_SEPARATOR)

        return [optimal_row_count, column_count, column_widths, truncated]

    @unlocked_buffer
    def _print_rows(self, rows, truncated):
        # Grow/shrink the window as needed
        vim.current.window.height = len(rows) + int(truncated)

        # Print the rows.
        vim.current.buffer.append(["".join(row) for row in rows])

        # Print a TRUNCATED indicator, if needed.
        if truncated:
            vim.current.buffer.append(
                self._TRUNCATED_STRING.center(vim.current.window.width))
        else:
            # Stretch the last line to the length of the window with whitespace
            # so that we can "hide" the cursor in the corner.
            # TODO: globals
            last_line = vim.current.buffer[-1].ljust(vim.current.window.width)
            vim.current.buffer[-1] = last_line

    @unlocked_buffer
    def _print_no_entries(self):
        vim.current.window.height = 1
        vim.current.buffer.append(
            self._NO_MATCHES_STRING.center(vim.current.window.width))

    def _compute_displayable_upper_bound(self, strings):
        # Compute an upper-bound on the number of displayable matches.
        # Basically: find the length of the longest string, then keep
        # adding shortest strings until we pass the width of the Vim
        # window.  This is the maximum possible column-count assuming
        # all strings can fit.  Then multiply by the number of rows.

        sorted_by_shortest = sorted(len(x) for x in strings)
        longest_length = sorted_by_shortest.pop()

        row_width = longest_length + len(COLUMN_SEPARATOR)

        max_width = Display.max_width()
        column_count = 1

        for length in sorted_by_shortest:
            row_width += length
            if row_width > max_width:
                break

            column_count += 1
            row_width += len(COLUMN_SEPARATOR)

        return column_count * Display.max_height()

    def _compute_optimal_row_count(self, strings):
        max_width = Display.max_width()
        max_height = Display.max_height()

        # Hashes by range, e.g. 0..2, representing the width
        # of the column bounded by that range.
        col_range_widths = {}

        # Binary search; find the lowest number of rows at which we
        # can fit all the strings.

        # We've already failed for a single row, so start at two.
        lower = 1  # (1 = 2 - 1)
        upper = max_height + 1
        while lower + 1 != upper:
            row_count = (lower + upper) // 2   # Mid-point

            col_start_index = 0
            col_end_index = row_count - 1
            total_width = 0

            while col_end_index < len(strings):
                total_width += self._compute_column_width(
                    (col_start_index, col_end_index), strings,
                    col_range_widths)

                if total_width > max_width:
                    # Early exit.
                    total_width = infinity
                    break

                total_width += len(COLUMN_SEPARATOR)

                col_start_index += row_count
                col_end_index += row_count

                if col_end_index >= len(strings) and \
                   col_start_index < len(strings):
                    # Remainder; last iteration will not be a full column.
                    col_end_index = len(strings) - 1

            # The final column doesn't need a separator.
            total_width -= len(COLUMN_SEPARATOR)

            if total_width <= max_width:
                # This row count fits.
                upper = row_count
            else:
                # This row count doesn't fit.
                lower = row_count

        if upper > max_height:
            # No row count can accomodate all strings; have to truncate.
            # (-1 for the truncate indicator)
            return [max_height - 1, True]
        else:
            return [upper, False]

    def _compute_column_width(self, _range, strings, col_range_widths):
        first, last = _range
        if first == last:
            return len(strings[first])

        width = col_range_widths.get(_range)

        if width is None:
            # Recurse for each half of the range.
            split_point = first + ((last - first) >> 1)

            first_half = self._compute_column_width(
                (first, split_point), strings, col_range_widths)
            second_half = self._compute_column_width(
                (split_point + 1, last), strings, col_range_widths)

            width = max(first_half, second_half)
            col_range_widths[(first, last)] = width

        return width


class FileMasks(object):

    _glob_masks = []

    @classmethod
    def create_glob_masks(cls):
        if exists("&wildignore"):
            cls._glob_masks = vim.eval("&wildignore").split(',')
        else:
            cls._glob_masks = []

    @classmethod
    def masked(cls, filename):
        return any(fnmatch.fnmatch(filename, pattern)
                   for pattern in cls._glob_masks)


# Maintain MRU ordering.
class BufferStack(object):

    def __init__(self):
        self.stack = [buf.number for buf in vim.buffers]

    @property
    def numbers(self):
        # Get the buffer numbers
        self._cull()
        return reversed(self.stack)

    def __len__(self):
        self._cull()
        return len(self.stack)

    def _remove(self, buf_num):
        self._cull(
            iterable=(num for num in self.stack if num != buf_num))

    def push(self):
        buf_num = vim.current.buffer.number
        self._remove(buf_num)
        self.stack.append(buf_num)

    def pop(self):
        buf_num = vim.eval('bufnr(expand("<afile>"))')
        self._remove(buf_num)

    def _buffer_name(self, i):
        if eval_bool("empty(bufname(%s))" % (i, )):
            return "<Unknown %s>" % (i, )
        else:
            return vim.eval("bufname(%s)" % (i, ))

    def _cull(self, iterable=None):
        if iterable is None:
            iterable = self.stack
        # Remove empty and unlisted buffers.
        self.stack = [
            buf_num for buf_num in iterable if is_buffer_listed(buf_num)]


lycosa_buffer_stack = BufferStack()
lycosa_buffer_explorer = BufferExplorer()
lycosa_filesystem_explorer = FilesystemExplorer()

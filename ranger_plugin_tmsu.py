# -*- coding: utf-8 -*-
# 
# Tmsu integration with ranger.
#
# To use these commands,
#
#   1. Make sure you have `tmsu` command in your $PATH
#
#   2. Copy this file to ~/.config/ranger/tmsu.py
#
#   3. In ~/.config/ranger/commands.py, add these statements:
#
#       from tmsu import *
#       TmsuMixin.TMSU_BIN = '/your/tmsu/binary/location'
#       TmsuMixin.TMSU_LEADER_KEY = ','
#
#   4. Invode `ranger --cmd=tmsu_init` in a tmsu working directory.
#
# Key bindings:
#
#   ,l      List tags for the highlighted file
#   ,t      Tag files
#   ,u      Untag files
#   ,d      Delete tags
#   ,f      Mark files by specifying a tmsu tag query
#   ,r      Show active database location
#   ,i      Show detailed tag usage info
# 
# The default leader key for tmsu commands is the comma ','.
# You can change it by changing the value of TmsuMixin.TMSU_LEADER_KEY.
#

import subprocess
import os.path

import ranger.api
from ranger.api.commands import *


class TmsuCmdFailedError(Exception):
    pass


class TmsuMixin(object):
    TMSU_BIN = '/your/tmsu/binary/location'
    TMSU_LEADER_KEY = ','

    @property
    def tmsu_bin(self):
        return os.path.expanduser(self.TMSU_BIN)

    def _build_cmd(self, sub_cmd, *args):
        cmd = [self.tmsu_bin, sub_cmd]
        cmd.extend(args)
        return cmd

    def _exec_cmd(self, cmd):
        return subprocess.check_output(cmd, stderr=subprocess.STDOUT)

    def _exec(self, sub_cmd, *args):
        try:
            return self._exec_cmd(self._build_cmd(sub_cmd, *args)).decode()
        except subprocess.CalledProcessError as e:
            te = TmsuCmdFailedError('{}'.format(e.output.strip()))
            te.output = e.output.decode()
            raise te

    def _parse_info_line(self, line):
        sl = line.strip()
        if len(sl) == 0:
            return None
        col_idx = sl.find(':')
        if col_idx < 0:
            raise ValueError(
                    'Not a proper info line: \'{}\''.format(sl))
        name = sl[0:col_idx].strip()
        val = sl[col_idx+1:].strip()
        return (name, val)

    def _parse_info_text(self, txt):
        info = {}
        for l in txt.split('\n'):
            i = self._parse_info_line(l)
            if i is None:
                continue
            info[i[0]] = i[1]
        return info

    def _get_selected_files(self):
        selected = self.fm.thistab.get_selection()
        if len(selected) == 0:
            raise RuntimeError('No file selected.')
        return selected

    def _tab_tags(self):
        last_space = self.line.rfind(' ')
        last_word = self.line[last_space+1:]
        prev_words = self.line[:last_space]
        out = self._exec('tags')
        out = out.split('\n')
        return [prev_words + ' ' + t.strip() for t in out if len(t.strip()) > 0 and t.startswith(last_word)]


class tmsu_init(TmsuMixin, Command):
    """:tmsu_init

    Load tmsu keys and initialize tmsu database
    """

    def execute(self):
        try:
            out = self._exec('info')
        except TmsuCmdFailedError as e:
            if e.output.strip().lower().startswith('tmsu: no database found'):
                self.fm.ui.console.ask('Initialize tmsu database in current directory? (y/N)',
                        self._init_tmsu_db_confirmed, ('n', 'N', 'y', 'Y'))
                return
            else:
                raise

        info = self._parse_info_text(out)
        db = info['Database']
        self._bind_keys()
        self.fm.notify('Using tmsu database: {}'.format(db))

    def _init_tmsu_db_confirmed(self, answer):
        if answer != 'y' and answer != 'Y':
            return
        try:
            out = self._exec('init', self.fm.thisdir.path)
        except TmsuCmdFailedError as e:
            self.fm.notify(e.output.strip(), bad=True)
            return

        self._bind_keys()
        self.fm.notify(out.strip())

    def _bind_keys(self):
        self.fm.execute_console('map {}l tmsu_tags'.format(self.TMSU_LEADER_KEY))
        self.fm.execute_console('map {}t console tmsu_tag '.format(self.TMSU_LEADER_KEY))
        self.fm.execute_console('map {}u console tmsu_untag '.format(self.TMSU_LEADER_KEY))
        self.fm.execute_console('map {}d console tmsu_delete '.format(self.TMSU_LEADER_KEY))
        self.fm.execute_console('map {}f console tmsu_filter '.format(self.TMSU_LEADER_KEY))
        self.fm.execute_console('map {}r tmsu_db'.format(self.TMSU_LEADER_KEY))
        self.fm.execute_console('map {}i shell -w tmsu info -s -u'.format(self.TMSU_LEADER_KEY))


class tmsu_tags(TmsuMixin, Command):
    """:tmsu_tags

    Show the tags for the highlighted file with tmsu
    """

    def execute(self):
        hlf = self.fm.thisfile.path
        out = self._exec('tags', hlf)
        info = self._parse_info_text(out)
        if len(info.values()[0].strip()) > 0:
            self.fm.notify('Tags: {}'.format(info.values()[0]))
        else:
            self.fm.notify('No tags.')


class tmsu_tag(TmsuMixin, Command):
    """:tmsu_tag <tag1> [<tag2> ...]

    Tag the selected/highlighted files with tmsu
    """

    def execute(self):
        tags = self.args[1:]
        if len(tags) == 0:
            self.fm.notify('No tag provided.', bad=True)
            return

        selected = self._get_selected_files()
        out = self._exec('tag',
                '--tags={}'.format(' '.join(tags)),
                *(f.path for f in selected))
        out = out.split('\n')

        new_tags = []
        for line in out:
            line = line.strip().lower()
            if line.startswith('tmsu: new tag '):
                new_tags.append(line[len('tmsu: new tag '):])

        if len(new_tags) > 0:
            out = 'New tags: '
            for t in new_tags:
                out += (t + ', ')
            self.fm.notify(out[:-2])

    def tab(self, tabnum):
        return self._tab_tags()


class tmsu_untag(TmsuMixin, Command):
    """:tmsu_untag [<tag> ...]

    Untag the selected/highlighted files with tmsu
    """

    def execute(self):
        tags = self.args[1:]
        if len(tags) == 0:
            self.fm.ui.console.ask('Removing all tags. Confirm? (y/N)',
                    self._remove_all_tags_confirmed, ('n', 'N', 'y', 'Y'))
            return

        selected = self._get_selected_files()
        out = self._exec('untag',
                '--tags={}'.format(' '.join(tags)),
                *(f.path for f in selected))
        self.fm.notify(out)

    def tab(self, tabnum):
        return self._tab_tags()

    def _remove_all_tags_confirmed(self, answer):
        if answer != 'y' and answer != 'Y':
            return
        selected = self._get_selected_files()
        out = self._exec('untag', '--all', *(f.path for f in selected))
        self.fm.notify(out)


class tmsu_delete(TmsuMixin, Command):
    """:tmsu_delete [<tag> ...]

    Delete the specified tags
    """

    def execute(self):
        tags = self.args[1:]
        if len(tags) == 0:
            self.fm.notify('No tag provided.', bad=True)
            return

        out = self._exec('delete', *tags)
        self.fm.notify(out)

    def tab(self, tabnum):
        return self._tab_tags()


class tmsu_db(TmsuMixin, Command):
    """:tmsu_db

    Show the active database location
    """

    def execute(self):
        out = self._exec('info')
        info = self._parse_info_text(out)
        db = info['Database']
        self.fm.notify('Using tmsu database: {}'.format(db))


class tmsu_filter(TmsuMixin, Command):
    """:tmsu_filter <query>

    Mark the files in current directory that match the tmsu tag query
    """

    def execute(self):
        query_words = self.args[1:]
        if len(query_words) == 0:
            self.fm.notify('No query provided.', bad=True)
            return

        out = self._exec('files',
                '--path={}'.format(self.fm.thisdir.path),
                *query_words)
        out = out.split('\n')
        out = [os.path.abspath(f.strip()) for f in out]

        for f in self.fm.thisdir.files:
            if f.path in out:
                self.fm.thisdir.mark_item(f, True)
            else:
                self.fm.thisdir.mark_item(f, False)

        self.fm.thisdir.refilter()


    def tab(self, tabnum):
        return self._tab_tags()

Suggestions for new Vim users
=============================

Vim is more powerful than you think. Always.

1 You should keep your .vimrc in source control.

  I keep mine on `github <https://github.com/OliverUv/Configuration-files>`_.

2 Get a plugin manager.

  I use pathogen because it was the only one around when I started.
  NeoBundle, Vundle and vim-plug all seem like good and more
  user-friendly plugin managers.

  At present date I would only recommend pathogen if you want to pin
  your plugins to specific commits. It's quite possible one of the above
  plugins support that functionality as well. Have a look around.

3 Learn how to use the help system.

  `:h` is your friend. Even after using vim for over ten years, I use it
  often. If you haven't done it before, take a few hours to read through
  the tutorials and skim most of the help articles. It will give you an
  idea of vim's capabilities, so that you can look them up if you find
  that you need them.

Below you will find a list of plugins I've found useful, and a
small description of what each does. I haven't listed any language
specific plugins (such as vim-less) or plugins that only supply syntax
highlighting (such as vim-git). Google for them and you will find them.

Simple plugins that make text editing sane
==========================================

delimitMate
  Makes vim handle `() {} [] <>` things more smartly. I wouldn't use vim
  if it didn't exist.

Enter-Indent
  Makes writing code easier, as vim will put your cursor in the correct
  indentation level when you insert a new line while coding.

vim-you-keep-using-that-word
  Makes w W e E movements consistent when used with the c command.

Great plugins everyone should use
=================================

Each of these take a little bit of learning. Install these plugins one
at a time, and make sure you use it a bit before you install another
one. Otherwise you will forget you installed it, and forget how to use
it.

vim-fugitive
  Incredible plugin for using git. `This
  <http://vimcasts.org/blog/2011/05/the-fugitive-series/>`_ is the best
  resource I know for learning how it works. It is a complex plugin, so
  just reading the helpfile for it is not enough.

vim-surround
  Makes surrounding pieces of text with things super easy, lets you change
  surrounding things (i.e. from (hello) to [hello] or "hello") easily.
  Does a lot of good stuff. Use it.

vim-unimpaired
  Adds many new movements, such as [c and ]c to go between changes in diffs,
  [f and ]f to go between files in the current directory, and many more.

vim-eunuch
  Makes renaming, moving and other operations on the currently open file
  more handy.

ultisnips
  The best snippet engine available for vim. Snippets are an incredibly
  strong editor feature that nobody should be without. The `vim-snippets`
  repository tracks snippets for all the snippet engines available for
  vim.

syntastic
  Lets you lint and syntax check your files inside of vim. Can use an
  enormous amount of linters and compilers.

nerdcommenter
  A plugin that gives you keyboard shortcuts to comment in/out code.
  Handles basically every language automatically.

vim-repeat
  One of vim's most important functions is the repeat command (`.` in
  normal mode). This plugin is used by other plugins to make them work
  with the `.` command.

undotree
  Did you know undos in vim aren't a list, but a tree? Vim's built in
  commands for visiting nodes in this tree aren't the best, though. This
  plugin lets you visualize the tree and go between nodes and see their
  differences easily.

Good plugins most people should use
===================================

vim-space
  Turns normal-mode space into a key that repeats your previous jump-movement,
  like going between search results, t f T f jumps, etc. Quite handy.

vim-gutentags
  Automatically generate tags files for your projects. Makes using vim's tag
  jumping feature much more powerful.

vim-bufsurf
  Gives you browser-like back and forward buttons for your vim windows. So
  you can press <C-p> to go to the previous file, and <C-n> to go to the
  next file you were editing (in that vim window.) See `:h window` if you
  don't know what a vim window is.

  You should familiarize yourself with vim's <C-o> and <C-i> normal mode
  mappings also. They are even more useful than this plugin, but they
  let you jump back/forward within locations in files you visited as
  well.

vim-abolish
  Provides you with a text replacement command `:S` that intelligently
  handles variations on the word you are replacing.

recover.vim
  Makes recovering after crashes less annoying.

vim-exchange
  Make two pieces of text switch places.

Adding text objects
===================

One of vim's strongest features is the ability to perform operations on
text objects. For example, I can press `dip` to "delete in paragraph",
or `cas` to "change a sentence". There are plugins that add new text
objects. I have listed some of these below.

* vim-indent-object
* vim-textobj-function
* vim-textobj-user

Incredibly good plugins that are super complex
==============================================

These are plugins that I wouldn't want to live without. They change vim
from a great editor into an editor for gods. I have spent many hours
configuring them so they do what I want. Using them is a big investment,
but it pays off.

neocomplete.vim
  A very complex, but incredibly useful plugin for autocompletion. Takes
  completion suggestions from many different sources and unites them in
  one adaptable interface. Can co-operate with other plugins to give
  good support for many languages.

  Works well with clang_complete and ultisnips.

  YouCompleteMe is a competitor to neocomplete.vim - but as far as I
  know it is mostly used for C and C++.

unite.vim
  A very complex, super super powerful plugin. Creates a handy interface
  that many other plugins (and sub-plugins) can use to let you display
  and execute actions on arbitrary information. I mostly use it to:

  1 Go between files in the directory

  2 Go between recently used files

  3 Grep through files in projects

  4 Set vim's current working directory

  5 Go between functions and classes defined in the current file

  6 Choose and paste previously deleted/yanked text.

  7 Go between previously opened files.

  CtrlP is a competitor to unite.vim. It should be easier to set up, but
  is not as configurable.

Good vim plugins that may or may not be useful to you
=====================================================

There are many plugins I find useful that I haven't listed here. You can
see which I use in the dotvim/bundle directory of my Configuration-files
repository. Here are some notable plugins I like, but seldom use.

vim-sneak
  A cool way of moving around text, similar to vim's t f T F commands.

vim-man
  View man pages inside of vim. Quite slick.

colorv.vim
  Interactive palette for choosing RGB colors. Usually doesn't work in
  terminals.

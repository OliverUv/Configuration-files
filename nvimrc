" Setup {{{ "
if &compatible
  set nocompatible
endif

let g:dein#types#git#default_protocol = 'ssh'

let g:vimproc#dll_path = '~/.cache/dein/repos/github.com/Shougo/vimproc.vim/lib/vimproc_linux64.so'

" Required:
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

let deinpath = expand('~/.cache/dein')
" }}} Setup "

" Priority Settings {{{ "
" only on save because of box3. This needs to happen
" before we load ALE
let g:ale_lint_on_text_changed = 'never'
" }}} Priority Settings "

" Dein Plugin Loading {{{ "
" Setup {{{ "
if dein#load_state(deinpath)

    " Required:
    call dein#begin(deinpath)
    
    " Required: Let dein manage dein
    call dein#add('Shougo/dein.vim')
    
    " You can specify revision/branch/tag.
    " call dein#add('Shougo/vimshell', { 'rev': '3787e5' })
    " }}} Setup "

    " Auto-Completion {{{ "
    call dein#add('Shougo/deoplete.nvim')
    call dein#add('Shougo/echodoc.vim')
    call dein#add('Shougo/context_filetype.vim')
    " call dein#add('mhartington/nvim-typescript')
    call dein#local('/home/ponder/Projects', {} , ['nvim-typecript'])
    " let $NVIM_NODE_LOG_FILE='/home/ponder/nvim-node.log'
    " let $NVIM_NODE_LOG_LEVEL='warn'
    call dein#add('Rip-Rip/clang_complete.git')
    call dein#add('hrsh7th/vim-neco-calc.git')
    call dein#add('ujihisa/neco-ghc.git')
    call dein#add('ujihisa/neco-look.git')
    call dein#add('deoplete-plugins/deoplete-lsp')
    " call dein#add('Shougo/neocomplete.vim.git')
    " }}} Auto-Completion "

    " Navigation {{{ "
    " Denite {{{ "
    call dein#add('Shougo/denite.nvim.git')
    call dein#add('neoclide/denite-extra.git')
    " }}} Denite "
    " Unite {{{ "
    " Some of these are also used by Denite
    call dein#add('Shougo/unite.vim.git') " to use unite plugins
    call dein#add('Shougo/unite-help.git')
    call dein#add('Shougo/unite-outline.git')
    call dein#add('Shougo/unite-session.git')
    call dein#add('osyo-manga/unite-quickfix.git')
    call dein#add('thinca/vim-unite-history.git')
    call dein#add('tsukkee/unite-tag.git')
    call dein#add('skeept/Ultisnips-neocomplete-unite.git')
    " requires :call fruzzy#install()
    call dein#add('raghur/fruzzy.git', {'hook_post_update': 'call fruzzy#install()'})
    " }}} Unite/Denite "
    call dein#add('OliverUv/windowing.vim.git')
    " call dein#add('KabbAmine/zeavim.vim.git')
    call dein#add('Shougo/neomru.vim.git')
    call dein#add('Shougo/neoyank.vim.git')
    call dein#add('bruno-/vim-man.git')
    call dein#add('ihameed/vim-togglelist.git')
    call dein#add('justinmk/vim-sneak.git')
    call dein#add('linktohack/vim-space.git')
    call dein#add('bkad/CamelCaseMotion.git')
    " call dein#add('thinca/vim-fontzoom.git')
    call dein#add('szw/vim-maximizer.git')
    call dein#add('ton/vim-bufsurf.git')
    call dein#add('derekwyatt/vim-fswitch.git')
    " }}} Navigation "

    " IDE {{{ "
    " Language Focus {{{ "
    call dein#add('jalvesaq/Nvim-R.git') " R-lang
    call dein#add('Quramy/tsuquyomi.git') " TypeScript
    " call dein#add('davidhalter/jedi-vim.git') " Python
    " call dein#add('klen/python-mode.git')
    " call dein#add('racer-rust/vim-racer.git') " Rust .. probably defunct
    call dein#add('lukerandall/haskellmode-vim.git')
    " }}} Language Focus "
    " Editing {{{ "
    " Text Objects {{{ "
    call dein#add('kana/vim-textobj-function.git')
    call dein#add('kana/vim-textobj-user.git')
    call dein#add('wellle/targets.vim.git')
    call dein#add('michaeljsmith/vim-indent-object.git')
    call dein#add('reedes/vim-textobj-sentence.git')
    call dein#add('beloglazov/vim-textobj-quotes.git')
    call dein#add('Julian/vim-textobj-brace.git')
    call dein#add('beloglazov/vim-textobj-punctuation.git')
    call dein#add('thinca/vim-textobj-between.git')
    " Tried but found lacking {{{ "
    " Bad ones:
    " call dein#add('saaguero/vim-textobj-pastedtext.git')
    " call dein#add('haya14busa/vim-textobj-function-syntax.git')
    " Ok but found no use:
    " call dein#add('kana/vim-textobj-syntax.git')
    " call dein#add('kana/vim-textobj-line.git') " conflicts with
    " targets.vim's 'last', e.g. vil'
    " }}} Tried but found lacking "
    " }}} Text Objects "
    call dein#add('tpope/vim-abolish.git')
    call dein#add('tpope/vim-commentary.git')
    call dein#add('scrooloose/nerdcommenter.git')
    call dein#add('vim-scripts/copycppdectoimp.vim.git')
    call dein#add('tpope/vim-surround.git')
    call dein#add('ap/vim-you-keep-using-that-word.git')
    call dein#add('AndrewRadev/switch.vim.git')
    call dein#add('AndrewRadev/splitjoin.vim.git')
    call dein#add('andymass/vim-matchup.git')
    call dein#add('Raimondi/delimitMate.git')
    " call dein#add('cohama/lexima.vim.git') 
    " was very good but had some annoyances compared to delimitMate
    call dein#add('godlygeek/tabular.git')
    call dein#add('tommcdo/vim-exchange.git')
    " call dein#add('tristen/vim-sparkup.git') " HTML writing plugin
    call dein#add('vim-scripts/Enter-Indent.git')
    call dein#add('vim-scripts/RST-Tables.git')
    " call dein#add('tpope/vim-capslock.git')
    call dein#add('gu-fan/colorv.vim.git')
    call dein#add('triglav/vim-visual-increment.git')
    " }}} Editing "

    call dein#add('tpope/vim-fugitive.git')
    call dein#add('idanarye/vim-merginal.git')
    call dein#add('junegunn/gv.vim.git')
    call dein#add('w0rp/ale')
    " call dein#add('scrooloose/syntastic.git')
    call dein#add('tpope/vim-eunuch.git')
    call dein#add('OliverUv/vim-unimpaired.git')
    call dein#add('SirVer/ultisnips.git')
    call dein#add('honza/vim-snippets.git')
    call dein#add('chrisbra/Recover.vim.git')
    call dein#add('ludovicchabant/vim-gutentags.git')
    call dein#add('mattn/gist-vim.git')
    " call dein#add('marijnh/tern_for_vim.git')
    call dein#add('mbbill/undotree.git')
    call dein#add('embear/vim-localvimrc.git')
    call dein#add('stevearc/vim-arduino.git')
    call dein#add('haya14busa/incsearch.vim.git')
    call dein#add('francoiscabrol/ranger.vim.git')
    call dein#add('folke/trouble.nvim.git')
    call dein#add('klen/nvim-test')

    " LSP
    call dein#add('neovim/nvim-lspconfig')
    call dein#add('j-hui/fidget.nvim')
    call dein#add('stevearc/aerial.nvim')

    " DAP
    call dein#add('mfussenegger/nvim-dap.git')
    call dein#add("rcarriga/nvim-dap-ui.git")
    call dein#add("theHamsta/nvim-dap-virtual-text.git")

    " TREESITTER
    call dein#add('nvim-treesitter/nvim-treesitter', {'hook_post_update': 'TSUpdate'})
    " :TSInstall rust
    " https://github.com/nvim-treesitter/nvim-treesitter#available-modules

    " UNUSED

    " call dein#add('autozimu/LanguageClient-neovim', {
    "             \ 'rev': 'next',
    "             \ 'build': 'bash install.sh',
    "             \ })

    " call dein#add('dyng/ctrlsf.vim.git') " not great
    " call dein#add('tpope/vim-dispatch.git')
    " call dein#add('brooth/far.vim.git') " not working too well yet
    " }}} IDE "

    " File Types {{{ "
    call dein#add('cespare/vim-toml.git')
    call dein#add('dag/vim-fish.git')
    call dein#add('vim-scripts/rest.vim.git') " RST
    call dein#add('vim-scripts/haskell.vim.git')
    call dein#add('vim-scripts/httplog.git') " HTTP logs
    call dein#add('tpope/vim-git.git')
    call dein#add('tikhomirov/vim-glsl.git')
    call dein#add('tobym/vim-scala.git')
    call dein#add('mxw/vim-jsx.git')
    call dein#add('pangloss/vim-javascript.git')
    call dein#add('hail2u/vim-css3-syntax.git')
    call dein#add('digitaltoad/vim-jade.git')
    call dein#add('groenewege/vim-less.git')
    call dein#add('kchmck/vim-coffee-script.git')
    call dein#add('HerringtonDarkholme/yats.vim.git') " TypeScript syntax
    call dein#add('StanAngeloff/php.vim.git')
    call dein#add('PotatoesMaster/i3-vim-syntax.git')
    call dein#add('OliverUv/vim-lesscss.git')
    call dein#add('Glench/Vim-Jinja2-Syntax.git')
    call dein#add('sukima/vim-tiddlywiki.git')
    call dein#add('rust-lang/rust.vim')
    call dein#add('Shougo/neco-syntax.git') " Shougo things
    call dein#add('sudar/vim-arduino-snippets') " arduino ultisnips
    call dein#add('mracos/mermaid.vim') " .mmd .mermaid
    call dein#add('LnL7/vim-nix') " .nix
    " }}} File Types "

    " Libs {{{ "
    call dein#add('tpope/vim-repeat.git')
    call dein#add('Shougo/tabpagebuffer.vim.git')
    call dein#add('MarcWeber/vim-addon-mw-utils.git')
    call dein#add('tomtom/tlib_vim.git')
    call dein#add('Shougo/vimproc.vim.git')
    call dein#add('vim-scripts/L9.git')
    call dein#add('mattn/webapi-vim.git')
    call dein#add("nvim-neotest/nvim-nio")
    " }}} Libs "

    " Bling {{{ "
    " call dein#add('HampusHauffman/block.nvim') " needs updated nvim probably
    " call dein#add('jaxbot/semantic-highlight.vim.git') " too crazy + seems to not work
    call dein#add('skammer/vim-css-color.git')
    " call dein#add('romainl/flattened.git') " color scheme
    call dein#add('junegunn/goyo.vim.git')
    call dein#add('nathanaelkane/vim-indent-guides.git')
    call dein#add('HiPhish/rainbow-delimiters.nvim.git')
    " call dein#add('morhetz/gruvbox.git') " color scheme
    " call dein#add('abudden/taghighlight-automirror.git')
    " call dein#add('godlygeek/csapprox.git')
    " call dein#add('gerw/vim-HiLinkTrace.git')
    " call dein#add('airblade/vim-gitgutter.git') " Didn't find it useful enough
    " }}} Bling "

    " Management {{{ "
    " call dein#add('blindFS/vim-taskwarrior.git')
    " call dein#add('tbabej/taskwiki.git')
    call dein#add('vimwiki/vimwiki.git')
    " }}} Management "

    " Misc {{{ "
    call dein#add('vim-scripts/VST.git') " Export to HTML
    " }}} Misc "

    " Finish Setup {{{ "
        " Required:
        call dein#end()
        call dein#save_state()
    endif
    " }}} Finish Setup "
" }}} Dein Plugin Loading "

" Plugin Settings {{{ "

" Deoplete {{{ "
let g:deoplete#enable_at_startup = 1

" " file complete sources from buffer dir instead of current dir
" " used to have it until it broke, but don't think I even want it now?
" let g:deoplete#file#enable_buffer_path = 1

" No preview window
set completeopt-=preview
" More completions
let g:nvim_typescript#max_completion_detail = 100

inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function() abort
    return deoplete#close_popup() . "\<CR>"
endfunction

" }}} Deoplete "

" ALE {{{ "
" only on save because of box3
let g:ale_lint_on_text_changed = 'never'
let g:ale_warn_about_trailing_whitespace = 0
let g:ale_sign_error = '-▶'
let g:ale_sign_warning = '-◈'
let g:ale_sign_info = '-◇'
let g:ale_linters = {
\   'rust': [
\       'rust-analyzer',
\   ],
\}

let g:ale_rust_rls_executable = '~/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/rust-analyzer'
" let g:ale_rust_rls_executable = 'rust-analyzer'
" let g:ale_rust_rls_toolchain = ''

let g:ale_fixers = {
\   'rust': [
\       'analyzer',
\   ],
\   'typescript': [
\       'tslint',
\       'remove_trailing_lines',
\       'trim_whitespace',
\   ],
\}
nmap <leader>ma <Plug>(ale_fix)
nmap <silent> [w <Plug>(ale_previous_wrap)
nmap <silent> ]w <Plug>(ale_next_wrap)
" }}} ALE "

" LanguageClient-neovim {{{ "
" '~/.cargo/bin/rust-analyzer'
" '~/.cargo/bin/rustup', 'run', 'stable', 'rls'
" '~/.cargo/bin/rustup', 'run', 'nightly', 'rust-analyzer'
let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'nightly', 'rust-analyzer'],
    \ }

let g:LanguageClient_autoStart = 1
let g:LanguageClient_useVirtualText = "No"

" }}} LanguageClient-neovim "

" folke trouble.nvim {{{ "

nnoremap <silent> <leader>jc :Trouble diagnostics toggle<cr>
nnoremap <silent> <leader>jC :Trouble diagnostics toggle filter.buf=0<cr>
" nnoremap <silent> <leader>je :Trouble lsp toggle focus=false win.position=right<cr>
" nnoremap <silent> <leader>jj :Trouble<cr>

lua << EOF
  require("trouble").setup {
    position = "right",
    width = 80,
    height = 15,
    padding = false,
    icons = {
        indent = {
            top           = "│ ",
            middle        = "├╴",
            last          = "└╴",
            -- last          = "-╴",
            -- last       = "╰╴", -- rounded
            fold_open     = "v",
            fold_closed   = ">",
            ws            = "  ",
        },
        folder_open = "v",
        folder_closed = ">",
    },
    indent_lines = false, -- add an indent guide below the fold icons
    signs = {
        -- icons / text used for a diagnostic
        error = "-▶",
        warning = "-◈",
        hint = "-◇",
        information = "-◇"
    },
    use_diagnostic_signs = false -- enabling this will use the signs defined in your lsp client
  }
EOF
" }}} folke trouble.nvim "

" nvim-lspconfig {{{ "

lua << EOF

-- Only show Error signs in gutter
local orig_set_signs = vim.lsp.diagnostic.set_signs
local set_signs_limited = function(diagnostics, bufnr, client_id, sign_ns, opts)
  opts = opts or {}
  opts.severity_limit = "Error"
  orig_set_signs(diagnostics, bufnr, client_id, sign_ns, opts)
end
vim.lsp.diagnostic.set_signs = set_signs_limited

-- this function is called when an LS server is attached
-- to a buffer
local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end    
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end    

    -- Enable completion triggered by <c-x><c-o>    
    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')    

    local opts = { noremap=true, silent=true }

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    buf_set_keymap('n', '<leader>jG', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', '<leader>jg', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', '<leader>jk', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    -- buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    -- buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    -- buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    buf_set_keymap('n', '<leader>jq', '<cmd>lua vim.lsp.stop_client(vim.lsp.get_active_clients())<CR>', opts)
    buf_set_keymap('n', '<leader>jt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', '<leader>jR', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', '<leader>jf', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    buf_set_keymap('n', '<leader>jr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '<leader>ja', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
    buf_set_keymap('n', '[w', '<cmd>lua vim.diagnostic.goto_prev({severity="WARN"})<CR>', opts)
    buf_set_keymap('n', ']w', '<cmd>lua vim.diagnostic.goto_next({severity="WARN"})<CR>', opts)
    buf_set_keymap('n', '[e', '<cmd>lua vim.diagnostic.goto_prev({severity="ERROR"})<CR>', opts)
    buf_set_keymap('n', ']e', '<cmd>lua vim.diagnostic.goto_next({severity="ERROR"})<CR>', opts)
    -- buf_set_keymap('n', '<leader>jq', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
    buf_set_keymap('n', '<leader>jF', '<cmd>lua vim.lsp.buf.format{ async = true }<CR>', opts)

end

require'lspconfig'.rust_analyzer.setup {
    cmd = { '/home/ponder/.cargo/bin/rustup', 'run', 'nightly', 'rust-analyzer' },
    on_attach = on_attach,
    settings = {
        ["rust-analyzer"] = {
            diagnostics = {
                enable = true,
                disabled = {"unresolved-proc-macro", "macro-error"},
                enableExperimental = true, -- might have false positives
            },
            procMacro = {
                enable = true,
                attributes = {
                    enable = true
                },
            },
            cargo = {
                -- features = "all", -- this is supposed to work, but doesn't
                allFeatures = true, -- not mentioned in https://rust-analyzer.github.io/manual.html#configuration
                buildScripts = {
                    enable = true
                },
            },
            assist = {
                importGranularity = "module",
                importPrefix = "self",
            },
        }
    },
}
EOF

" }}} nvim-lspconfig "

" nvim-treesitter {{{ "
lua << EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = true,
  },
}
EOF
" }}} nvim-treesitter "

" aerial.nvim {{{ "
lua << EOF
require('aerial').setup({
  -- optionally use on_attach to set keymaps when aerial has attached to a buffer
  on_attach = function(bufnr)
    -- Jump forwards/backwards with '{' and '}'
    vim.keymap.set('n', '[[', '<cmd>AerialPrev<CR>', {buffer = bufnr})
    vim.keymap.set('n', ']]', '<cmd>AerialNext<CR>', {buffer = bufnr})
  end
})
-- You probably also want to set a keymap to toggle aerial
vim.keymap.set('n', '<leader>js', '<cmd>AerialToggle!<CR>')
EOF
" }}} aerial.nvim "

" debug adapter protocol dap DAP nvim-dap {{{ "
lua << EOF
local dap = require('dap')
local dapui = require("dapui")

dapui.setup()

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

require("nvim-dap-virtual-text").setup {
    enabled = true,                        -- enable this plugin (the default)
    enabled_commands = true,               -- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)
    highlight_changed_variables = true,    -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
    highlight_new_as_changed = false,      -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
    show_stop_reason = true,               -- show stop reason when stopped for exceptions
    commented = false,                     -- prefix virtual text with comment string
    only_first_definition = true,          -- only show virtual text at first definition (if there are multiple)
    all_references = false,                -- show virtual text on all all references of the variable (not only definitions)
    filter_references_pattern = '<module', -- filter references (not definitions) pattern when all_references is activated (Lua gmatch pattern, default filters out Python modules)
    -- experimental features:
    virt_text_pos = 'eol',                 -- position of virtual text, see `:h nvim_buf_set_extmark()`
    all_frames = false,                    -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
    virt_lines = false,                    -- show virtual lines instead of virtual text (will flicker!)
    virt_text_win_col = nil                -- position the virtual text at a fixed window column (starting from the first text column) ,
                                           -- e.g. 80 to position at column 80, see `:h nvim_buf_set_extmark()`
}

dap.adapters.codelldb = {
  type = 'server',
  port = '${port}',
  executable = {
    command = '/home/ponder/apps/codelldb-x86_64-linux/extension/adapter/codelldb',
    args = {'--port', '${port}'},

    -- On windows you may have to uncomment this:
    -- detached = false,
  }
}

-- `cargo test --lib --no-run` to find the executable name of unit tests

local codelldb_file = {
    name = 'launch file',
    type = 'codelldb',
    request = 'launch',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    sourceLanguages = {'rust'}, -- supposed to help with panic catches, but doesn't
}

local codelldb_file_arg = {
    name = 'launch file with arg',
    type = 'codelldb',
    request = 'launch',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    args = function()
      local argument_string = vim.fn.input('Program arguments: ')
      return vim.fn.split(argument_string, " ", true)
    end,
    -- args = {function()
    --     return vim.fn.input('Arg: ')
    -- end},
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    sourceLanguages = {'rust'}, -- supposed to help with panic catches, but doesn't
}

local codelldb_cargo = {
    name = 'cargo test',
    type = 'codelldb',
    request = 'launch',
    cargo = {
        args = {'test', '--no-run', '--lib'}, -- Cargo command line to build the debug target
        -- 'args': ['build', '--bin=foo'] is another possibility
        -- filter = { -- Filter applied to compilation artifacts (optional)
        --     name = 'mylib',
        --     kind = 'lib'
        -- }
    }
}

dap.configurations.rust = {
    codelldb_file,
    codelldb_file_arg,
    codelldb_cargo -- should work ish but doesn't, maybe cargo isn't supported by dap
}

-- Automate better: https://www.reddit.com/r/neovim/comments/pzm3d8/nvimdap_any_way_to_configure_launch_to_ask_for/
-- :help lua-vimscript

-- *cargo/Vec not working: https://github.com/vadimcn/vscode-lldb/blob/master/MANUAL.md#rust-language-support
-- * if I get cargo support working this looks ok: https://github.com/vadimcn/vscode-lldb/issues/35#issuecomment-613092365
-- formatting vars when printing: `var,x` where x specifies the format: https://github.com/vadimcn/vscode-lldb/blob/v1.4.5/MANUAL.md#formatting
--      x hex, o octa, d decimal, u unsigned decimal, b binary, f float (reinterpret bits, no cast), p pointer, s c-string, y bytes, Y bytes with ascii, [n] reinterpret as array of n elements

-- -- If you want to use this for Rust and C, add something like this:
-- dap.configurations.cpp = { codelldb_file }
-- dap.configurations.c = { codelldb_file }
-- dap.configurations.rust = dap.configurations.cpp

-- code lens ?? https://github.com/ericpubu/lsp_codelens_extensions.nvim

EOF

nnoremap <silent> <leader><leader>h <Cmd>lua require'dap'.continue()<CR>
nnoremap <silent> <leader><leader>l <Cmd>lua require'dap'.step_over()<CR>
nnoremap <silent> <leader><leader>j <Cmd>lua require'dap'.step_into()<CR>
nnoremap <silent> <leader><leader>k <Cmd>lua require'dap'.step_out()<CR>

nnoremap <silent> <leader><leader>J <Cmd>lua require'dap'.down()<CR>
nnoremap <silent> <leader><leader>K <Cmd>lua require'dap'.up()<CR>
nnoremap <silent> <leader><leader>L <Cmd>lua require'dap'.run_to_cursor()<CR>

nnoremap <silent> <leader><leader>q <Cmd>lua require'dap'.terminate()<CR>

nnoremap <silent> <leader><leader>c <Cmd>lua require'dap'.clear_breakpoints()<CR>
nnoremap <silent> <leader><leader>b <Cmd>lua require'dap'.toggle_breakpoint()<CR>
nnoremap <silent> <leader><leader>B <Cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
nnoremap <silent> <leader><leader>p <Cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
nnoremap <silent> <leader><leader>r <Cmd>lua require'dap'.repl.open()<CR>
nnoremap <silent> <leader><leader>R <Cmd>lua require'dap'.run_last()<CR>
nnoremap <silent> <leader><leader>A <Cmd>lua require'dapui'.open()<CR>
nnoremap <silent> <leader><leader>a <Cmd>lua require'dapui'.close()<CR>

" }}} debug adapter protocol dap nvim-dap "

" block.nvim {{{ "
" lua << EOF
" ---@field percent number  -- The change in color. 0.8 would change each box to be 20% darker than the last and 1.2 would be 20% brighter.
" ---@field depth number -- De depths of changing colors. Defaults to 4. After this the colors reset. Note that the first color is taken from your "Normal" highlight so a 4 is 3 new colors.
" ---@field automatic boolean -- Automatically turns this on when treesitter finds a parser for the current file.
" ---@field colors string [] | nil -- A list of colors to use instead. If this is set percent and depth are not taken into account.
" require("block").setup({
"     percent = 0.8,
"     depth = 4,
"     colors = nil,
"     automatic = false,
" --    colors = {
" --       "#ff0000"
" --       "#00ff00"
" --       "#0000ff"
" --    }
" })
" EOF
" }}} block.nvim "

" rainbow-delimiters {{{ "
let g:rainbow_delimiters = {
    \ 'highlight': [
        \ 'RainbowDelimiterRed',
        \ 'RainbowDelimiterYellow',
        \ 'RainbowDelimiterBlue',
        \ 'RainbowDelimiterOrange',
        \ 'RainbowDelimiterGreen',
        \ 'RainbowDelimiterViolet',
        \ 'RainbowDelimiterCyan',
        \ 'RainbowDelimiterOne',
        \ 'RainbowDelimiterTwo',
        \ 'RainbowDelimiterThree',
        \ 'RainbowDelimiterFour',
        \ 'RainbowDelimiterFive',
        \ 'RainbowDelimiterSix',
    \ ],
\ }
" }}} rainbow-delimiters "

" Misc {{{ "
let g:gutentags_ctags_exclude = ['node_modules', 'build', 'dist']
let g:echodoc#enable_at_startup = 1

lua << EOF
require'fidget'.setup{}
require'nvim-test'.setup()
require('nvim-test.runners.cargo-test'):setup { package = true }
EOF
nnoremap <silent> <leader>ju :<C-u>TestSuite<CR>
" }}} Misc "

" }}} Plugin Settings "

" Neovim Config {{{ "

" Terminal Mode {{{ "

tnoremap <Esc> <C-\><C-n>
tnoremap <leader><Esc> <Esc>
tnoremap <expr> <C-R> '<C-\><C-N>"'.nr2char(getchar()).'pi'

" }}} Terminal Mode "

lua << EOF

    -- <leader>jz to swap between virtualtext and virtualline diagnostics
    vim.g.ouv_vlines = false
    local diag_conf_default = {
        virtual_text = {
            virt_text_pos = 'eol_right_align',
            hl_mode = 'replace',
        },
        virtual_lines = false,
    }
    vim.diagnostic.config(diag_conf_default)

    vim.keymap.set('n', '<leader>jz', function()
        vim.g.ouv_vlines = not vim.g.ouv_vlines
        local new_config = vim.deepcopy(diag_conf_default, true)
        if vim.g.ouv_vlines then
            new_config.virtual_text = false
            new_config.virtual_lines = true
        end
        vim.diagnostic.config(new_config)
    end, { desc = 'Toggle diagnostic virtual_lines' })

EOF

set pumblend=15
set winblend=0
set inccommand=nosplit

" }}} neovim config "


" Required:
filetype plugin indent on

" If you want to install not installed plugins on startup.
" if dein#check_install()
"   call dein#install()
" endif

" Color Settings {{{ "
set t_ut=
set termguicolors
let rcmfile = '/tmp/termcolor'
if filereadable(rcmfile)
    let rrr = readfile(rcmfile)
    if matchstr(rrr[0], '^1')
        colorscheme proton
    else
        colorscheme liquorice
    endif
else
    colorscheme liquorice
endif
" }}} Color Settings "

let sharedrc = expand('~/Configuration-files/vim8_nvim_rc.vim')
if filereadable(sharedrc)
    exec "source " . sharedrc
endif

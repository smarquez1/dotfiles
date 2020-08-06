set mouse=a " Enable mouse
set ignorecase smartcase " Configure search
set nobackup nowb " No backups
set noswapfile " No swapfile
set inccommand=nosplit " Enable live substitution
set number relativenumber numberwidth=2 " Show line numbers
set splitbelow splitright " more Natural splits behaviour
set wrap linebreak breakindent " Wrap text
" Customize breakline symbol
set showbreak=↪\  
" set clipboard=unnamedplus " Use system's clipboard. (linux)
set clipboard=unnamed " Use system's clipboard.
set hidden " Keep undo history for hidden buffers
set completeopt+=noinsert " do not insert until the user selects a match
set completeopt+=menuone " show the menu when there\s only one match
" Ident using 2 spaces
set expandtab smarttab shiftwidth=2 softtabstop=2 tabstop=2
set foldmethod=indent foldlevel=99 " Enable folding by default

" START: Experimental (from coc readme)
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes
" trigger autoread everytime you focus the window or enter the buffer
set autoread
autocmd! FocusGained,BufEnter * checktime

" Theme
set termguicolors
colorscheme onedark

" Filetype specific settings
" ==========================
" Markdown
au FileType markdown setl spell " Enable spelling

" Terminal
au BufEnter term://* startinsert " Start on insert mode.
au TermOpen * setlocal nonumber norelativenumber " No line numbers

" Yaml (necessary?)
au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml foldmethod=indent
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" Diff
if &diff
  set cursorline
endif
highlight! link DiffText MatchParen

" Enable treesitter
" lua <<EOF
" require'nvim-treesitter.configs'.setup {
"     highlight = {
"       enable = true,                    -- false will disable the whole extension
"       disable = { "c", "rust" },        -- list of language that will be disabled
"       custom_captures = {               -- mapping of user defined captures to highlight groups
"         -- ["foo.bar"] = "Identifier"   -- highlight own capture @foo.bar with highlight group "Identifier", see :h nvim-treesitter-query-extensions
"       },
"     },
"     incremental_selection = {
"       enable = true,
"       disable = { "cpp", "lua" },
"       keymaps = {                       -- mappings for incremental selection (visual mappings)
"         init_selection = "gnn",         -- maps in normal mode to init the node/scope selection
"         node_incremental = "grn",       -- increment to the upper named parent
"         scope_incremental = "grc",      -- increment to the upper scope (as defined in locals.scm)
"         node_decremental = "grm",       -- decrement to the previous node
"       }
"     },
"     refactor = {
"       highlight_definitions = {
"         enable = true
"       },
"       highlight_current_scope = {
"         enable = true
"       },
"       smart_rename = {
"         enable = true,
"         keymaps = {
"           smart_rename = "grr"          -- mapping to rename reference under cursor
"         }
"       },
"       navigation = {
"         enable = true,
"         keymaps = {
"           goto_definition = "gnd",      -- mapping to go to definition of symbol under cursor
"           list_definitions = "gnD"      -- mapping to list all definitions in current file
"         }
"       }
"     },
"     textobjects = { -- syntax-aware textobjects
"     enable = true,
"     disable = {},
"     keymaps = {
"         ["iL"] = { -- you can define your own textobjects directly here
"           python = "(function_definition) @function",
"           cpp = "(function_definition) @function",
"           c = "(function_definition) @function",
"           java = "(method_declaration) @function"
"         },
"         -- or you use the queries from supported languages with textobjects.scm
"         ["af"] = "@function.outer",
"         ["if"] = "@function.inner",
"         ["aC"] = "@class.outer",
"         ["iC"] = "@class.inner",
"         ["ac"] = "@conditional.outer",
"         ["ic"] = "@conditional.inner",
"         ["ae"] = "@block.outer",
"         ["ie"] = "@block.inner",
"         ["al"] = "@loop.outer",
"         ["il"] = "@loop.inner",
"         ["is"] = "@statement.inner",
"         ["as"] = "@statement.outer",
"         ["ad"] = "@comment.outer",
"         ["am"] = "@call.outer",
"         ["im"] = "@call.inner"
"       }
"     },
"     ensure_installed = "all" -- one of "all", "language", or a list of languages
" }
" EOF

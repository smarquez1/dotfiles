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
set clipboard=unnamedplus " Use system's clipboard.
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
colorscheme dracula

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

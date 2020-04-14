set mouse=a " Enable mouse
set ignorecase smartcase " Configure search
set nobackup nowb noswapfile " No backup or swapfile
set inccommand=nosplit " Enable live substitution
set number relativenumber numberwidth=2 " Show line numbers
set wrap linebreak breakindent " Wrap text
set splitbelow splitright " more Natural splits behaviour
set clipboard=unnamedplus " Use system's clipboard.
set hidden " Keep undo history for hidden buffers
set completeopt+=noinsert " do not insert until the user selects a match
" set completeopt+=noselect " do not select a match in the menu
set completeopt+=menuone " show the menu when there\s only one match
" Customize breakline symbol
set showbreak=↪\ 
" Ident using 2 spaces
set expandtab smarttab shiftwidth=2 softtabstop=2 tabstop=2
set foldmethod=indent foldlevel=99 " Enable folding by default

" Theme
set termguicolors
colorscheme dracula

" Filetype specific settings
" ==========================
au BufEnter term://* startinsert " Start terminal on insert mode.
au FileType markdown setl spell " Enable spelling on markdown files
au TermOpen * setlocal nonumber norelativenumber " No line numbers in terminal mode

" Show help in a vertical buffer
augroup vimrc_help
  autocmd!
  autocmd BufEnter *.txt if &buftype == 'help' | wincmd L | endif
augroup END

set mouse=a " Enable mouse
set ignorecase smartcase " Configure search
set nobackup nowb " No backups
set noswapfile " No swapfile
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

" START: Experimental (from coc readme)
" TextEdit might fail if hidden is not set.
set hidden
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes
" END: Experimental (from coc readme)

" Theme
set termguicolors
colorscheme dracula

" Filetype specific settings
" ==========================
au BufEnter term://* startinsert " Start terminal on insert mode.
au FileType markdown setl spell " Enable spelling on markdown files

" No line numbers in terminal mode
au TermOpen * setlocal nonumber norelativenumber

" add yaml stuffs (necessary?)
au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml foldmethod=indent
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" Show help in a vertical buffer
augroup vimrc_help
  autocmd!
  autocmd BufEnter *.txt if &buftype == 'help' | wincmd L | endif
augroup END

" trigger autoread everytime you focus the window or enter the buffer
set autoread
autocmd! FocusGained,BufEnter * checktime

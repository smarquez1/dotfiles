set mouse=a " Enable mouse
set ignorecase smartcase " Configure search
set nobackup nowb noswapfile " No backup or swapfile
set shell=zsh " Use zsh as shell
set inccommand=nosplit " Enable live substitution
set number relativenumber numberwidth=2 " Show line numbers
set wrap linebreak breakindent " Wrap text
set splitbelow splitright " more Natural splits behaviour
set clipboard=unnamedplus " Use system's clipboard.
set hidden " Keep undo history for hidden buffers
set updatetime=250

" Customize breakline symbol
set showbreak=↪\ 
" Ident using 2 spaces
set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab shiftround
set foldmethod=indent foldlevel=99 " Enable folding by default
set formatoptions+=j " Delete comment character when joining commented lines

" Configure wildmenu
set wildoptions +=pum
if &wildoptions == "pum"
  cnoremap <up> <c-p>
  cnoremap <down> <c-n>
endif

" Theme
" According to :h xterm-true-color
" t_8f and t_8b are only set when $TERM is xterm*
" In tmux, $TERM is screen by default.
" Therefore, we have to set them explicitly here.
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors
let g:onedark_terminal_italics = 1
let g:airline_theme='onedark'
colorscheme onedark

" Filetype specific settings
" ==========================
au BufEnter term://* startinsert " Start terminal on insert mode.
au FileType markdown setl spell " Enable spelling on markdown files
au TermOpen * setlocal nonumber norelativenumber " No line numbers in terminal mode

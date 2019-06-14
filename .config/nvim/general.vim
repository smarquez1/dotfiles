set mouse=a " Enable mouse
set scrolloff=5 " Scroll extra lines when reaching the bottom
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
" set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab shiftround
set tabstop=2 shiftwidth=2
set foldmethod=indent foldlevel=99 " Enable folding by default
set formatoptions+=j " Delete comment character when joining commented lines

" Configure wildmenu
set wildoptions +=pum
if &wildoptions == "pum"
  cnoremap <up> <c-p>
  cnoremap <down> <c-n>
endif

" Theme
set termguicolors
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1
colorscheme OceanicNext

" Filetype specific settings
" ==========================
au BufEnter term://* startinsert " Start terminal on insert mode.
au FileType markdown setl spell " Enable spelling on markdown files
au TermOpen * setlocal nonumber norelativenumber " No line numbers in terminal mode

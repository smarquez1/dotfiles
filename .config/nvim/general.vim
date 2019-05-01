set mouse=a " Enable mouse
set scrolloff=5 " Scroll extra lines when reaching the bottom
set ignorecase smartcase " Configure search
set nobackup nowb noswapfile " No backup or swapfile
set shell=zsh " Use zsh as shell
set inccommand=nosplit " Enable live substitution
set number relativenumber numberwidth=2 " Show line numbers
set wrap linebreak breakindent " Wrap text
set splitbelow splitright

" Use system's clipboard. Keep platform specific settings
set clipboard=unnamed,unnamedplus

" Prefer Neovim terminal insert mode to normal mode.
autocmd BufEnter term://* startinsert

" Customize breakline symbol
set showbreak=↪\ 

" Use tabs as spaces, default identation: 2 spaces
set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab shiftround

set foldmethod=indent foldlevel=99 " Enable folding by default
set formatoptions+=j " Delete comment character when joining commented lines

" Configure wildmenu
set wildoptions +=pum
if &wildoptions == "pum"
  cnoremap <up> <c-p>
  cnoremap <down> <c-n>
endif

" performance fixes
set synmaxcol=200

" Theme
set termguicolors
" colorscheme base16-eighties
" hi VertSplit guibg=bg guifg=fg
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1
colorscheme OceanicNext

" Filetype specific settings
" ==========================
au FileType markdown setl spell " Enable spelling on markdown files
au TermOpen * setlocal nonumber norelativenumber " No line numbers in terminal mode

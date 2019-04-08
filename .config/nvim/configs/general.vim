set mouse=a " Enable mouse
set scrolloff=5 " Scroll extra lines when reaching the bottom
set ignorecase smartcase " Configure search
set nobackup nowb noswapfile " No backup or swapfile
set shell=zsh " Use zsh as shell
set inccommand=nosplit " Enable live substitution
set number relativenumber numberwidth=2 " Show line numbers
set splitbelow splitright " Areas where the splits should occur
set wrap linebreak breakindent " Wrap text

" Use system's clipboard. Keep platform specific settings
set clipboard=unnamed,unnamedplus

" Prefer Neovim terminal insert mode to normal mode.
autocmd BufEnter term://* startinsert

" Customize breakline symbol
set showbreak=↪\ 
set cc=81 " Highlight column at 81

" Use tabs as spaces, default identation: 2 spaces
set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab shiftround

set foldmethod=indent foldlevel=99 " Enable folding by default
set formatoptions+=j " Delete comment character when joining commented lines

"
set wildoptions +=pum
if &wildoptions == "pum"
  cnoremap <up> <c-p>
  cnoremap <down> <c-n>
endif

" performance fixes
" set regexpengine=1
set synmaxcol=400

" Enable true color
set termguicolors
set background=dark
colorscheme base16-eighties
hi VertSplit guibg=bg guifg=fg

" Filetype specific settings
" ==========================
au FileType javascript,html,eruby,vue setl cc=101 " Highlight column at 101
au FileType markdown setl spell " Enable spelling on markdown files
au TermOpen * setlocal nonumber norelativenumber " No line numbers in terminal mode

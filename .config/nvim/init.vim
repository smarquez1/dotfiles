" Enable mouse
set mouse=a
 " Configure search
set ignorecase smartcase
" Enable live substitution
set inccommand=nosplit
 " No backups or swapfile
set nobackup nowritebackup noswapfile
" Keep undo history for hidden buffers
set hidden
" Show line numbers
set number relativenumber
" more Natural splits behaviour
set splitbelow splitright
" Wrap text
set linebreak breakindent
" Show breakline symbol
set showbreak=↪\  
" Use system's clipboard
set clipboard=unnamedplus
" Ident using 2 spaces by default
set expandtab smarttab shiftwidth=2 softtabstop=2 tabstop=2
" Enable folding by default
set foldmethod=indent foldlevel=99
" Always show the signcolumn
" set signcolumn=yes
" Highlight the screen line of the cursor with CursorLine
" set cursorline
" Support 24 bit color
set termguicolors

" trigger autoread everytime you focus the window or enter the buffer
autocmd! FocusGained,BufEnter * checktime

" ft=markdown
 " Enable spelling
au FileType markdown setl spell

" ft=terminal
" Start on insert mode.
au BufEnter term://* startinsert
" No line numbers
au TermOpen * setlocal nonumber norelativenumber

" KEY MAPPINGS
" map leader to space
let mapleader = " "
" Semicolon is colon
map ; :
" Save file
map <leader>w :w <cr>
" Quicker window movement
nmap <c-j> <c-w>j
nmap <c-k> <c-w>k
nmap <c-l> <c-w>l
nmap <c-h> <c-w>h
" Make navigation into and out of Neovim terminal splits nicer.
tmap <C-h> <C-\><C-N><C-w>h
tmap <C-j> <C-\><C-N><C-w>j
tmap <C-k> <C-\><C-N><C-w>k
tmap <C-l> <C-\><C-N><C-w>l
" Easy splitting
map <leader>s :split <cr>
map <leader>v :vsplit <cr>
" Cancel a search with Escape:
nmap <silent> <Esc> :nohlsearch<Bar>:echo<CR>
" Escape from terminal goes to normal mode
" tmap <Esc> <C-\><C-n>
" map . in visual mode
vmap . :norm.<cr>
" unmap ex mode: 'Type visual to go into Normal mode.'
nmap Q <nop>
" Replace hashrockets with 1.9 hash style syntax
nmap <leader>: :%s/:\(\w\+\)\s*=>\s*/\1: /g <cr>

" diff
if &diff
  map <C-J> ]c
  map <C-K> [c
endif

" Plugin configuration
source $HOME/.config/nvim/plugins.vim

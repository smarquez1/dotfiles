" Support 24 bit color
set termguicolors
" Enable mouse
set mouse=a
 " Configure search
set ignorecase smartcase
 " No backups or swapfile
set nobackup nowritebackup noswapfile
 " Enable live substitution
set inccommand=nosplit
" Show line numbers
set number relativenumber numberwidth=2
" more Natural splits behaviour
set splitbelow splitright
" Wrap text
set linebreak breakindent
" Show breakline symbol
set showbreak=↪\  
" Use system's clipboard
set clipboard=unnamedplus
 " Keep undo history for hidden buffers
set hidden
" Ident using 2 spaces
set expandtab smarttab shiftwidth=2 softtabstop=2 tabstop=2
" Enable folding by default
" set foldmethod=indent foldlevel=99
" Tree-sitter based folding.
set foldlevel=99
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
" Always show the signcolumn
set signcolumn=yes
" trigger autoread everytime you focus the window or enter the buffer
autocmd! FocusGained,BufEnter * checktime
" Highlight the screen line of the cursor with CursorLine
set cursorline

" ft=markdown
 " Enable spelling
au FileType markdown setl spell

" ft=terminal
" Start on insert mode.
au BufEnter term://* startinsert
" No line numbers
au TermOpen * setlocal nonumber norelativenumber

" KEY MAPPINGS
" map Leader
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

" General configuration
luafile $HOME/.config/nvim/utils.lua
source $HOME/.config/nvim/plugins.vim

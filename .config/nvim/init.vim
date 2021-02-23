" Enable mouse
set mouse=a
" Allow using local nvimrc #forbid autocmd in these (?)
" set exrc secure
set exrc
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
set clipboard=unnamed,unnamedplus
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
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300
" Highlight columns at 80 chars
" au BufRead,BufNewFile * setlocal textwidth=80
" set cc=+1
" Highlight cursor
" set cursorline
" number of lines to scroll when the cursor gets off the screen
set sidescrolloff=5 scrolloff=5
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
tmap <c-h> <c-\><c-n><c-w>h
tmap <c-j> <c-\><c-n><c-w>j
tmap <c-k> <c-\><c-n><c-w>k
tmap <c-l> <c-\><c-n><c-w>l
" Easy splitting
map <leader>s :split <cr>
map <leader>v :vsplit <cr>
" Cancel a search with Escape:
nmap <silent> <Esc> :nohlsearch<Bar>:echo<CR> " Escape from terminal goes to normal mode
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

" Snippets
" Completion does not select anything automatically
set completeopt=menuone,noselect
" Do not display "Pattern not found" messages during completion.
set shortmess+=c
" Navigate popup menues with j and k
inoremap <expr> <C-J> pumvisible() ? "\<c-n>" : "j"
inoremap <expr> <C-K> pumvisible() ? "\<c-p>" : "k"
" Plugin configuration
source $HOME/.config/nvim/plugins.vim

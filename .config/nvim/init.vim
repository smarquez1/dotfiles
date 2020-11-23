
" Support 24 bit color
set termguicolors
" Enable mouse
set mouse=a
 " Configure search
set ignorecase smartcase
 " No backups or swapfile
set nobackup nowb noswapfile
 " Enable live substitution
set inccommand=nosplit
" Show line numbers
set number relativenumber numberwidth=2
" more Natural splits behaviour
set splitbelow splitright
" Wrap text
set wrap linebreak breakindent
" Customize breakline symbol
set showbreak=↪\  
" Use system's clipboard
set clipboard=unnamedplus
 " Keep undo history for hidden buffers
set hidden
" Ident using 2 spaces
set expandtab smarttab shiftwidth=2 softtabstop=2 tabstop=2
" Enable folding by default
set foldmethod=indent foldlevel=99
"
set completeopt=menuone,noinsert,noselect
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
" Always show the signcolumn
set signcolumn=yes
" trigger autoread everytime you focus the window or enter the buffer
set autoread
autocmd! FocusGained,BufEnter * checktime
" Highlight the screen line of the cursor with CursorLine
set cursorline
" ft=markdown
au FileType markdown setl spell " Enable spelling
" ft=terminal
au BufEnter term://* startinsert " Start on insert mode.
au TermOpen * setlocal nonumber norelativenumber " No line numbers

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
" Tab management
nmap <leader>c :tabnew<CR>
nmap <leader>1 1gt
nmap <leader>2 2gt
nmap <leader>3 3gt
" Replace hashrockets with 1.9 hash style syntax
nmap <leader>: :%s/:\(\w\+\)\s*=>\s*/\1: /g <cr>
" Cancel a search with Escape:
nmap <silent> <Esc> :nohlsearch<Bar>:echo<CR>
" Escape from terminal goes to normal mode
" tmap <Esc> <C-\><C-n>
" map . in visual mode
vmap . :norm.<cr>
" unmap ex mode: 'Type visual to go into Normal mode.'
nmap Q <nop>
" saner cursor positioning after yanking blocks
vmap <expr>y "my\"" . v:register . "y`y"

" diff
if &diff
  map <C-J> ]c
  map <C-K> [c
endif

" General configuration
luafile $HOME/.config/nvim/utils.lua
luafile $HOME/.config/nvim/lsp.lua

" Plugin configuration
source $HOME/.config/nvim/plugins.vim
source $HOME/.config/nvim/plugins/coc_config.vim
source $HOME/.config/nvim/plugins/ctrlsf_config.vim
source $HOME/.config/nvim/plugins/emmet_config.vim
source $HOME/.config/nvim/plugins/fugitive_config.vim
source $HOME/.config/nvim/plugins/vim_rails_config.vim
source $HOME/.config/nvim/plugins/vim_test_config.vim
" luafile $HOME/.config/nvim/plugins/galaxyline_config.lua
luafile $HOME/.config/nvim/plugins/nvim_colorizer_config.lua
luafile $HOME/.config/nvim/plugins/nvim_treesitter_config.lua
" luafile $HOME/.config/nvim/plugins/telescope_config.lua
source $HOME/.config/nvim/plugins/fzf_config.vim
source $HOME/.config/nvim/plugins/onedark_config.vim

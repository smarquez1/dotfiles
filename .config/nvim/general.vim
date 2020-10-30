set mouse=a " Enable mouse
set ignorecase smartcase " Configure search
set nobackup nowb " No backups
set noswapfile " No swapfile
set inccommand=nosplit " Enable live substitution
set number relativenumber numberwidth=2 " Show line numbers
set splitbelow splitright " more Natural splits behaviour
set wrap linebreak breakindent " Wrap text
" Customize breakline symbol
set showbreak=↪\  
set clipboard=unnamedplus " Use system's clipboard
set hidden " Keep undo history for hidden buffers
set completeopt=menuone,noinsert,noselect
" Ident using 2 spaces
set expandtab smarttab shiftwidth=2 softtabstop=2 tabstop=2
set foldmethod=indent foldlevel=99 " Enable folding by default

" START: Experimental (from coc readme)
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes
" trigger autoread everytime you focus the window or enter the buffer
set autoread
autocmd! FocusGained,BufEnter * checktime
" Highlight the screen line of the cursor with CursorLine
set cursorline

" Filetype specific settings
" ==========================
" Markdown
au FileType markdown setl spell " Enable spelling

" Terminal
au BufEnter term://* startinsert " Start on insert mode.
au TermOpen * setlocal nonumber norelativenumber " No line numbers

" :EConfig to edit configuration
command! Econfig call EditConfig()

function! EditConfig()
    e ~/.config/nvim/init.vim
    lcd %:p:h
endfunction

" {{{
" Theme
let g:nvcode_termcolors=256

syntax on
colorscheme onedark " Or whatever colorscheme you make

" checks if your terminal has 24-bit color support
if (has("termguicolors"))
    set termguicolors
    hi LineNr ctermbg=NONE guibg=NONE
endif
" }}}

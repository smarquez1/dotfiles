" Neovim config

" General options ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" set mouse
set mouse=a

" https://github.com/neovim/neovim/issues/4930
" set re=1

set sidescroll=1

" Highlight column at 80 
set cc=80

" Line wrapping
set wrap

" Configure search
set ignorecase smartcase

" Use system's clipboard. Keep platform specific settings
set clipboard+=unnamedplus

" No backup or swapfile
" set nobackup nowritebackup noswapfile

" Use zsh as shell
set shell=zsh

set lazyredraw

" Visual Interface ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" Enable live substitution
set inccommand=nosplit

" Enable true color
set termguicolors

" Show line numbers
set number numberwidth=2

" Show lines numbers realtive to current line (slow)
set relativenumber

" Disable swap files
set noswapfile nobackup nowb

" Highlight current line (slow)
" set cursorline

" Make escape work in the Neovim terminal.
tnoremap <Esc> <C-\><C-n>

" Make navigation into and out of Neovim terminal splits nicer.
tnoremap <C-h> <C-\><C-N><C-w>h
tnoremap <C-j> <C-\><C-N><C-w>j
tnoremap <C-k> <C-\><C-N><C-w>k
tnoremap <C-l> <C-\><C-N><C-w>l

" No line numbers in terminal mode
autocmd TermOpen * setlocal nonumber

" Prefer Neovim terminal insert mode to normal mode.
autocmd BufEnter term://* startinsert

" Areas where the splits should occur
set splitbelow splitright

" Line breaks
set breakindent
set breakindentopt=sbr
let &showbreak = '↪'

" Formatting ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" Use tabs as spaces, default identation: 2 spaces
set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab shiftround

" Enable folding
set foldmethod=indent
set foldlevel=99

au FileType markdown
  \   setl spell

" configure vim folds
au FileType vim
  \   setl foldmethod=marker
  \ | setl foldenable
  \ | setl foldlevel=0

" Custom key mapings ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" Leader is space
let mapleader=" "

" Semicolon is colon
map ; :

" Hit twice semicolon for original behaviour
noremap ;; ;

" Save file
noremap <leader>w :w <cr>

" Quicker window movement
nmap <c-j> <c-w>j
nmap <c-k> <c-w>k
nmap <c-l> <c-w>l
nmap <c-h> <c-w>h

" Easy splitting
map <leader>s :split <cr>
map <leader>v :vsplit <cr>

" Replace hashrockets with 1.9 hash style syntax
nmap <Leader>: :%s/:\([^=,'"]*\) =>/\1:/g <cr>o

" Re-Open Previously Opened File
nnoremap <Leader><Leader> :e#<CR>

" Open current file with external tool
nmap <leader>E :!open % <CR> <CR>

" map . in visual mode
vnoremap . :norm.<cr>

" unmap F1 help
nmap <F1> <nop>
imap <F1> <nop>

" unmap ex mode: 'Type visual to go into Normal mode.'
nmap Q <nop>

" Cancel a search with Escape:
nnoremap <silent> <Esc> :nohlsearch<Bar>:echo<CR>

" Quickly open/reload vim
nnoremap <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <leader>rv :source $MYVIMRC<CR>

" Auto indent whole document
nmap <leader>ai mzgg=G`z

" Plugins ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
call plug#begin('~/.vim/plugged')
Plug 'sbdchd/neoformat'

Plug 'w0rp/ale'
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'scss': ['sasslint']
\}

let g:ale_fixers = {
\   'javascript': ['eslint', 'prettier'],
\   'css': ['prettier', 'stylelint'],
\   'scss': ['prettier', 'stylelint']
\}

Plug 'dyng/ctrlsf.vim'
" {{{
let g:ctrlsf_position = 'left'
let g:ctrlsf_indent = 2
let g:ctrlsf_mapping = {
      \ "split"   : "<C-S>",
      \ "vsplit"  : "<C-V>",
      \ "quit"    : "q",
      \ "next"    : "<C-J>",
      \ "prev"    : "<C-K>",
      \ "popen"   : "",
      \ }

autocmd FileType ctrlsf set nonu norelativenumber
" }}}
Plug 'ludovicchabant/vim-gutentags'
Plug 'alvan/vim-closetag'
" {{{
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.js, *.jsx, *.erb"
" }}}
Plug 'tpope/vim-commentary'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-eunuch'
Plug 'mattn/emmet-vim'
" {{{
autocmd FileType html,erb,jsx EmmetInstall
" }}}
Plug 'cloudhead/neovim-fuzzy'
Plug 'terryma/vim-multiple-cursors'
" {{{
let g:multi_cursor_exit_from_visual_mode = 0
let g:multi_cursor_exit_from_insert_mode  = 0

function! Multiple_cursors_before()
    " let b:deoplete_disable_auto_complete = 1
endfunction

function! Multiple_cursors_after()
    " let b:deoplete_disable_auto_complete = 0
endfunction
" }}}
Plug 'sheerun/vim-polyglot'
" {{{
let g:rubycomplete_rails = 1
" }}}
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'mhinz/vim-sayonara'
Plug 'justinmk/vim-sneak'
"{{{
let g:sneak#streak = 1
map f <Plug>Sneak_f
map F <Plug>Sneak_F
map t <Plug>Sneak_t
map T <Plug>Sneak_T
"}}}
Plug 'janko-m/vim-test'
" {{{
let test#runners = {'javascript': ['jest']}
let test#strategy = "neoterm"
" }}}
Plug 'tpope/vim-speeddating'
Plug 'christoomey/vim-tmux-navigator'
Plug 'kassio/neoterm'
" {{{
let g:neoterm_position = 'vertical'
" }}}
" Completion ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'roxma/nvim-completion-manager'
      \ | Plug 'SirVer/ultisnips'
      \ | Plug 'honza/vim-snippets'
      \ | Plug 'isRuslan/vim-es6'
      \ | Plug 'bentayloruk/vim-react-es6-snippets'
      \ | Plug 'fishbullet/deoplete-ruby'
      \ | Plug 'carlitux/deoplete-ternjs'
      \ | Plug 'jiangmiao/auto-pairs'
      \ | Plug 'ervandew/supertab'
" {{{
let g:deoplete#enable_at_startup = 1

let g:UltiSnipsExpandTrigger="<C-j>"

" close the preview window when you're not using it
let g:SuperTabClosePreviewOnPopupClose = 1
let g:SuperTabDefaultCompletionType = "<c-n>"
let g:AutoPairsMultilineClose = 1
" }}}

" Interface ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Plug 'chriskempson/base16-vim'
" {{{
let base16colorspace=256
" }}}
Plug 'Yggdroot/indentLine'
" {{{
let g:indentLine_enabled=1
" }}}
Plug 'itchyny/lightline.vim'
" {{{
let g:lightline = {
\ 'colorscheme': 'Tomorrow_Night_Eighties',
\ 'active': {
\   'left': [['mode', 'paste'], ['gitbranch', 'filename', 'modified']],
\   'right': [['lineinfo'],
\             ['percent'],
\             ['filetype', 'linter_errors']]
\ },
\ 'component_function': {
\   'gitbranch': 'fugitive#head'
\ },
\ 'component_expand': {
\   'linter_warnings': 'LightlineLinterWarnings',
\   'linter_errors': 'LightlineLinterErrors'
\ },
\ 'component_type': {
\   'readonly': 'error',
\   'linter_warnings': 'warning',
\   'linter_errors': 'error'
\ }
\ }

function! LightlineLinterErrors() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d ✗', all_errors)
endfunction

autocmd User ALELint call lightline#update()

" }}}
Plug 'mhinz/vim-signify'
Plug 'henrik/vim-indexed-search'
Plug 'scrooloose/nerdtree'
" {{{
" Don't show help, press ? to get it
let g:NERDTreeMinimalUI = 1
" Delete buffer after file rename, delete
let g:NERDTreeAutoDeleteBuffer=1
" NERDTress File highlighting
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
" }}}

" Ruby specific ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Plug 'ecomba/vim-ruby-refactoring'
Plug 'p0deje/vim-ruby-interpolation'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rbenv'
Plug 'vim-ruby/vim-ruby'

" Javascript specific ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Plug 'justinj/vim-react-snippets'
Plug 'othree/javascript-libraries-syntax.vim'
" {{{
let g:used_javascript_libs = 'underscore,jquery,react,flux,jasmine'
" }}}

call plug#end()

" Colorscheme
colo base16-eighties
hi VertSplit guibg=bg guifg=cyan

" Neovim-fuzzy
nmap <Leader>f :FuzzyOpen <cr>

" Rails
nmap <leader>a :A <cr>
nmap <leader>av :AV <cr>
nmap <leader>as :AS <cr>

" Sayonara
nnoremap <leader>q :Sayonara!<cr>
nnoremap <leader>Q :Sayonara<cr>

" Ctrlsf
nmap <leader>/ <Plug>CtrlSFPrompt
vmap <leader>/ <Plug>CtrlSFVwordPath

" Fugitive git bindings
nnoremap <Leader>ga :Git add %:p<CR><CR>
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gc :Gcommit -v -q<CR>
nnoremap <Leader>gt :Gcommit -v -q %:p<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>ge :Gedit<CR>
nnoremap <Leader>gr :Gread<CR>
nnoremap <Leader>gw :Gwrite<CR><CR>
nnoremap <Leader>gl :silent! Glog<CR>:bot copen<CR>
nnoremap <Leader>gp :Ggrep<Space>
nnoremap <Leader>gm :Gmove<Space>
nnoremap <Leader>gb :Git branch<Space>
nnoremap <Leader>go :Git checkout<Space>
nnoremap <Leader>gps :Dispatch! git push<CR>
nnoremap <Leader>gpl :Dispatch! git pull<CR>

" Nerdtree
map <leader>d :NERDTreeToggle<cr>
map <leader>D :NERDTreeFind<cr>

" Vim Test
nmap <leader>T :TestFile<CR>
nmap <leader>t :TestNearest<CR>
nmap <leader>l :TestLast<CR>

" Vim Plug
nmap <leader>pu :PlugUpdate<CR>
nmap <leader>pU :PlugUpgrade<CR>
nmap <leader>pc :PlugClean<CR>
nmap <leader>pi :PlugInstall<CR>

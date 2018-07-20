" Neovim config

" General options ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" set mouse
set mouse=a
" Scroll extra lines when reaching the bottom
set scrolloff=3
" Configure search
set ignorecase smartcase
" Use system's clipboard. Keep platform specific settings
set clipboard=unnamedplus
" No backup or swapfile
set nobackup nowb noswapfile
" Use zsh as shell
set shell=zsh
" performance fixes
set regexpengine=1
set synmaxcol=200

" UI ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" Enable true color
set termguicolors
" Enable live substitution
set inccommand=nosplit
" Show line numbers
set number relativenumber numberwidth=2
" Disable swap files
set noswapfile nobackup nowb
" No line numbers in terminal mode
autocmd TermOpen * setlocal nonumber
" Prefer Neovim terminal insert mode to normal mode.
autocmd BufEnter term://* startinsert
" Areas where the splits should occur
set splitbelow splitright
" Wrap text
set wrap breakindent breakindentopt=sbr
" cpoptions=n
let showbreak = '↳ '
" Highlight column at 81
set cc=81
au FileType javascript,html,eruby,vue set cc=101

" Formatting ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" Use tabs as spaces, default identation: 2 spaces
set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab shiftround
" Enable spelling on markdown files
au FileType markdown setl spell
" Enable folding by default
set foldmethod=indent foldlevel=99
" Enable folding by default for VIM files/configuration
au FileType vim setl foldmethod=marker foldenable foldlevel=0 

" Custom key mapings ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" comma is space
let mapleader=" "
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
nnoremap <leader>: :%s/:\(\w\+\)\s*=>\s*/\1: /g <cr>
" Re-Open Previously Opened File
nnoremap <leader><leader> :e#<CR>
" Open current file with external tool
nnoremap <leader>E :!open % <CR> <CR>
" map . in visual mode
vnoremap . :norm.<cr>
" unmap ex mode: 'Type visual to go into Normal mode.'
nnoremap Q <nop>
" Cancel a search with Escape:
nnoremap <silent> <Esc> :nohlsearch<Bar>:echo<CR>
" Quickly open/reload vim
nnoremap <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <leader>rv :source $MYVIMRC<CR>
" Auto indent whole document
nnoremap <leader>ai mzgg=G`z
" Saner cursor positioning after yanking blocks
vnoremap <expr>y "my\"" . v:register . "y`y"
" Escape in terminal switches to normal mode
tnoremap <Esc> <C-\><C-n>
" Make navigation into and out of Neovim terminal splits nicer.
tnoremap <C-h> <C-\><C-N><C-w>h
tnoremap <C-j> <C-\><C-N><C-w>j
tnoremap <C-k> <C-\><C-N><C-w>k
tnoremap <C-l> <C-\><C-N><C-w>l

" Plugins ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
call plug#begin('~/.vim/plugged')
" Vue
Plug 'posva/vim-vue'
" {{{
autocmd FileType vue syntax sync fromstart
let g:vue_disable_pre_processors=1
" }}}
" Match html tags
Plug 'Valloric/MatchTagAlways'
" Helps stop using hjkl keys
" Plug 'takac/vim-hardtime'
" {{{
" let g:hardtime_showmsg = 1
" let g:hardtime_default_on = 1
" let g:hardtime_ignore_buffer_patterns = [ "gitcommit", "NERD.*" ]
" }}}
" Continuously updated session files, used with tmux-resurrect
Plug 'tpope/vim-obsession'
Plug 'w0rp/ale'
" {{{
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'scss': ['stylelint'],
\   'ruby': ['rubocop', 'mri']
\}

let g:ale_fixers = {
\   'css': ['stylelint'],
\   'javascript': ['eslint'],
\   'vue': ['eslint'],
\   'scss': ['stylelint'],
\   'ruby': ['rubocop']
\}
" }}}
Plug 'dyng/ctrlsf.vim'
" {{{
let g:ctrlsf_search_mode='async'
let g:ctrlsf_indent = 2
let g:ctrlsf_mapping = {
\ "split"   : "<C-S>",
\ "vsplit"  : "<C-V>",
\ "quit"    : "q",
\ "next"    : "<C-J>",
\ "prev"    : "<C-K>",
\ "popen"   : "" }

autocmd FileType ctrlsf set nonu norelativenumber
" }}}
Plug 'ludovicchabant/vim-gutentags'
Plug 'alvan/vim-closetag'
" {{{
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.js, *.jsx, *.erb"
" }}}
" Plug 'tpope/vim-commentary'
Plug 'scrooloose/nerdcommenter'
" {{{
let g:ft = ''
function! NERDCommenter_before()
  if &ft == 'vue'
    let g:ft = 'vue'
    let stack = synstack(line('.'), col('.'))
    if len(stack) > 0
      let syn = synIDattr((stack)[0], 'name')
      if len(syn) > 0
        exe 'setf ' . substitute(tolower(syn), '^vue_', '', '')
      endif
    endif
  endif
endfunction
function! NERDCommenter_after()
  if g:ft == 'vue'
    setf vue
    let g:ft = ''
  endif
endfunction
" }}}
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-ragtag'
" {{{
let g:ragtag_global_maps = 1
" }}}
Plug 'mattn/emmet-vim'
" {{{
autocmd FileType html,erb,jsx,vue EmmetInstall
" }}}
Plug 'cloudhead/neovim-fuzzy'
Plug 'terryma/vim-multiple-cursors'
" {{{
let g:multi_cursor_exit_from_visual_mode = 0
let g:multi_cursor_exit_from_insert_mode  = 0

function! Multiple_cursors_before()
    let b:deoplete_disable_auto_complete = 1
endfunction

function! Multiple_cursors_after()
    let b:deoplete_disable_auto_complete = 0
endfunction
" }}}
Plug 'sheerun/vim-polyglot'
" {{{
let g:rubycomplete_rails = 1
" }}}
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'mhinz/vim-sayonara'
Plug 'janko-m/vim-test'
" {{{
let test#strategy = "vimux"
" }}}
Plug 'tpope/vim-speeddating'
Plug 'christoomey/vim-tmux-navigator'
" Completion ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  \ | Plug 'fishbullet/deoplete-ruby'
  \ | Plug 'carlitux/deoplete-ternjs', { 'do': 'yarn global add tern' }
  \ | Plug 'Shougo/neosnippet.vim'
  \ | Plug 'Shougo/neosnippet-snippets'
" {{{
" Start deoplete
let g:deoplete#enable_at_startup = 1
"Add extra Ternjs filetypes
let g:deoplete#sources#ternjs#filetypes = ['jsx', 'vue']
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-j>  <Plug>(neosnippet_expand_or_jump)
smap <C-j>  <Plug>(neosnippet_expand_or_jump)
xmap <C-j>  <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <expr><TAB>
  \ pumvisible() ? "\<C-n>" :
  \ neosnippet#expandable_or_jumpable() ?
  \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
  \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif
" }}}
Plug 'jiangmiao/auto-pairs'
let g:AutoPairsMultilineClose = 1
let g:AutoPairsMultilineClose = 1
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
\   'left': [['mode', 'paste'],
\            ['readonly', 'gitbranch', 'filename', 'modified']],
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
  return l:counts.total == 0 ? '' : printf('%d ❌', all_errors)
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
Plug 'othree/javascript-libraries-syntax.vim'
" {{{
let g:used_javascript_libs = 'underscore,jquery,react,flux,vue,jasmine'
" }}}

call plug#end()

" Colorscheme
set background=dark
colorscheme base16-eighties
hi VertSplit guibg=bg guifg=fg

" Vim Ale
map <Leader>af :ALEFix<cr>
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

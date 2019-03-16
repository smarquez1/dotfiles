" General options
" ===============
" set mouse
set mouse=a
" Scroll extra lines when reaching the bottom
set scrolloff=5
" Configure search
set ignorecase smartcase
" Use system's clipboard. Keep platform specific settings
set clipboard=unnamed,unnamedplus
" No backup or swapfile
set nobackup nowb noswapfile
" Persistent Undo
set undodir=~/.vim/undodir
set undofile
" Use zsh as shell
set shell=zsh
" performance fixes
" set regexpengine=1
set synmaxcol=400
" Enable true color
set termguicolors
" Set nerd fonts
set guifont=Iosevka\ Nerd\ Font\ 11
" Enable live substitution
set inccommand=nosplit
" Show line numbers
set number relativenumber numberwidth=2
" Prefer Neovim terminal insert mode to normal mode.
autocmd BufEnter term://* startinsert
" Areas where the splits should occur
set splitbelow splitright
" Wrap text
set wrap linebreak breakindent
" cpoptions=n
set showbreak=↪\ 
" Highlight column at 81
set cc=81
" Use tabs as spaces, default identation: 2 spaces
set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab shiftround
" Enable folding by default
set foldmethod=indent foldlevel=99
" Delete comment character when joining commented lines
set formatoptions+=j

" Filetype specific settings
" ==========================
" Highlight column at 101
au FileType javascript,html,eruby,vue setl cc=101
" Enable spelling on markdown files
au FileType markdown setl spell
" Enable folding by default for VIM files/configuration
au FileType vim setl foldmethod=marker foldenable foldlevel=0 
" No line numbers in terminal mode
au TermOpen * setlocal nonumber norelativenumber

" Custom key mapings ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" comma is space
let mapleader=" "
" semi colon is colon
map ; :
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
" Cancel a search with Escape:
nnoremap <silent> <Esc> :nohlsearch<Bar>:echo<CR>
" Quickly open/reload config
nnoremap <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <leader>rv :source $MYVIMRC<CR>
" Auto indent whole document
nnoremap <leader>ai mzgg=G`z
" Escape in terminal switches to normal mode
tnoremap <Esc> <C-\><C-n>
" Make navigation into and out of Neovim terminal splits nicer.
tnoremap <C-h> <C-\><C-N><C-w>h
tnoremap <C-j> <C-\><C-N><C-w>j
tnoremap <C-k> <C-\><C-N><C-w>k
tnoremap <C-l> <C-\><C-N><C-w>l

" map . in visual mode
vnoremap . :norm.<cr>
" unmap ex mode: 'Type visual to go into Normal mode.'
nnoremap Q <nop>
" saner cursor positioning after yanking blocks
vnoremap <expr>y "my\"" . v:register . "y`y"

" Plugins
" =======
call plug#begin('~/.vim/plugged')

" Git changes in gutter
Plug 'mhinz/vim-signify'
" A Git wrapper so awesome, it should be illegal
Plug 'tpope/vim-fugitive'
" {{{
let g:fugitive_git_executable = 'LANG=en_US git'
" }}}

" Vim org-mode
Plug 'jceb/vim-orgmode'
" Display css colors
Plug 'ap/vim-css-color'
" A Vim plugin that manages your tag files
Plug 'ludovicchabant/vim-gutentags'
" {{{
" let g:gutentags_ctags_executable='ptags'
" }}}"
" Comments
Plug 'tpope/vim-commentary'
" vim plugin to interact with tmux
Plug 'benmills/vimux'
" A Vim plugin that always highlights the enclosing html/xml tags
Plug 'Valloric/MatchTagAlways'
" Asynchronous linting/fixing for Vim and LSP integration
Plug 'w0rp/ale'
" {{{
let g:ale_linters = {
  \   'javascript': ['eslint'],
  \   'scss': ['stylelint'],
  \   'css': ['stylelint'],
  \   'ruby': ['rubocop', 'solargraph', 'ruby', 'reek'],
  \   'yaml': ['prettier']
\}

let g:ale_fixers = {
  \   '*': ['prettier', 'remove_trailing_lines', 'trim_whitespace'],
  \   'css': ['stylelint'],
  \   'javascript': ['eslint'],
  \   'vue': ['eslint'],
  \   'scss': ['stylelint'],
  \   'ruby': ['rubocop']
\}
let g:ale_set_signs = 1
" hi link ALEErrorLine ErrorMsg
" hi link ALEWarningLine WarningMsg
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_delay = 0
" }}}
" An ack.vim alternative mimics Ctrl-Shift-F on Sublime Text 2
Plug 'dyng/ctrlsf.vim'
" {{{
let g:ctrlsf_auto_close = {
    \ "normal" : 0,
    \ "compact": 0
    \}
let g:ctrlsf_auto_focus = {
    \ "at": "start"
    \ }
let g:ctrlsf_default_view_mode = 'compact'
let g:ctrlsf_default_root = 'project'
let g:ctrlsf_search_mode='async'
" }}}
"Auto close (X)HTML tags
Plug 'alvan/vim-closetag'
" {{{
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.js, *.jsx, *.erb"
" }}}
" A Vim alignment plugin
Plug 'junegunn/vim-easy-align'
" ghetto HTML/XML mappings (formerly allml.vim)
Plug 'tpope/vim-ragtag'
" {{{
let g:ragtag_global_maps = 1
" }}}
" emmet for vim
Plug 'mattn/emmet-vim'
" {{{
autocmd FileType html,erb,jsx,vue EmmetInstall
" }}}
" Fuzzy file finding for neovim
Plug 'cloudhead/neovim-fuzzy'
" True Sublime Text style multiple selections for Vim
Plug 'terryma/vim-multiple-cursors'
" {{{
let g:multi_cursor_exit_from_visual_mode = 0
let g:multi_cursor_exit_from_insert_mode  = 0
" }}}
" Better support for some languages
Plug 'sheerun/vim-polyglot'
" {{{
"let g:rubycomplete_rails = 1
let g:vim_markdown_conceal = 0
let g:jsx_ext_required = 1
" }}}
" enable repeating supported plugin maps with "."
Plug 'tpope/vim-repeat'
" Vim Surround
Plug 'tpope/vim-surround'
" Vim test runner
Plug 'janko-m/vim-test'
" {{{
" let test#strategy = "neovim"
" let test#neovim#term_position = "vert"
let test#strategy = "vimux"
" }}}
" Seamless navigation between tmux panes and vim splits
Plug 'christoomey/vim-tmux-navigator'
" Completion ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" Snippet support TODO: configure
" Neovim completion manager
Plug 'ncm2/ncm2'
  \ | Plug 'roxma/nvim-yarp'
  \ | Plug 'ncm2/ncm2-bufword'
  \ | Plug 'ncm2/ncm2-tmux'
  \ | Plug 'ncm2/ncm2-path'
  \ | Plug 'ncm2/ncm2-ultisnips' | Plug 'SirVer/ultisnips' 
  \ | Plug 'honza/vim-snippets' | Plug 'jvanja/vim-bootstrap4-snippets'
" {{{
" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()
" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,preview,noselect

" c-j c-k for moving in snippet
inoremap <expr> <c-j> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <c-k> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" When the <Enter> key is pressed while the popup menu is visible, it only
" hides the menu. Use this mapping to close the menu and also start a new
" line.
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<c-r>" : "\<CR>")

" }}}

" LSP Support
Plug 'autozimu/LanguageClient-neovim', {
  \ 'branch': 'next',
  \ 'do': 'bash install.sh'
  \ }
" {{{
let g:LanguageClient_autoStart = 1
let g:LanguageClient_serverCommands = {
  \ 'javascript': ['javascript-typescript-stdio'],
  \ 'ruby': ['solargraph', 'stdio']
  \ }
 "}}}
" Vim plugin, insert or delete brackets, parens, quotes in pair
Plug 'jiangmiao/auto-pairs'
" {{{
let g:AutoPairsMultilineClose = 1
" }}}
" Interface ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" Base16 colors
Plug 'chriskempson/base16-vim'
" {{{
" let base16colorspace=256 
" }}}
" A vim plugin to display the indention levels with thin vertical lines
Plug 'Yggdroot/indentLine'
" {{{
let g:indentLine_enabled=1
" }}}
" Better statusline
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
	\ }
\ }

" }}}
" Display number of search results
Plug 'henrik/vim-indexed-search'
" File explorer like navigation
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

" Elixir
" ~~~~~~~~~~~~~~~~~~
Plug 'elixir-editors/vim-elixir'
Plug 'slashmili/alchemist.vim'
" Ruby specific ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" Simple plugin to add {} after hitting #
Plug 'p0deje/vim-ruby-interpolation'
" endwise.vim: wisely add "end" in ruby, endfunction/endif/more in vim script, etc 
Plug 'tpope/vim-endwise'
" {{{
"https://github.com/roxma/nvim-completion-manager/issues/49
" When the <Enter> key is pressed while the popup menu is visible, it only
" hides the menu. Use this mapping to close the menu and also start a new
" line.
let g:endwise_no_mappings = 1
imap <C-X><CR> <CR><Plug> AlwaysEnd
imap <expr> <CR> (pumvisible() ? "\<C-Y>\<CR>\<Plug>DiscretionaryEnd" : "\<CR>\<Plug>DiscretionaryEnd")
" }}}
" Ruby on Rails power tools
Plug 'tpope/vim-rails'
" Javascript specific ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Plug 'othree/javascript-libraries-syntax.vim'
" {{{
let g:used_javascript_libs = 'underscore,jquery,react,vue,jasmine'
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
" Ctrlsf
nmap <leader>/ <Plug>CtrlSFPrompt
vmap <leader>/ <Plug>CtrlSFVwordPath
" Fugitive git bindings
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gd :Gdiff<CR>
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

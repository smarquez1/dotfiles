call plug#begin('~/.local/share/nvim/plugged')

Plug 'dyng/ctrlsf.vim' " An ack.vim alternative mimics Ctrl-Shift-F on Sublime Text 2
Plug 'mattn/emmet-vim'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } |
  \ Plug 'junegunn/fzf.vim' |
  \ Plug 'stsewd/fzf-checkout.vim' " fuzzy finder

" Plug 'nvim-lua/telescope.nvim' |
"       \ Plug 'nvim-lua/popup.nvim' |
"       \ Plug 'nvim-lua/plenary.nvim' |
"       \ Plug 'nvim-telescope/telescope-fzy-native.nvim'

Plug 'AndrewRadev/splitjoin.vim' " Simplifies transition between multiline and single-line code
Plug 'justinmk/vim-sneak' " Jump to any location specified by two characters.
Plug 'tpope/vim-commentary' " Comments
Plug 'tpope/vim-fugitive' |
  \ Plug 'tpope/vim-rhubarb' " git wrapper + vim-fugitive Github integration
Plug 'szw/vim-maximizer'
Plug 'tpope/vim-repeat' " enable repeating supported plugin maps with '.'
Plug 'tpope/vim-surround' " Vim Surround
Plug 'mhinz/vim-signify' " git gutter signs
Plug 'janko-m/vim-test' " Vim test runner
Plug 'mg979/vim-visual-multi', {'branch': 'master'} " Multiple cursors

" LSP, code completion, code highlighting
Plug 'neoclide/coc.nvim', { 'branch': 'release' } " LSP integration
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'honza/vim-snippets' " Snippets for vim

" Appearance
Plug 'romgrk/barbar.nvim' " bufferline
Plug 'norcalli/nvim-colorizer.lua' " Highlight colors
Plug 'henrik/vim-indexed-search' " Display number of search results
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
" Plug 'glepnir/galaxyline.nvim' " Status Line
" Cool icons
Plug 'kyazdani42/nvim-web-devicons' " icons for lua plugins
Plug 'ryanoasis/vim-devicons' " icons
Plug 'joshdick/onedark.vim' " Colorscheme based on atom onedark

" HTMLish
Plug 'Valloric/MatchTagAlways'  " A Vim plugin that always highlights the enclosing html/xml tags
Plug 'AndrewRadev/tagalong.vim' " Change an HTML(ish) opening tag and take the closing one along as well
Plug 'tpope/vim-ragtag'         " mappings for templating languages (ex <% %>, <%= %>, <!-- -->

" Ruby
Plug 'ecomba/vim-ruby-refactoring'   " Refactoring tool for Ruby in vim!
Plug 'p0deje/vim-ruby-interpolation' " Simple plugin to add {} after hitting #
Plug 'tpope/vim-endwise'             " add 'end' in ruby, endfunction/endif/more in vim script, etc
Plug 'tpope/vim-rails'               " rails.vim: Ruby on Rails power tools
Plug 'nelstrom/vim-textobj-rubyblock' | Plug 'kana/vim-textobj-user'

" other languages
Plug 'sheerun/vim-polyglot' " Better support for some languages

" Tmux integration
Plug 'benmills/vimux' " vim plugin to interact with tmux
Plug 'christoomey/vim-tmux-navigator' " Seamless navigation between tmux panes and vim splits

call plug#end()

" MatchTagAlways
let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'javascriptreact' : 1,
    \ 'eruby' : 1,
    \ 'liquid' : 1,
    \ 'markdown' : 1
    \}

" endwise
let g:endwise_no_mappings=1

" Fugitive
let g:fugitive_git_executable = 'LANG=en_US git'

" Ragtag
let g:ragtag_global_maps = 1

" Polyglot
" let g:polyglot_disabled = ['autoindent', 'sensible']
let g:vim_jsx_pretty_colorful_config = 1

" Airline
let g:airline#extensions#hunks#enabled = 0
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#wordcount#enabled = 0
let g:airline_section_z = '%l:%c'
let g:airline_theme='onedark'
let g:airline_highlighting_cache = 1

" Lightline
" let g:lightline = {
"   \ 'colorscheme': 'onedark',
"   \ 'active': {
"   \   'left':   [ [ 'mode', 'paste' ],
"   \               [ 'gitbranch', 'readonly', 'filename', 'modified', 'lspstatus' ] ],
"   \   'right':  [ [ 'lineinfo' ], [ 'percent' ], [ 'filetype' ] ]
"   \ },
"   \ 'component_function': {
"   \   'lspstatus': 'coc#status',
"   \   'gitbranch': 'fugitive#head',
"   \   'readonly': 'StatusReadonly',
"   \   'filetype': 'StatusFiletype',
"   \ },
"   \ }

" " Can I trim the file format and encoding information on narrow windows
" function! StatusFiletype()
"   return winwidth(0) > 70 ? 
"     \ (strlen(&filetype) ? &filetype : 'no ft') 
"     \: ''
" endfunction

" function! StatusReadonly()
"   return &readonly && &filetype !=# 'help' ? '🔒' : ''
" endfunction

" Vim-test
let test#strategy = "vimux"
" let g:test#ruby#rspec#executable = 'bundle exec rspec'
let test#ruby#use_binstubs = 0

" Sneak
let g:sneak#label = 1
" case insensitive sneak
let g:sneak#use_ic_scs = 1
" immediately move to the next instance of search, if you move the cursor sneak is back to default behavior
let g:sneak#s_next = 1

" LSP
" Show hover documentation when holding the cursor
" autocmd CursorHold * silent call CocAction('doHover')

let g:coc_global_extensions = [	
  \ 'coc-css', 	
  \ 'coc-eslint',	
  \ 'coc-explorer',	
  \ 'coc-html',	
  \ 'coc-pairs', 	
  \ 'coc-snippets',	
  \ 'coc-solargraph',	
  \ 'coc-stylelint',	
  \ 'coc-tsserver',	
  \ ]

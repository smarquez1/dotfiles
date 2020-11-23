call plug#begin('~/.local/share/nvim/plugged')

Plug 'dyng/ctrlsf.vim' " An ack.vim alternative mimics Ctrl-Shift-F on Sublime Text 2
Plug 'mattn/emmet-vim'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } |
  \ Plug 'junegunn/fzf.vim' |
  \ Plug 'stsewd/fzf-checkout.vim' " fuzzy finder
" {{{
" FZF
let $FZF_DEFAULT_COMMAND = 'fd --type f'
let $FZF_DEFAULT_OPTS .= ' --layout=reverse --inline-info'
let g:fzf_preview_window = '' " Disable preview windows
let g:fzf_layout = { 'window': 
\   { 'width': 0.60, 'height': 0.5, 'yoffset': 0, 'border': 'rounded' }
\ }
" }}}

" Plug 'nvim-lua/telescope.nvim' |
"       \ Plug 'nvim-lua/popup.nvim' |
"       \ Plug 'nvim-lua/plenary.nvim' " Find, Filter, Preview, Pick
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
" Plug 'christianchiarulli/nvcode-color-schemes.vim'

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

source $HOME/.config/nvim/general.vim
source $HOME/.config/nvim/plugins.vim
source $HOME/.config/nvim/keys.vim
luafile $HOME/.config/nvim/lua/init.lua
luafile $HOME/.config/nvim/lua/utils.lua
luafile $HOME/.config/nvim/lua/_nvim-colorizer.lua
luafile $HOME/.config/nvim/lua/_nvim-treesitter.lua
" luafile $HOME/.config/nvim/lua/_telescope.lua
" luafile $HOME/.config/nvim/lua/_galaxyline.lua

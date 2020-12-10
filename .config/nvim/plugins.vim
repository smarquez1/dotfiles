call plug#begin('~/.local/share/nvim/plugged')

Plug 'dyng/ctrlsf.vim' " An ack.vim alternative mimics Ctrl-Shift-F on Sublime Text 2
" File picker
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } |
       \ Plug 'junegunn/fzf.vim' |
       \ Plug 'stsewd/fzf-checkout.vim'
" Plug 'nvim-lua/telescope.nvim' |
"       \ Plug 'nvim-lua/popup.nvim' |
"       \ Plug 'nvim-lua/plenary.nvim' |
"       \ Plug 'nvim-telescope/telescope-fzy-native.nvim'

Plug 'AndrewRadev/splitjoin.vim' " Simplifies transition between multiline and single-line code
Plug 'justinmk/vim-sneak' " Jump to any location specified by two characters.
Plug 'tomtom/tcomment_vim' " Comments
" git wrapper + vim-fugitive Github integration
Plug 'tpope/vim-fugitive' | Plug 'tpope/vim-rhubarb'
Plug 'szw/vim-maximizer'
Plug 'tpope/vim-repeat' " enable repeating supported plugin maps with '.'
Plug 'tpope/vim-surround' " Vim Surround
Plug 'mhinz/vim-signify' " git gutter signs
" " Vim test runner
Plug 'janko-m/vim-test' | Plug 'benmills/vimux'
Plug 'mg979/vim-visual-multi', {'branch': 'master'} " Multiple cursors
" " LSP, code completion, code highlighting
Plug 'neoclide/coc.nvim', { 'branch': 'release', 'do': ':CocUpdate' } " LSP integration
" Plug 'neovim/nvim-lspconfig' |
"   \  Plug 'nvim-lua/lsp-status.nvim' |
"   \  Plug 'nvim-lua/completion-nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} |
      \ Plug 'p00f/nvim-ts-rainbow'
Plug 'honza/vim-snippets' " Snippets for vim
" " Appearance
Plug 'romgrk/barbar.nvim' " bufferline
Plug 'norcalli/nvim-colorizer.lua' " Highlight colors
Plug 'henrik/vim-indexed-search' " Display number of search results
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
Plug 'joshdick/onedark.vim' " Colorscheme based on atom onedark
" " Cool icons
Plug 'kyazdani42/nvim-web-devicons' " icons for lua plugins
Plug 'ryanoasis/vim-devicons' " icons
" " HTMLish
Plug 'Valloric/MatchTagAlways'  " A Vim plugin that always highlights the enclosing html/xml tags
Plug 'AndrewRadev/tagalong.vim' " Change an HTML(ish) opening tag and take the closing one along as well
Plug 'tpope/vim-ragtag'         " mappings for templating languages (ex <% %>, <%= %>, <!-- -->
Plug 'mattn/emmet-vim'
Plug 'sheerun/vim-polyglot' " Better support for some languages
source $HOME/.config/nvim/plugins/polyglot_config.vim
Plug 'christoomey/vim-tmux-navigator' " Seamless navigation between tmux panes and vim splits
" "
" " Ruby
Plug 'ecomba/vim-ruby-refactoring'   " Refactoring tool for Ruby in vim!
Plug 'p0deje/vim-ruby-interpolation' " Simple plugin to add {} after hitting #
Plug 'tpope/vim-endwise'             " add 'end' in ruby, endfunction/endif/more in vim script, etc
Plug 'tpope/vim-rails'               " rails.vim: Ruby on Rails power tools

call plug#end()

source $HOME/.config/nvim/plugins/airline_config.vim
source $HOME/.config/nvim/plugins/barbar_config.vim
source $HOME/.config/nvim/plugins/coc_config.vim
source $HOME/.config/nvim/plugins/ctrlsf_config.vim
source $HOME/.config/nvim/plugins/emmet_config.vim
source $HOME/.config/nvim/plugins/endwise_config.vim
source $HOME/.config/nvim/plugins/fzf_config.vim
source $HOME/.config/nvim/plugins/fugitive_config.vim
source $HOME/.config/nvim/plugins/matchtagalways_config.vim
source $HOME/.config/nvim/plugins/onedark_config.vim
source $HOME/.config/nvim/plugins/ragtag_config.vim
source $HOME/.config/nvim/plugins/sneak_config.vim
source $HOME/.config/nvim/plugins/vim_rails_config.vim
source $HOME/.config/nvim/plugins/vim_test_config.vim

" luafile $HOME/.config/nvim/plugins/lsp.lua
luafile $HOME/.config/nvim/plugins/nvim_colorizer_config.lua
luafile $HOME/.config/nvim/plugins/nvim_treesitter_config.lua
" luafile $HOME/.config/nvim/plugins/telescope_config.lua

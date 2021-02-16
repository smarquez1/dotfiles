call plug#begin('~/.local/share/nvim/plugged')

Plug 'justinmk/vim-sneak' " Jump to any location specified by two characters.
Plug 'tpope/vim-commentary'
Plug 'kkoomen/vim-doge', { 'do': { -> doge#install() } }
Plug 'tpope/vim-fugitive' | Plug 'tpope/vim-rhubarb' " git wrapper + vim-fugitive Github integration
Plug 'tpope/vim-repeat' " enable repeating supported plugin maps with '.'
Plug 'tpope/vim-surround' " Vim Surround
Plug 'janko-m/vim-test' | Plug 'benmills/vimux' " Vim test runner
Plug 'mg979/vim-visual-multi', {'branch': 'master'} " Multiple cursors
Plug 'AndrewRadev/splitjoin.vim' " change between multiline and single-line code
Plug 'christoomey/vim-tmux-navigator' " Seamless navigation between tmux panes and vim splits
Plug 'jiangmiao/auto-pairs' " insert or delete brackets, parens, quotes in pair
Plug 'mhinz/vim-signify' " Git gutter
Plug 'akinsho/nvim-bufferline.lua'
" Search and navigation
Plug 'nvim-lua/telescope.nvim' |
      \ Plug 'nvim-lua/popup.nvim' |
      \ Plug 'nvim-lua/plenary.nvim' |
      \ Plug 'nvim-telescope/telescope-fzy-native.nvim' " File navigator
Plug 'kyazdani42/nvim-tree.lua'
Plug 'dyng/ctrlsf.vim' " Mimics Ctrl-Shift-F on Sublime Text 2
" LSP, code completion, code highlighting
Plug 'neovim/nvim-lspconfig' |
  \  Plug 'hrsh7th/nvim-compe' |
  \  Plug 'nvim-lua/lsp-status.nvim' |
  \  Plug 'glepnir/lspsaga.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} |
  \ Plug 'p00f/nvim-ts-rainbow'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets' " Snippets for vim
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
autocmd FileType javascript,javascriptreact,typescript,typescriptreact
  \ UltiSnipsAddFiletypes javascript.javascriptreact.typescript.typescriptreact
" Appearance
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'henrik/vim-indexed-search' " Display number of search results
Plug 'hoob3rt/lualine.nvim'
Plug 'joshdick/onedark.vim' " Colorscheme based on atom onedark
Plug 'dstein64/nvim-scrollview'
Plug 'kyazdani42/nvim-web-devicons' " icons for lua plugins
Plug 'ryanoasis/vim-devicons' " icons
" Ruby
Plug 'ecomba/vim-ruby-refactoring'
Plug 'p0deje/vim-ruby-interpolation' " Simple plugin to add {} after hitting #
Plug 'tpope/vim-endwise'             " add 'end' in ruby, endfunction/endif/more in vim script, etc
Plug 'tpope/vim-rails'               " rails.vim: Ruby on Rails power tools
" HTMLish
Plug 'Valloric/MatchTagAlways'  " A Vim plugin that always highlights the enclosing html/xml tags
Plug 'AndrewRadev/tagalong.vim' " Change an HTML(ish) opening tag and take the closing one along as well
Plug 'tpope/vim-ragtag'         " mappings for templating languages (ex <% %>, <%= %>, <!-- -->
Plug 'mattn/emmet-vim'
" Other languages
Plug 'sheerun/vim-polyglot' " Better support for some languages
source $HOME/.config/nvim/plugins/polyglot_config.vim
Plug 'chrisbra/csv.vim'

call plug#end()

source $HOME/.config/nvim/plugins/onedark_config.vim
source $HOME/.config/nvim/plugins/ctrlsf_config.vim
source $HOME/.config/nvim/plugins/endwise_config.vim
source $HOME/.config/nvim/plugins/vim_doge_config.vim
source $HOME/.config/nvim/plugins/emmet_config.vim
source $HOME/.config/nvim/plugins/fugitive_config.vim
source $HOME/.config/nvim/plugins/hexokinase_config.vim
source $HOME/.config/nvim/plugins/matchtagalways_config.vim
source $HOME/.config/nvim/plugins/nvim_tree_config.vim
source $HOME/.config/nvim/plugins/ragtag_config.vim
source $HOME/.config/nvim/plugins/sneak_config.vim
source $HOME/.config/nvim/plugins/vim_rails_config.vim
source $HOME/.config/nvim/plugins/vim_test_config.vim

luafile $HOME/.config/nvim/lua/nvim_treesitter_config.lua
luafile $HOME/.config/nvim/lua/lualine_config.lua
luafile $HOME/.config/nvim/lua/lsp_config.lua
luafile $HOME/.config/nvim/lua/compe_config.lua
luafile $HOME/.config/nvim/lua/telescope_config.lua
luafile $HOME/.config/nvim/lua/bufferline_config.lua

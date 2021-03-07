call plug#begin('~/.local/share/nvim/plugged')

Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-commentary'
Plug 'kkoomen/vim-doge', { 'do': { -> doge#install() } }
Plug 'tpope/vim-fugitive' | Plug 'tpope/vim-rhubarb' " git wrapper + Github integration
Plug 'tpope/vim-repeat' " enable repeating supported plugin maps with '.'
Plug 'tpope/vim-surround' " Vim Surround
Plug 'janko-m/vim-test' | Plug 'benmills/vimux' " Vim test runner
Plug 'mg979/vim-visual-multi', {'branch': 'master'} " Multiple cursors
Plug 'AndrewRadev/splitjoin.vim' " change between multiline and single-line code
Plug 'christoomey/vim-tmux-navigator' " Seamless navigation between tmux panes and vim splits
Plug 'jiangmiao/auto-pairs' " insert or delete brackets, parens, quotes in pair
Plug 'mhinz/vim-signify' " Git gutter
Plug 'akinsho/nvim-bufferline.lua'

" Navigation
" Plug 'nvim-lua/telescope.nvim' |
"   \ Plug 'nvim-lua/popup.nvim' |
"   \ Plug 'nvim-lua/plenary.nvim' |
"   \ Plug 'nvim-telescope/telescope-fzy-native.nvim' " File navigator
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }  |
  \ Plug 'junegunn/fzf.vim'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'dyng/ctrlsf.vim' " Mimics Ctrl-Shift-F on Sublime Text 2

" LSP, code completion, code highlighting
Plug 'neovim/nvim-lspconfig' |
  \ Plug 'hrsh7th/nvim-compe' |
  \ Plug 'nvim-lua/lsp-status.nvim' |

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} |
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets' " Snippets for vim

" TODO: Use this until LSP formattter is stable
Plug 'w0rp/ale'
" {{{
let g:ale_disable_lsp = 1
let b:ale_linters = []
let g:ale_fixers = {
      \'*': ['remove_trailing_lines', 'trim_whitespace'],
      \'html': ['prettier'],
      \'css': ['prettier'],
      \'javascript': ['eslint'],
      \'javascriptreact': ['eslint'],
      \'ruby': ['rubocop'],
      \'typescript': ['eslint', 'prettier'],
      \}
" }}}

" Appearance
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' } " Display colors next to codes
Plug 'henrik/vim-indexed-search' " Display number of search results
Plug 'hoob3rt/lualine.nvim'
Plug 'joshdick/onedark.vim' " Colorscheme based on atom onedark
Plug 'kyazdani42/nvim-web-devicons' " icons for lua plugins
Plug 'ryanoasis/vim-devicons' " icons
Plug 'dstein64/nvim-scrollview'
" Plug 'lukas-reineke/indent-blankline.nvim'
" let g:indentLine_char = ''
" let g:indentLine_bufTypeExclude = ['help', 'terminal']
" let g:indent_blankline_char = '·'
" let g:indent_blankline_char_highlight = 'Whitespace'
" let g:indent_blankline_space_char = '·'
" let g:indent_blankline_space_char_highlight = 'Whitespace'
" let g:indent_blankline_use_treesitter = v:true
" let g:indent_blankline_debug = v:true
" Ruby
Plug 'ecomba/vim-ruby-refactoring'
Plug 'p0deje/vim-ruby-interpolation' " Simple plugin to add {} after hitting #
Plug 'tpope/vim-endwise'             " add 'end' to functons
Plug 'tpope/vim-rails'               " rails.vim: Ruby on Rails power tools

" JS
" FIXME: https://github.com/nvim-treesitter/nvim-treesitter/issues/921
Plug 'yuezk/vim-js' | Plug 'MaxMEllon/vim-jsx-pretty'
let g:vim_jsx_pretty_highlight_close_tag = 1
let g:vim_jsx_pretty_colorful_config = 1

" HTMLish
Plug 'Valloric/MatchTagAlways'  " Highlights enclosing html/xml tags
Plug 'AndrewRadev/tagalong.vim' " Change opening tag and closing tags
Plug 'tpope/vim-ragtag' " ex <% %>, <%= %>, <!-- -->
Plug 'mattn/emmet-vim', { 'for': ['html', 'javascript', 'typescript', 'javascriptreact', 'typescriptreact'] }

" Other
Plug 'chrisbra/csv.vim'
let g:csv_no_progress = 1
let g:csv_strict_columns = 1
let g:csv_start = 1
let g:csv_end = 100

call plug#end()

source $HOME/.config/nvim/plugins/onedark_config.vim
source $HOME/.config/nvim/plugins/ctrlsf_config.vim
source $HOME/.config/nvim/plugins/endwise_config.vim
source $HOME/.config/nvim/plugins/vim_doge_config.vim
source $HOME/.config/nvim/plugins/emmet_config.vim
source $HOME/.config/nvim/plugins/fugitive_config.vim
source $HOME/.config/nvim/plugins/fzf_config.vim
source $HOME/.config/nvim/plugins/hexokinase_config.vim
source $HOME/.config/nvim/plugins/matchtagalways_config.vim
source $HOME/.config/nvim/plugins/nvim_tree_config.vim
source $HOME/.config/nvim/plugins/ragtag_config.vim
source $HOME/.config/nvim/plugins/sneak_config.vim
source $HOME/.config/nvim/plugins/ultisnips_config.vim
source $HOME/.config/nvim/plugins/vim_rails_config.vim
source $HOME/.config/nvim/plugins/vim_test_config.vim

luafile $HOME/.config/nvim/lua/lsp/init.lua
luafile $HOME/.config/nvim/lua/nvim_treesitter_config.lua
luafile $HOME/.config/nvim/lua/lualine_config.lua
luafile $HOME/.config/nvim/lua/compe_config.lua
" luafile $HOME/.config/nvim/lua/telescope_config.lua
luafile $HOME/.config/nvim/lua/bufferline_config.lua

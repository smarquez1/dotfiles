call plug#begin('~/.local/share/nvim/plugged')

Plug 'unblevable/quick-scope'
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
Plug 'nvim-lua/telescope.nvim' |
      \ Plug 'nvim-lua/popup.nvim' |
      \ Plug 'nvim-lua/plenary.nvim' |
      \ Plug 'nvim-telescope/telescope-fzy-native.nvim' " File navigator
Plug 'kyazdani42/nvim-tree.lua'
Plug 'dyng/ctrlsf.vim' " Mimics Ctrl-Shift-F on Sublime Text 2

" LSP, code completion, code highlighting
Plug 'w0rp/ale'
" let g:ale_fix_on_save = 1
let g:ale_echo_cursor = 0
let g:ale_disable_lsp = 1
let g:ale_set_highlights = 1
let g:ale_virtualtext_cursor = 1
let g:ale_lint_on_text_changed = 'always'
let g:ale_linters = {
      \'html': ['eslint'],
      \'css': ['csslint'],
      \'ruby': ['solargraph'],
      \'javascript': ['eslint'],
      \'typescript': ['eslint'],
      \'lua': ['luacheck'],
      \}

let g:ale_fixers = {
      \'*': ['remove_trailing_lines', 'trim_whitespace'],
      \'html': ['prettier'],
      \'css': ['prettier'],
      \'javascript': ['eslint', 'prettier'],
      \'ruby': ['rubocop'],
      \'typescript': ['eslint', 'prettier'],
      \}

Plug 'neovim/nvim-lspconfig' |
  \  Plug 'hrsh7th/nvim-compe' |
  \  Plug 'nvim-lua/lsp-status.nvim' |
  \  Plug 'glepnir/lspsaga.nvim'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} |
  \ Plug 'p00f/nvim-ts-rainbow'

Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets' " Snippets for vim

" If you want to use snippet for multiple filetypes, you can `g:vsnip_filetypes` for it.
let g:vsnip_filetypes = {}
let g:vsnip_filetypes.javascriptreact = ['javascript']
let g:vsnip_filetypes.typescriptreact = ['typescript']

" Appearance
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' } " Display colors next to codes
Plug 'henrik/vim-indexed-search' " Display number of search results
Plug 'hoob3rt/lualine.nvim'
Plug 'joshdick/onedark.vim' " Colorscheme based on atom onedark
Plug 'fnune/base16-vim'
let base16colorspace=256
Plug 'dstein64/nvim-scrollview'
Plug 'kyazdani42/nvim-web-devicons' " icons for lua plugins
Plug 'ryanoasis/vim-devicons' " icons
" Plug 'lukas-reineke/indent-blankline.nvim'
" let g:indentLine_char = ''
" let g:indentLine_bufTypeExclude = ['help', 'terminal']
" Ruby
Plug 'ecomba/vim-ruby-refactoring'
Plug 'p0deje/vim-ruby-interpolation' " Simple plugin to add {} after hitting #
Plug 'tpope/vim-endwise'             " add 'end' to functons
Plug 'tpope/vim-rails'               " rails.vim: Ruby on Rails power tools

" HTMLish
Plug 'Valloric/MatchTagAlways'  " Highlights enclosing html/xml tags
Plug 'AndrewRadev/tagalong.vim' " Change opening tag and closing tags
Plug 'tpope/vim-ragtag' " ex <% %>, <%= %>, <!-- -->
Plug 'mattn/emmet-vim', { 'for': ['html', 'javascript', 'typescript', 'javascriptreact', 'typescriptreact'] }


" Other languages
Plug 'chrisbra/csv.vim'
Plug 'sheerun/vim-polyglot' " Better support for some languages

source $HOME/.config/nvim/plugins/polyglot_config.vim

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
source $HOME/.config/nvim/plugins/ultisnips_config.vim
source $HOME/.config/nvim/plugins/vim_rails_config.vim
source $HOME/.config/nvim/plugins/vim_test_config.vim

luafile $HOME/.config/nvim/lua/nvim_treesitter_config.lua
luafile $HOME/.config/nvim/lua/lualine_config.lua
luafile $HOME/.config/nvim/lua/lsp_config.lua
luafile $HOME/.config/nvim/lua/compe_config.lua
luafile $HOME/.config/nvim/lua/telescope_config.lua
luafile $HOME/.config/nvim/lua/bufferline_config.lua

"coc.vim: Intellisense engine for vim8 & neovim, full language server protocol support as VSCode 

call plug#begin('~/.local/share/nvim/plugged')
Plug 'AndrewRadev/splitjoin.vim' " A vim plugin that simplifies the transition between multiline and single-line code
Plug 'dyng/ctrlsf.vim' " An ack.vim alternative mimics Ctrl-Shift-F on Sublime Text 2
Plug 'janko-m/vim-test' " Vim test runner
" Plug 'junegunn/fzf.vim'                 " fuzzy finder support
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } | Plug 'coreyja/fzf.devicon.vim' 
Plug 'junegunn/vim-easy-align' " A Vim alignment plugin
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-commentary' " Comments
Plug 'tpope/vim-fugitive' " A Git wrapper so awesome, it should be illegal
Plug 'tpope/vim-repeat' " enable repeating supported plugin maps with '.'
Plug 'tpope/vim-rhubarb' " vim-fugitive Github integration
Plug 'honza/vim-snippets'
Plug 'tpope/vim-surround' " Vim Surround
Plug 'Yggdroot/indentLine' | Plug 'lukas-reineke/indent-blankline.nvim'

" Tmux integration
Plug 'benmills/vimux' " vim plugin to interact with tmux
Plug 'christoomey/vim-tmux-navigator' " Seamless navigation between tmux panes and vim splits

" Appearance
Plug 'henrik/vim-indexed-search' " Display number of search results
Plug 'itchyny/lightline.vim' " A light and configurable statusline/tabline plugin for Vim
Plug 'ryanoasis/vim-devicons'
Plug 'dracula/vim', { 'as': 'dracula' }

" HTMLish
Plug 'Valloric/MatchTagAlways'  " A Vim plugin that always highlights the enclosing html/xml tags
Plug 'AndrewRadev/tagalong.vim' " Change an HTML(ish) opening tag and take the closing one along as well
Plug 'tpope/vim-ragtag'         " mappings for templating languages (ex <% %>, <%= %>, <!-- -->

" Ruby
Plug 'ecomba/vim-ruby-refactoring'   " Refactoring tool for Ruby in vim!
Plug 'p0deje/vim-ruby-interpolation' " Simple plugin to add {} after hitting #
Plug 'tpope/vim-endwise'             " add 'end' in ruby, endfunction/endif/more in vim script, etc
Plug 'tpope/vim-rails'               " rails.vim: Ruby on Rails power tools

" other languages
Plug 'chrisbra/csv.vim'     " A Filetype plugin for csv files
Plug 'sheerun/vim-polyglot' " Better support for some languages
call plug#end()

source $HOME/.config/nvim/general.vim
source $HOME/.config/nvim/plugins.vim
source $HOME/.config/nvim/keys.vim

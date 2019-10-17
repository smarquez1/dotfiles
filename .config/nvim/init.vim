"coc.vim: Intellisense engine for vim8 & neovim, full language server protocol support as VSCode 

let s:coc_global_extensions = [
      \ 'coc-css', 
      \ 'coc-eslint',
      \ 'coc-tsserver',
      \ 'coc-solargraph'
      \ ]

call plug#begin('~/.local/share/nvim/plugged')
Plug 'AndrewRadev/splitjoin.vim'
Plug 'AndrewRadev/tagalong.vim'
Plug 'Valloric/MatchTagAlways' " A Vim plugin that always highlights the enclosing html/xml tags
Plug 'airblade/vim-gitgutter' " Show git diff in the gutter
Plug 'alvan/vim-closetag' "Auto close (X)HTML tags
Plug 'benmills/vimux' " vim plugin to interact with tmux
Plug 'chriskempson/base16-vim' " Base16 colors
Plug 'christoomey/vim-tmux-navigator' " Seamless navigation between tmux panes and vim splits
Plug 'cloudhead/neovim-fuzzy' " Fuzzy finder using fzy
Plug 'dyng/ctrlsf.vim' " An ack.vim alternative mimics Ctrl-Shift-F on Sublime Text 2
Plug 'ecomba/vim-ruby-refactoring' " Refactoring tool for Ruby in vim!
Plug 'henrik/vim-indexed-search' " Display number of search results
Plug 'honza/vim-snippets' | Plug 'jvanja/vim-bootstrap4-snippets' " Snippets
Plug 'itchyny/lightline.vim' " A light and configurable statusline/tabline plugin for Vim
Plug 'janko-m/vim-test' " Vim test runner
Plug 'jiangmiao/auto-pairs' " Vim plugin, insert or delete brackets, parens, quotes in pair
Plug 'junegunn/vim-easy-align' " A Vim alignment plugin
Plug 'mattn/emmet-vim' " emmet for vim
Plug 'mhartington/oceanic-next'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'p0deje/vim-ruby-interpolation' " Simple plugin to add {} after hitting #
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' } " Display css colors
Plug 'scrooloose/nerdtree' " File explorer like navigation
Plug 'sheerun/vim-polyglot' " Better support for some languages
Plug 'slashmili/alchemist.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-commentary' " Comments
Plug 'tpope/vim-endwise' " add 'end' in ruby, endfunction/endif/more in vim script, etc 
Plug 'tpope/vim-fugitive' " A Git wrapper so awesome, it should be illegal
Plug 'tpope/vim-ragtag' " ghetto HTML/XML mappings (formerly allml.vim)
Plug 'tpope/vim-rails'
Plug 'tpope/vim-repeat' " enable repeating supported plugin maps with '.'
Plug 'tpope/vim-rhubarb' " vim-fugitive Github integration
Plug 'tpope/vim-surround' " Vim Surround
Plug 'w0rp/ale' " Asynchronous linting/fixing for Vim and LSP integration
call plug#end()

source $HOME/.config/nvim/general.vim
source $HOME/.config/nvim/plugins.vim
source $HOME/.config/nvim/keys.vim

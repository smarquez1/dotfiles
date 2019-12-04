"coc.vim: Intellisense engine for vim8 & neovim, full language server protocol support as VSCode 

let s:coc_global_extensions = [
      \ 'coc-css', 
      \ 'coc-eslint',
      \ 'coc-tsserver',
      \ 'coc-git',
      \ 'coc-hightlight',
      \ 'coc-solargraph'
      \ ]

call plug#begin('~/.local/share/nvim/plugged')
Plug 'AndrewRadev/splitjoin.vim' " A vim plugin that simplifies the transition between multiline and single-line code
Plug 'AndrewRadev/tagalong.vim' " Change an HTML(ish) opening tag and take the closing one along as well
Plug 'Valloric/MatchTagAlways' " A Vim plugin that always highlights the enclosing html/xml tags
Plug 'alvan/vim-closetag' "Auto close (X)HTML tags
Plug 'benmills/vimux' " vim plugin to interact with tmux
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
Plug 'joshdick/onedark.vim'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'p0deje/vim-ruby-interpolation' " Simple plugin to add {} after hitting #
Plug 'scrooloose/nerdtree' " File explorer like navigation
Plug 'sheerun/vim-polyglot' " Better support for some languages
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-commentary' " Comments
Plug 'tpope/vim-endwise' " add 'end' in ruby, endfunction/endif/more in vim script, etc 
Plug 'tpope/vim-fugitive' " A Git wrapper so awesome, it should be illegal
Plug 'tpope/vim-ragtag' " ghetto HTML/XML mappings (formerly allml.vim)
Plug 'tpope/vim-rails'
Plug 'tpope/vim-repeat' " enable repeating supported plugin maps with '.'
Plug 'tpope/vim-rhubarb' " vim-fugitive Github integration
Plug 'tpope/vim-surround' " Vim Surround
Plug 'Yggdroot/indentLine'
call plug#end()

source $HOME/.config/nvim/general.vim
source $HOME/.config/nvim/plugins.vim
source $HOME/.config/nvim/keys.vim

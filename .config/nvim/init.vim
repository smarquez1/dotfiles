"coc.vim: Intellisense engine for vim8 & neovim, full language server protocol support as VSCode 
call plug#begin('~/.local/share/nvim/plugged')

Plug 'AndrewRadev/splitjoin.vim'
Plug 'AndrewRadev/tagalong.vim'

Plug 'RRethy/vim-hexokinase' " Display css colors
Plug 'Valloric/MatchTagAlways' " A Vim plugin that always highlights the enclosing html/xml tags
Plug 'airblade/vim-gitgutter' " Show git diff in the gutter
Plug 'alvan/vim-closetag' "Auto close (X)HTML tags
Plug 'benmills/vimux' " vim plugin to interact with tmux
Plug 'chriskempson/base16-vim' " Base16 colors
Plug 'christoomey/vim-tmux-navigator' " Seamless navigation between tmux panes and vim splits
Plug 'cloudhead/neovim-fuzzy' " Fuzzy finder using fzy
Plug 'dyng/ctrlsf.vim' " An ack.vim alternative mimics Ctrl-Shift-F on Sublime Text 2
Plug 'henrik/vim-indexed-search' " Display number of search results
Plug 'honza/vim-snippets' | Plug 'jvanja/vim-bootstrap4-snippets' " Snippets
Plug 'itchyny/lightline.vim' " A light and configurable statusline/tabline plugin for Vim
Plug 'janko-m/vim-test' " Vim test runner
Plug 'jiangmiao/auto-pairs' " Vim plugin, insert or delete brackets, parens, quotes in pair
Plug 'junegunn/vim-easy-align' " A Vim alignment plugin
" Plug 'justinmk/vim-sneak' " Precise cursor movement
Plug 'mattn/emmet-vim' " emmet for vim
Plug 'mhartington/oceanic-next'
" Plug 'neoclide/coc.nvim', { 'do': function('PlugCoc') } 
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

let s:coc_global_extensions = [
      \ 'coc-solargraph'
      \ ]

" let s:coc_global_extensions = [
"       \ 'coc-eslint',
"       \ 'coc-emoji',
"       \ 'coc-tsserver',
"       \ 'coc-vetur',
"       \ 'coc-css', 
"       \ 'coc-html',     
"       \ 'coc-json',
"       \ 'coc-snippets',
"       \ 'coc-solargraph',
"       \ 'coc-tsserver',
"       \ 'coc-yaml'
"       \ ]

Plug 'scrooloose/nerdtree' " File explorer like navigation
Plug 'sheerun/vim-polyglot' " Better support for some languages
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-commentary' " Comments
Plug 'tpope/vim-fugitive' " A Git wrapper so awesome, it should be illegal
Plug 'tpope/vim-ragtag' " ghetto HTML/XML mappings (formerly allml.vim)
Plug 'tpope/vim-repeat' " enable repeating supported plugin maps with "."
Plug 'tpope/vim-surround' " Vim Surround
Plug 'w0rp/ale' " Asynchronous linting/fixing for Vim and LSP integration
Plug 'tpope/vim-rhubarb' " vim-fugitive Github integration
Plug 'slashmili/alchemist.vim'
Plug 'p0deje/vim-ruby-interpolation' " Simple plugin to add {} after hitting #
Plug 'ecomba/vim-ruby-refactoring' " Refactoring tool for Ruby in vim!
Plug 'tpope/vim-endwise' " add 'end' in ruby, endfunction/endif/more in vim script, etc 
Plug 'tpope/vim-rails'
Plug 'othree/javascript-libraries-syntax.vim'

call plug#end()

source $HOME/.config/nvim/general.vim
source $HOME/.config/nvim/plugins.vim
source $HOME/.config/nvim/keys.vim


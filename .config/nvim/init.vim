call plug#begin('~/.local/share/nvim/plugged')

Plug 'AndrewRadev/splitjoin.vim' " Simplifies transition between multiline and single-line code
Plug 'dyng/ctrlsf.vim' " An ack.vim alternative mimics Ctrl-Shift-F on Sublime Text 2
Plug 'janko-m/vim-test' " Vim test runner
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } |
      \ Plug 'junegunn/fzf.vim' |
      \ Plug 'stsewd/fzf-checkout.vim' " fuzzy finder 
Plug 'junegunn/vim-easy-align' " A Vim alignment plugin
Plug 'justinmk/vim-sneak' " Jump to any location specified by two characters.
Plug 'honza/vim-snippets' " Snippets for vim
Plug 'mg979/vim-visual-multi', {'branch': 'master'} " Multiple cursors
Plug 'tpope/vim-commentary' " Comments
Plug 'tpope/vim-fugitive' " A Git wrapper so awesome, it should be illegal
Plug 'tpope/vim-repeat' " enable repeating supported plugin maps with '.'
Plug 'tpope/vim-rhubarb' " vim-fugitive Github integration
Plug 'tpope/vim-surround' " Vim Surround
Plug 'mhinz/vim-signify' " git gutter signs
Plug 'jiangmiao/auto-pairs'
Plug 'mattn/emmet-vim'
Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': ':UpdateRemotePlugins'}

" LSP
Plug 'neovim/nvim-lsp'
 " async completion framework
Plug 'nvim-lua/completion-nvim' | Plug 'steelsojka/completion-buffers'
Plug 'nvim-lua/diagnostic-nvim'
Plug 'nvim-lua/lsp-status.nvim'
" Appearance
Plug 'ap/vim-css-color' " Highlight colors
Plug 'henrik/vim-indexed-search' " Display number of search results
Plug 'itchyny/lightline.vim' " A light and configurable statusline/tabline plugin for Vim
Plug 'ryanoasis/vim-devicons'
Plug 'joshdick/onedark.vim'

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
Plug 'sheerun/vim-polyglot' " Better support for some languages

" Tmux integration
Plug 'benmills/vimux' " vim plugin to interact with tmux
Plug 'christoomey/vim-tmux-navigator' " Seamless navigation between tmux panes and vim splits

call plug#end()

" nvim-lsp {{{
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
" }}}

" completion-nvim {{{
let g:completion_enable_snippet = 'UltiSnips'
let g:completion_enable_auto_hover = 1
let g:completion_auto_change_source = 1
let g:completion_enable_auto_paren = 0
let g:completion_timer_cycle = 80
let g:completion_auto_change_source = 1

" Use completion-nvim in every buffer
" autocmd BufEnter * lua require'completion'.on_attach()

" fix conflict between completion-nvim and autopairs
" imap <expr> <cr>  pumvisible() ? complete_info()["selected"] != "-1" ?
"       \ "\<Plug>(completion_confirm_completion)"  : "\<c-e>\<CR>" :  "\<CR>"
" }}}

" diagnostic-nvim {{{
let g:diagnostic_level = 'Warning'
let g:diagnostic_enable_virtual_text = 0 
let g:diagnostic_virtual_text_prefix = '? '
let g:diagnostic_trimmed_virtual_text = '20'
let g:diagnostic_insert_delay = 1

call sign_define("LspDiagnosticsErrorSign", {"text" : ">>", "texthl" : "LspDiagnosticsError"})
call sign_define("LspDiagnosticsWarningSign", {"text" : "?", "texthl" : "LspDiagnosticsWarning"})
call sign_define("LspDiagnosticsInformationSign", {"text" : "?", "texthl" : "LspDiagnosticsInformation"})
call sign_define("LspDiagnosticsHintSign", {"text" : "?", "texthl" : "LspDiagnosticsWarning"})

autocmd CursorHold * lua vim.lsp.util.show_line_diagnostics()
" }}}

luafile $HOME/.config/nvim/lua/init.lua

source $HOME/.config/nvim/general.vim
source $HOME/.config/nvim/plugins.vim
source $HOME/.config/nvim/keys.vim


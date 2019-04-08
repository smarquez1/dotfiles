let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
let g:Hexokinase_refreshEvents = ['BufWritePost', 'BufEnter']
" let g:gutentags_ctags_executable='ptags'
let g:ale_linters = {
      \   'javascript': ['eslint'],
      \   'scss': ['stylelint'],
      \   'css': ['stylelint'],
      \   'elixir': ['mix_format', 'elixir-ls', 'credo'],
      \   'ruby': ['rubocop', 'solargraph', 'ruby'],
      \   'yaml': ['prettier']
      \}

let g:ale_fixers = {
      \   '*': ['prettier', 'remove_trailing_lines', 'trim_whitespace'],
      \   'css': ['stylelint'],
      \   'javascript': ['eslint'],
      \   'elixir': ['mix_format'],
      \   'vue': ['eslint'],
      \   'scss': ['stylelint'],
      \   'ruby': ['rubocop']
      \}
let g:ale_set_signs = 1
" hi link ALEErrorLine ErrorMsg
" hi link ALEWarningLine WarningMsg
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_delay = 0
let g:ctrlsf_auto_close = {
      \ "normal" : 0,
      \ "compact": 0
      \}
let g:ctrlsf_auto_focus = {
      \ "at": "start"
      \ }
" let g:ctrlsf_default_view_mode = 'compact'
" let g:ctrlsf_default_root = 'project'
" let g:ctrlsf_search_mode='async'
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.js, *.jsx, *.erb"
let g:ragtag_global_maps = 1
autocmd FileType html,erb,jsx,vue EmmetInstall
" Hide statusline of terminal buffer
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
      \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

" Close FZF using esc
au FileType fzf tunmap <Esc>
" Customize fzf colors to match your color scheme
let g:fzf_colors =
      \ { 'fg':      ['fg', 'Normal'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'hl':      ['fg', 'Comment'],
      \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
      \ 'hl+':     ['fg', 'Statement'],
      \ 'info':    ['fg', 'PreProc'],
      \ 'border':  ['fg', 'Ignore'],
      \ 'prompt':  ['fg', 'Conditional'],
      \ 'pointer': ['fg', 'Exception'],
      \ 'marker':  ['fg', 'Keyword'],
      \ 'spinner': ['fg', 'Label'],
      \ 'header':  ['fg', 'Comment'] }

" Use ripgrep
let $FZF_DEFAULT_COMMAND = 'rg --files'

" Mappings
nnoremap <silent> <Leader>f :Files<CR>
let g:multi_cursor_exit_from_visual_mode = 0
let g:multi_cursor_exit_from_insert_mode  = 0
"let g:rubycomplete_rails = 1
let g:vim_markdown_conceal = 0
let g:jsx_ext_required = 1
" let test#strategy = "neovim"
" let test#neovim#term_position = "vert"
let test#strategy = "vimux"
" Use `[c` and `]c` for navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)
" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'
" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'
let g:coc_snippet_next = '<tab>'
let g:AutoPairsMultilineClose = 1
" let base16colorspace=256 
let g:lightline = {
      \ 'colorscheme': 'Tomorrow_Night_Eighties',
      \ 'active': {
      \   'left': [['mode', 'paste'],
      \            ['cocstatus', 'readonly', 'gitbranch', 'filename', 'modified']],
      \   'right': [['lineinfo'],
      \             ['percent'],
      \             ['filetype', 'linter_errors']]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head',
      \   'cocstatus': 'coc#status'
      \ }
      \ }
let g:fugitive_git_executable = 'LANG=en_US git'
"https://github.com/roxma/nvim-completion-manager/issues/49
" When the <Enter> key is pressed while the popup menu is visible, it only
" hides the menu. Use this mapping to close the menu and also start a new
" line.
let g:endwise_no_mappings = 1
imap <C-X><CR> <CR><Plug> AlwaysEnd
imap <expr> <CR> (pumvisible() ? "\<C-Y>\<CR>\<Plug>DiscretionaryEnd" : "\<CR>\<Plug>DiscretionaryEnd")
let g:used_javascript_libs = 'underscore,jquery,react,vue,jasmine'

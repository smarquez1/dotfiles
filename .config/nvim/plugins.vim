" Lightline
let g:lightline = {
      \ 'colorscheme': 'oceanicnext',
      \ 'active': {
      \   'left':   [ [ 'mode', 'paste' ],
      \               [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
      \   'right':  [ [ 'lineinfo' ],
      \               [ 'filetype' ]
      \             ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head',
      \ },
      \ }

" Hexokinase
let g:Hexokinase_refreshEvents = ['BufWritePost', 'BufEnter']

" Vim Sneak
let g:sneak#label = 1
nmap f <Plug>Sneak_s
nmap F <Plug>Sneak_S

" Vim ALE
let g:ale_linters = {
      \   'javascript': ['eslint'],
      \   'scss': ['stylelint'],
      \   'css': ['stylelint'],
      \   'elixir': ['mix_format', 'elixir-ls', 'credo'],
      \   'eruby': ['erb'],
      \   'ruby': ['ruby', 'rubocop'],
      \   'yaml': ['prettier']
\}

let g:ale_fixers = {
\   'css': ['stylelint'],
\   'javascript': ['eslint'],
\   'elixir': ['mix_format'],
\   'vue': ['eslint'],
\   'scss': ['stylelint'],
\   'ruby': ['rubocop']
\}

let g:ale_lint_on_insert_leave = 1

" CTRLSF
" Use rg as backend
let g:ctrlsf_ackprg = 'rg'
" Disable auto close
let g:ctrlsf_auto_close = {
\ "normal" : 0,
\ "compact": 0
\}
let g:ctrlsf_auto_focus = {
\ "at": "start"
\ }

" Closetag
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.js, *.jsx, *.erb"

" ragtag
let g:ragtag_global_maps = 1

" Emmet
autocmd FileType html,erb,jsx,vue EmmetInstall

" FZF
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

" Multiple cursors
let g:multi_cursor_exit_from_visual_mode = 0
let g:multi_cursor_exit_from_insert_mode  = 0

" vim-test
" let test#neovim#term_position = "vert"
let test#strategy = "vimux"

" COC
" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'
" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'
let g:coc_snippet_next = '<tab>'

" Autopairs
let g:AutoPairsMultilineClose = 1

" Fugitive
let g:fugitive_git_executable = 'LANG=en_US git'

" Polyglot
" Don't threat all js files as jsx
let g:jsx_ext_required = 1

" javascript libraries
let g:used_javascript_libs = 'underscore, jquery, react, vue, jasmine'

" NERDTree
" Don't show help, press ? to get it
let g:NERDTreeMinimalUI = 1
" Delete buffer after file rename, delete
let g:NERDTreeAutoDeleteBuffer=1

" Autopairs
let g:AutoPairsFlyMode = 0
let g:AutoPairs = { '(':')', '[':']', '{':'}',"'":"'",'"':'"', "`":"`", '```':'```', '"""':'"""', "'''":"'''", "|":"|" }

" Closetag
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.js, *.jsx, *.erb"

" CTRLSF
" Use rf as backend
let g:ctrlsf_ackprg = 'fd'
" Disable auto close
let g:ctrlsf_auto_close = {
\ "normal" : 0,
\ "compact": 0
\}
let g:ctrlsf_auto_focus = {
\ "at": "start"
\ }

" CSV.vim
let g:csv_autocmd_arrange = 1
let g:csv_autocmd_arrange_size = 1024*1024

" IndentLine
let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_leadingSpaceChar = '·'
let g:indentLine_enabled = 0 
let g:indentLine_fileTypeExclude = ['help', 'nerdtree', 'markdown']

" Lightline
function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

let g:lightline = {
      \ 'colorscheme': 'onedark',
      \ 'active': {
      \   'left':   [ [ 'mode', 'paste' ],
      \               [ 'cocstatus', 'currentfunction', 'gitbranch', 'readonly', 'filename', 'modified' ] ],
      \   'right':  [ [ 'lineinfo' ],
      \               [ 'filetype' ]
      \             ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status',
      \   'currentfunction': 'CocCurrentFunction',
      \   'gitbranch': 'fugitive#head',
      \ },
      \ }

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

" Close FZF window on escape
au TermOpen * tnoremap <buffer> <Esc> <c-\><c-n>
au FileType fzf tunmap <buffer> <Esc>

let $FZF_DEFAULT_OPTS .= ' --layout=reverse'

" let g:fzf_layout = { 'up': '~40%' }
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

" Fugitive
let g:fugitive_git_executable = 'LANG=en_US git'

" Multiple cursors
let g:multi_cursor_exit_from_visual_mode = 0
let g:multi_cursor_exit_from_insert_mode  = 0

" NERDTree
" Don't show help, press ? to get it
let g:NERDTreeMinimalUI = 1
"  
let NERDTreeDirArrows = 1
" Delete buffer after file rename, delete
let g:NERDTreeAutoDeleteBuffer=1
" Refresh nerdtree when opened
function! NERDTreeRefresh()
    if &filetype == "nerdtree"
        silent exe substitute(mapcheck("R"), "<CR>", "", "")
    endif
endfunction
autocmd BufEnter * call NERDTreeRefresh()

" Polyglot
" Don't threat all js files as jsx
let g:jsx_ext_required = 1
" javascript libraries
let g:used_javascript_libs = 'underscore, jquery, react, vue, jasmine'

" ragtag
let g:ragtag_global_maps = 1

" vim-test
" let test#neovim#term_position = "vert"
let test#strategy = "vimux"
let g:test#ruby#rspec#executable = 'bundle exec rspec'

" Vim Sneak
let g:sneak#label = 1
nmap f <Plug>Sneak_s
nmap F <Plug>Sneak_S

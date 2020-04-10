" CTRLSF
let g:ctrlsf_ackprg = 'rg' " Use rg as backend
let g:ctrlsf_auto_close = { "normal" : 0, "compact": 0 } " Disable auto close
let g:ctrlsf_auto_focus = { "at": "start" } " Focus Ctrlsf buffer after it's called

" coc.nvim
let g:coc_global_extensions = [
      \ 'coc-css', 
      \ 'coc-emmet',
      \ 'coc-eslint',
      \ 'coc-explorer',
      \ 'coc-git',
      \ 'coc-highlight',
      \ 'coc-html',
      \ 'coc-pairs',
      \ 'coc-snippets',
      \ 'coc-solargraph',
      \ 'coc-stylelint',
      \ 'coc-tsserver',
      \ ]

" CSV.vim
let g:csv_autocmd_arrange = 1
let g:csv_autocmd_arrange_size = 1024*1024

" IndentLine
let g:indentLine_enabled = 1
let g:indentLine_char = '│'
let g:indentLine_fileTypeExclude = ['help', 'markdown', 'coc-explorer']

" Lightline
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
      \   'filetype': 'MyFiletype'
      \ },
      \ }

function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

function! MyFiletype()
  return winwidth(0) > 70 ? 
        \ (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') 
        \: ''
endfunction

" MatchTagAlways
let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'javascriptreact' : 1,
    \ 'eruby' : 1,
    \ 'liquid' : 1,
    \ 'markdown' : 1
    \}

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
  \ 'header':  ['fg', 'EndOfBuffer'] }

let $FZF_DEFAULT_COMMAND = 'rg --files --follow --glob "!.git/*"'
let $FZF_DEFAULT_OPTS .= ' --layout=reverse'
" let $FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
let g:fzf_preview_window = '' " Disable preview windows
let g:fzf_layout = { 'window': { 'width': 0.6, 'height': 0.4, 'yoffset': 0, 'border': 'rounded' } }

" Fugitive
let g:fugitive_git_executable = 'LANG=en_US git'

" Multiple cursors
let g:multi_cursor_exit_from_visual_mode = 0
let g:multi_cursor_exit_from_insert_mode  = 0

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

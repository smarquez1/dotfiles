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
  \ 'coc-html',
  \ 'coc-pairs',
  \ 'coc-snippets',
  \ 'coc-solargraph',
  \ 'coc-stylelint',
  \ 'coc-tsserver',
  \ ]

" MatchTagAlways
let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'javascriptreact' : 1,
    \ 'eruby' : 1,
    \ 'liquid' : 1,
    \ 'markdown' : 1
    \}

" FZF
let $FZF_DEFAULT_COMMAND = 'rg --files --follow --glob "!.git/*"'
let $FZF_DEFAULT_OPTS .= ' --layout=reverse'
let g:fzf_preview_window = '' " Disable preview windows
let g:fzf_layout = { 'window': 
\   { 'width': 0.60, 'height': 0.5, 'yoffset': 0, 'border': 'rounded' }
\ }

" Fugitive
let g:fugitive_git_executable = 'LANG=en_US git'

" Polyglot
" Ragtag
let g:ragtag_global_maps = 1

" Multi
" let g:VM_highlight_matches = 'value'

" Lightline
let g:lightline = {
  \ 'colorscheme': 'onedark',
  \ 'active': {
  \   'left':   [ [ 'mode', 'paste' ],
  \               [ 'cocstatus', 'currentfunction', 'gitbranch',
  \                 'readonly', 'filename', 'modified' ] ],
  \   'right':  [ [ 'lineinfo' ],
  \               [ 'percent' ],
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
    \ (strlen(&filetype) ? &filetype : 'no ft') 
    \: ''
endfunction

" Vim-test
" let test#neovim#term_position = "vert"
let test#strategy = "vimux"
" let g:test#ruby#rspec#executable = 'bundle exec rspec'
let test#ruby#use_binstubs = 0

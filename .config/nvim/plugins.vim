" CTRLSF
let g:ctrlsf_ackprg = 'rg' " Use rg as backend
let g:ctrlsf_auto_close = { "normal" : 0, "compact": 0 } " Disable auto close
let g:ctrlsf_auto_focus = { "at": "start" } " Focus Ctrlsf buffer after it's called

" coc.nvim
let g:coc_global_extensions = [
  \ 'coc-css', 
  \ 'coc-eslint',
  \ 'coc-html',
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
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
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
  \               [ 'gitbranch', 'readonly', 'filename', 'modified', 'cocstatus' ] ],
  \   'right':  [ [ 'lineinfo' ],
  \               [ 'percent' ],
  \               [ 'filetype' ]
  \             ]
  \ },
  \ 'component_function': {
  \   'cocstatus': 'coc#status',
  \   'gitbranch': 'fugitive#head',
  \   'readonly': 'StatusReadonly',
  \   'filetype': 'StatusFiletype',
  \   'filename': 'StatusFilename'
  \ },
  \ }

" Can I trim the file format and encoding information on narrow windows
function! StatusFiletype()
  return winwidth(0) > 70 ? 
    \ (strlen(&filetype) ? &filetype : 'no ft') 
    \: ''
endfunction

function! StatusReadonly()
  return &readonly && &filetype !=# 'help' ? '🔒' : ''
endfunction

function! StatusFilename()
  " return &filetype ==# 'CHADTree' ? vimfiler#get_status_string() :
  return &filetype ==# 'FAKE' ? vimfiler#get_status_string() :
        \ expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
endfunction

" Vim-test
" let test#neovim#term_position = "vert"
let test#strategy = "vimux"
" let g:test#ruby#rspec#executable = 'bundle exec rspec'
let test#ruby#use_binstubs = 0

" Sneak
let g:sneak#label = 1
" case insensitive sneak
let g:sneak#use_ic_scs = 1
" immediately move to the next instance of search, if you move the cursor sneak is back to default behavior
let g:sneak#s_next = 1

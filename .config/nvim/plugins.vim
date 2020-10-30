" MatchTagAlways
let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'javascriptreact' : 1,
    \ 'eruby' : 1,
    \ 'liquid' : 1,
    \ 'markdown' : 1
    \}

" endwise
let g:endwise_no_mappings=1

" FZF
" let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
" let $FZF_DEFAULT_OPTS .= ' --layout=reverse'
" let g:fzf_preview_window = '' " Disable preview windows
" let g:fzf_layout = { 'window': 
" \   { 'width': 0.60, 'height': 0.5, 'yoffset': 0, 'border': 'rounded' }
" \ }

" Fugitive
let g:fugitive_git_executable = 'LANG=en_US git'

" Ragtag
let g:ragtag_global_maps = 1

" Airline
let g:airline#extensions#hunks#enabled = 0
let g:airline#extensions#wordcount#enabled = 0
let g:airline#extensions#whitespace#enabled = 0
let g:airline_section_z = '%l:%c'
let g:airline_theme='onedark'

" Lightline
" let g:lightline = {
"   \ 'colorscheme': 'onedark',
"   \ 'active': {
"   \   'left':   [ [ 'mode', 'paste' ],
"   \               [ 'gitbranch', 'readonly', 'filename', 'modified', 'lspstatus' ] ],
"   \   'right':  [ [ 'lineinfo' ], [ 'percent' ], [ 'filetype' ] ]
"   \ },
"   \ 'component_function': {
"   \   'lspstatus': 'coc#status',
"   \   'gitbranch': 'fugitive#head',
"   \   'readonly': 'StatusReadonly',
"   \   'filetype': 'StatusFiletype',
"   \ },
"   \ }

" " Can I trim the file format and encoding information on narrow windows
" function! StatusFiletype()
"   return winwidth(0) > 70 ? 
"     \ (strlen(&filetype) ? &filetype : 'no ft') 
"     \: ''
" endfunction

" function! StatusReadonly()
"   return &readonly && &filetype !=# 'help' ? '🔒' : ''
" endfunction

" Vim-test
let test#strategy = "vimux"
" let g:test#ruby#rspec#executable = 'bundle exec rspec'
let test#ruby#use_binstubs = 0

" Sneak
let g:sneak#label = 1
" case insensitive sneak
let g:sneak#use_ic_scs = 1
" immediately move to the next instance of search, if you move the cursor sneak is back to default behavior
let g:sneak#s_next = 1

" LSP
" Show hover documentation when holding the cursor
" autocmd CursorHold * silent call CocAction('doHover')

let g:coc_global_extensions = [	
  \ 'coc-css', 	
  \ 'coc-eslint',	
  \ 'coc-explorer',	
  \ 'coc-html',	
  \ 'coc-pairs', 	
  \ 'coc-snippets',	
  \ 'coc-solargraph',	
  \ 'coc-stylelint',	
  \ 'coc-tsserver',	
  \ ]

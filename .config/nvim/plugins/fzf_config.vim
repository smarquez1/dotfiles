let $FZF_DEFAULT_COMMAND = 'fd --type f'
let $FZF_DEFAULT_OPTS .= '--layout=reverse --inline-info'
" let g:fzf_preview_window = 'right:50%:noborder:hidden'
let g:fzf_layout = { 'window':  { 'width': 0.9, 'height': 0.9  } }

" Customize fzf colors to match your color scheme
let g:fzf_colors = {
      \ 'fg':      ['fg', 'Normal'],
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

nmap <leader>f :Files<CR>
nmap <leader>B :Buffers<CR>
nmap <leader>gb :GBranches<CR>
nmap <leader>ht <CMD>Helptags<CR>
" List all YADM tracked files
nmap <leader>ed :call fzf#run(fzf#wrap({'source': 'yadm list -a', 'dir': '~' }))<CR>

autocmd FileType fzf tmap <buffer> <C-j> <Down>
autocmd FileType fzf tmap <buffer> <C-k> <Up>

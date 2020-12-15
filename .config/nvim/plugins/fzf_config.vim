let $FZF_DEFAULT_COMMAND = 'fd --type f'
let $FZF_DEFAULT_OPTS .= '--layout=reverse --inline-info'

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

autocmd FileType fzf tmap <buffer> <C-j> <Down>
autocmd FileType fzf tmap <buffer> <C-k> <Up>

nmap <silent> <leader>f :Files<CR>
nmap <silent> <leader>B :Buffers<CR>
nmap <silent> <leader>gb :GBranches<CR>
nmap <silent> <leader>ht :Helptags<CR>
" List all YADM tracked files
nmap <silent> <leader>ed :call fzf#run(fzf#wrap({'source': 'yadm list -a', 'dir': '~' }))<CR>
" nnoremap <silent> <leader> fs :<C-u>CocFzfList symbols<CR>
nnoremap <silent> <leader>S :CocFzfList symbols<CR>

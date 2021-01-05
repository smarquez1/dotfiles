let $FZF_DEFAULT_COMMAND = 'fd --type f'
let $FZF_DEFAULT_OPTS .= '--layout=reverse --inline-info'

" Customize fzf colors to match your color scheme
" https://github.com/junegunn/fzf.vim/issues/1152#issuecomment-747156597
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

let g:coc_fzf_preview = ''
let g:coc_fzf_opts = []

autocmd FileType fzf tmap <buffer> <C-j> <Down>
autocmd FileType fzf tmap <buffer> <C-k> <Up>

nmap <silent> <leader>f :Files<CR>
nmap <silent> <leader>B :Buffers<CR>
nmap <silent> <leader>gb :GBranches<CR>
nmap <silent> <leader>ht :Helptags<CR>
" List all YADM tracked files
nmap <silent> <leader>ed :call fzf#run(fzf#wrap({'source': 'yadm list -a', 'dir': '~' }))<CR>
nmap <silent> <leader>S :CocFzfList symbols<CR>

" Rails
" TODO: find routes
" function! s:parse_route(selected)
"   let l:squished = substitute(join(a:selected), '^\s\+', '', '')
"   return split(l:squished)[0] . '_path'
" endfunction
"
" inoremap <expr> <c-x><c-r> fzf#complete({
"   \ 'source':  'rake routes',
"   \ 'reducer': '<sid>parse_route'})

" TODO: find models
" nmap <silent> <leader>em :call fzf#run(fzf#wrap({'source': 'git list -a', 'dir': './app/models' }))<CR>
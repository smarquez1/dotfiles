let g:fugitive_git_executable = 'LANG=en_US git'

nmap <leader>gd :Gdiff<CR>
" Open current line in the browser
nmap <leader>gb :.Gbrowse<CR>
" Open visual selection in the browser
vmap <leader>gb :Gbrowse<CR>

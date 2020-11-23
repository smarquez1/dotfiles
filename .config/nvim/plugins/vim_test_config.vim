" Vim-test
let test#strategy = "vimux"
" let g:test#ruby#rspec#executable = 'bundle exec rspec'
let test#ruby#use_binstubs = 0

nmap <leader>T :TestFile<CR>
nmap <leader>t :TestNearest<CR>
nmap <leader>l :TestLast<CR>

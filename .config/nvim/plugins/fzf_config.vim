" FZF.vim
let $FZF_DEFAULT_COMMAND = 'fd --type f'
let $FZF_DEFAULT_OPTS .= ' --layout=reverse --inline-info'
let g:fzf_preview_window = '' " Disable preview windows
let g:fzf_layout = { 'window': 
\   { 'width': 0.60, 'height': 0.5, 'yoffset': 0, 'border': 'rounded' }
\ }

map <silent> <leader>f :Files <CR>
map <silent> <leader>b :Buffers <CR>
map <silent> <leader>ed :call fzf#vim#files('~/.config/nvim')<CR>
map <silent> ht <Cmd>Helptags<CR>


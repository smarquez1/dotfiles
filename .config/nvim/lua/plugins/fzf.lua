local map = require('utils').map

-- Customize fzf colors to match your color scheme
-- https://github.com/junegunn/fzf.vim/issues/1152#issuecomment-747156597
vim.g.fzf_colors = {
  fg =      { 'fg', 'Normal' },
  bg =      { 'bg', 'Normal' },
  hl =      { 'fg', 'Comment' },
  ['fg+'] = { 'fg', 'CursorLine', 'CursorColumn', 'Normal' },
  ['bg+'] = { 'bg', 'CursorLine', 'CursorColumn' },
  ['hl+'] = { 'fg', 'Statement' },
  info =    { 'fg', 'PreProc' },
  border =  { 'fg', 'Ignore' },
  prompt =  { 'fg', 'Conditional' },
  pointer = { 'fg', 'Exception' },
  marker =  { 'fg', 'Keyword' },
  spinner = { 'fg', 'Label' },
  header =  { 'fg', 'Comment' }
}

vim.api.nvim_exec(
[[
let $fzf_default_command = 'fd --type f'
let $fzf_default_opts .= '--layout=reverse --inline-info'
autocmd filetype fzf tmap <buffer> <c-j> <down>
autocmd filetype fzf tmap <buffer> <c-k> <up>

nmap <silent> <leader>f :Files<cr>
nmap <silent> <leader>b :Buffers<cr>
nmap <silent> <leader>gb :Gbranches<cr>
nmap <silent> <leader>ht :Helptags<cr>
" list all yadm tracked files
nmap <silent> <leader>ed :call fzf#run(fzf#wrap({'source': 'yadm list -a', 'dir': '~' }))<cr>
" rails
" find models
nmap <silent> <leader>em :call fzf#run(fzf#wrap({'source': 'git ls-files', 'dir': 'app/models' }))<cr>
nmap <silent> <leader>ec :call fzf#run(fzf#wrap({'source': 'git ls-files', 'dir': 'app/controllers' }))<cr>
nmap <silent> <leader>ev :call fzf#run(fzf#wrap({'source': 'git ls-files', 'dir': 'app/views' }))<cr>
]]
, true)

local map = require('utils').map

vim.cmd [[let $FZF_DEFAULT_COMMAND = 'fd --type f']]
vim.cmd [[let $FZF_DEFAULT_OPTS .= '--layout=reverse --inline-info']]

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

local opts = { silent = true }

-- FZF Buffer Delete
-- vim.cmd [[
-- function! s:list_buffers()
--   redir => list
--   silent ls
--   redir END
--   return split(list, "\n")
-- endfunction

-- function! s:delete_buffers(lines)
--   execute 'bwipeout' join(map(a:lines, {_, line -> split(line)[0]}))
-- endfunction

-- command! BD call fzf#run(fzf#wrap({
--   \ 'source': s:list_buffers(),
--   \ 'sink*': { lines -> s:delete_buffers(lines) },
--   \ 'options': '--multi --reverse --bind ctrl-a:select-all+accept'
-- \ }))
-- ]]

map('n', '<leader>f', ':Files <cr>', opts)
map('n', '<leader>b', ':Buffers <cr>', opts)
-- map('n', '<leader>b', ':BD <cr>', opts)
map('n', '<leader>gb', ':Gbranches <cr>', opts)
map('n', '<leader>ht', ':Helptags <cr>', opts)
-- list all yadm tracked files
map('n', '<leader>ed', ":call fzf#run(fzf#wrap({'source': 'yadm list -a', 'dir': '~' }))<cr>", opts)
-- Rails
map('n', '<leader>em', ":call fzf#run(fzf#wrap({'source': 'git ls-files', 'dir': 'app/models' }))<cr>", opts)
map('n', '<leader>em', ":call fzf#run(fzf#wrap({'source': 'git ls-files', 'dir': 'app/controllers' }))<cr>", opts)
map('n', '<leader>ev', ":call fzf#run(fzf#wrap({'source': 'git ls-files', 'dir': 'app/views' }))<cr>", opts)
-- up/down using c-j and c-k"
vim.cmd [[autocmd FileType fzf tmap <buffer> <C-k> <Up>]]
vim.cmd [[autocmd FileType fzf tmap <buffer> <C-j> <Down>]]

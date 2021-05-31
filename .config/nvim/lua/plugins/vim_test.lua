local map = require('utils').map

vim.g['test#strategy'] = 'vimux'
-- vim.g['test#ruby#use_binstubs'] = 0

map('n', '<leader>T', ':TestFile<cr>')
map('n', '<leader>t', ':TestNearest<cr>')
map('n', '<leader>l', ':TestLast<cr>')

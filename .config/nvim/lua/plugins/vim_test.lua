local map = require('utils').map

vim.cmd [[let test#strategy = "vimux"]]
vim.cmd [[let test#ruby#use_binstubs = 0]]

map('n', '<leader>T', ':TestFile<cr>', {})
map('n', '<leader>t', ':TestNearest<cr>', {})
map('n', '<leader>l', ':TestLast<cr>', {})

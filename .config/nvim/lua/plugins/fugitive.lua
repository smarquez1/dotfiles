local map = require('utils').map

vim.g.fugitive_git_executable = 'LANG=en_US git'

local options = { noremap = true }

map('n', '<leader>gd', '<cmd>Gvdiff<CR>', options)
map('n', '<leader>gs', '<cmd>Gstatus<CR>', options)
map('n', '<leader>gb', '<cmd>Gremove<CR>', options)
map('v', '<leader>gb', '<cmd>GBrowse<CR>', options)

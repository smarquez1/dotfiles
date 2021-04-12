local map = require('utils').map

vim.g.fugitive_git_executable = 'LANG=en_US git'

local options = { noremap = true }

map('n', '<leader>gd', ':Gvdiff<CR>', options)
map('n', '<leader>gs', ':Gstatus<CR>', options)
map('v', '<leader>gB', ':GBrowse<CR>', options)
map('v', '<leader>gB', ":'<,'>GBrowse<CR>", options)

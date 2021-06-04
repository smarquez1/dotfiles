local map = require('utils').map
local options = { noremap = true }

map('n', '<leader>gd', ':Gvdiff<CR>', options)
-- map('n', '<leader>gs', ':Git<CR>', options)
map('v', '<leader>gB', ':GBrowse<CR>', options)
map('v', '<leader>gB', ":'<,'>GBrowse<CR>", options)

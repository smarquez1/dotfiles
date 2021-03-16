local map = require('utils').map

vim.g.fugitive_git_executable = 'LANG=en_US git'

local options = { noremap = true }
vim.api.nvim_set_keymap('n', '<leader>gd', '<cmd>Gvdiff<CR>', options)
-- vim.api.nvim_set_keymap('n', '<leader>gd', '<cmd>Gdiff<CR>', options)
vim.api.nvim_set_keymap('n', '<leader>gb', '<cmd>Gremove<CR>', options)
vim.api.nvim_set_keymap('v', '<leader>gb', '<cmd>GBrowse<CR>', options)

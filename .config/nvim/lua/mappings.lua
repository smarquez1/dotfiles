local map = require('utils').map

vim.g.mapleader = " " -- map leader to space

map('n', '<leader>w', ':w<cr>') -- Save file
-- Quicker window movement
map('n', '<c-j>', '<c-w>j')
map('n', '<c-k>', '<c-w>k')
map('n', '<c-l>', '<c-w>l')
map('n', '<c-h>', '<c-w>h')
-- Terminal navigation
map('t', '<c-h>', '<c-\\><c-n><c-w>h')
map('t', '<c-j>', '<c-\\><c-n><c-w>j')
map('t', '<c-k>', '<c-\\><c-n><c-w>k')
map('t', '<c-l>', '<c-\\><c-n><c-w>l')
-- moving up and down when lines wrap, one line at the time
map('n', 'j', 'gj', { noremap = true, silent = true })
map('n', 'k', 'gk', { noremap = true, silent = true })
-- Easy splitting
map('n', '<leader>s', ':split<cr>')
map('n', '<leader>v', ':vsplit<cr>')
-- Cancel a search with Escape:
map('n', '<silent><Esc>', ':nohlsearch<Bar>:echo<CR>')
map('v', '.', ':norm.<cr>') -- map . in visual mode
map('n', 'Q', '<Nop>', { noremap = true, silent = true }) -- disable Ex mode
-- Replace hashrockets with 1.9 hash style syntax
map('n', '<leader>:', ':%s/:\\(\\w\\+\\)\\s*=>\\s*/\\1: /g<cr>')

-- better indenting
vim.api.nvim_set_keymap('v', '<', '<gv', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '>', '>gv', { noremap = true, silent = true })

-- escape alternatives
vim.api.nvim_set_keymap('i', 'jk', '<ESC>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', 'kj', '<ESC>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('i', 'jj', '<ESC>', { noremap = true, silent = true })

vim.api.nvim_exec(
[[
  " diff
  if &diff
    map '<C-J>' ']c'
    map '<C-K>' '[c'
  endif
]],
true)

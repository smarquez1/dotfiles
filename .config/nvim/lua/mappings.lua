local map = require('utils').map

vim.g.mapleader = " " -- map leader to space

map('n', ';', ':') -- Semicolon is colon
map('n', '<leader>w', ':w<cr>') -- Save file
-- Quicker window movement
map('n', '<c-j>', '<c-w>j')
map('n', '<c-k>', '<c-w>k')
map('n', '<c-l>', '<c-w>l')
map('n', '<c-h>', '<c-w>h')
-- Make navigation into and out of Neovim terminal splits nicer.
map('t', '<c-h>', '<c-\\><c-n><c-w>h')
map('t', '<c-j>', '<c-\\><c-n><c-w>j')
map('t', '<c-k>', '<c-\\><c-n><c-w>k')
map('t', '<c-l>', '<c-\\><c-n><c-w>l')
-- Easy splitting
map('n', '<leader>s', ':split<cr>')
map('n', '<leader>v', ':vsplit<cr>')
-- Cancel a search with Escape:
map('n', '<silent><Esc>', ':nohlsearch<Bar>:echo<CR>')
map('v', '.', ':norm.<cr>') -- map . in visual mode
-- unmap ex mode: 'Type visual to go into Normal mode.'
map('n', 'Q', '<nop>')
-- Replace hashrockets with 1.9 hash style syntax
-- map('n', '<leader>:', ':%s/:\(\w\+\)\s*=>\s*/\1: /g<cr>')
map('n', '<leader>:', ':%s/:\\(\\w\\+\\)\\s*=>\\s*/\\1: /g<cr>')

vim.api.nvim_exec(
[[
  " diff
  if &diff
    map '<C-J>' ']c'
    map '<C-K>' '[c'
  endif
]],
true)

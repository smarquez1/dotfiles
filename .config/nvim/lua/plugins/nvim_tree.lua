local tree_cb = require('nvim-tree.config').nvim_tree_callback
local map = require('utils').map

vim.g.nvim_tree_width_allow_resize = 1
vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_auto_close = 1
vim.g.nvim_tree_follow = 1
vim.g.nvim_tree_hide_dotfiles = 1
vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_disable_netrw = 0 -- So Fugitive's :GBrowse works
vim.g.nvim_tree_lsp_diagnostics = 1

vim.g.nvim_tree_bindings = {
  { key = "l", cb = tree_cb("edit") },
  { key = "h", cb = tree_cb("close_node") },
}

map('n', '<leader>d', ':NvimTreeToggle<cr>')

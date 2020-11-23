-- https://github.com/nvim-telescope/telescope.nvim/issues/185
local sorters = require('telescope.sorters')
local actions = require('telescope.actions')
local U = require "utils"

local opts = {}

require('telescope').setup{
  defaults = {
    shorten_path = true,
    -- generic_sorter = sorters.get_fzy_sorter,
    -- file_sorter = sorters.get_fzy_sorter,
    mappings = {
      i = {
        ["<esc>"] = actions.close
      },
    },
  }
}
require('telescope').load_extension('fzy_native')

-- U.map('n', "<leader>f", "<CMD> lua require('telescope.builtin').fd()<CR>", opts)
U.map('n', "<leader>f", "<CMD> lua require('telescope.builtin').find_files()<CR>", opts)
U.map('n', "<leader>b", ":lua require('telescope.builtin').buffers()<CR>", opts)
U.map('n', "<leader>gb", ":lua require('telescope.builtin').git_branches()<CR>", opts)
U.map('n', "<leader>ed", ":lua require('telescope.builtin').find_files({ cwd = '~/.config/nvim/'})<CR>", opts)

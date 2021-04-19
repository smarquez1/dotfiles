local telescope = require('telescope')
local actions = require('telescope.actions')
local builtin = require('telescope.builtin')
local previewers = require('telescope.previewers')

local map = require('utils').map

telescope.setup {
  defaults = {
    prompt_position = "top",
    sorting_strategy = "ascending",
    mappings = {
      -- i = { ["<esc>"] = actions.close },
      n = { ["<esc>"] = actions.close },
    },
    -- file_previewer = previewers.vim_buffer_cat.new, -- Crashes neovim when loading huge files
    file_previewer = previewers.cat.new,
    -- file_sorter =  require'telescope.sorters'.get_fuzzy_file,
    file_sorter =  require'telescope.sorters'.get_fzy_sorter,
  }
}

-- Custom functions
local M = {}

function M.find_dotfiles()
  builtin.find_files {
    cwd = "~",
    find_command = { 'yadm', 'list', '-a' },
    prompt_title = "Find Dotfiles",
  }
end

-- Mappings
local opts = { noremap = true, silent = true }

map('n', '<leader>f' , ':Telescope find_files<CR>', opts)
map('n', '<leader>bl' , ':Telescope buffers<CR>', opts)
map('n', '<leader>gb', ':Telescope git_branches<CR>', opts)
map('n', '<leader>ht', ':Telescope help_tags<CR>', opts)
map('n', '<leader>S' , ':Telescope lsp_workspace_symbols<CR>', opts)
-- List all YADM tracked files
map('n', "<leader>ed", ":lua require('plugins.telescope').find_dotfiles()<CR>", opts)

return M

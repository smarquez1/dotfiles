local telescope = require('telescope')
local actions = require('telescope.actions')
local builtin = require('telescope.builtin')
local previewers = require('telescope.previewers')

telescope.setup {
  defaults = {
    prompt_position = "top",
    sorting_strategy = "ascending",
    file_previewer = previewers.cat.new -- Default TS previewer crashes neovim when loading huge files
  },
  pickers = {
    buffers = {
      show_all_buffers = true,
      sort_lastused = true,
      theme = "dropdown",
      previewer = false,
      mappings = {
        i = {
          -- ["<c-d>"] = actions.delete_buffer,
          ["<c-d>"] = "delete_buffer",
        },
        n = {
          -- ["<c-d>"] = actions.delete_buffer,
          ["<c-d>"] = "delete_buffer",
        }
      }
    }
  },
  find_files = {
    theme = "dropdown"
  }
}

-- telescope.load_extension('fzy_native')
telescope.load_extension('gh')
require('telescope').load_extension('fzf')

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
local map = require('utils').map
local opts = { noremap = true, silent = true }

map('n', '<leader>f' , ':Telescope find_files<CR>', opts)
map('n', '<leader>bl' , ':Telescope buffers<CR>', opts)
map('n', '<leader>gb', ':Telescope git_branches<CR>', opts)
map('n', '<leader>ht', ':Telescope help_tags<CR>', opts)
map('n', '<leader>S' , ':Telescope lsp_workspace_symbols<CR>', opts)
map('n', '<leader>gs', ':Telescope git_status<CR>', opts)
-- List all YADM tracked files
map('n', "<leader>ed", ":lua require('plugins.telescope').find_dotfiles()<CR>", opts)

return M

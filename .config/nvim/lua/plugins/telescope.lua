local actions = require('telescope.actions')
local builtin = require('telescope.builtin')
local previewers = require('telescope.previewers')

require('telescope').setup {
  defaults = {
    file_previewer = previewers.cat.new, -- Default TS previewer crashes neovim when loading huge files
    mappings = {
      i = { ["<esc>"] = "close" }
    }
  },
  pickers = {
    buffers = {
      sort_lastused = true,
      theme = "dropdown",
      previewer = false,
      mappings = {
        i = {
          ["<c-d>"] = "delete_buffer",
        },
        n = {
          ["<c-d>"] = "delete_buffer",
        }
      }
    }
  },
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      -- override_generic_sorter = false, -- override the generic sorter
      override_file_sorter = false,     -- override the file sorter
      -- case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
      -- the default case_mode is "smart_case"
    }
  }
}

require('telescope').load_extension('gh')
require('telescope').load_extension('fzf')

-- Custom functions
local M = {}

function M.find_dotfiles()
  builtin.find_files {
    cwd = '~',
    find_command = { 'yadm', 'list', '-a' },
    prompt_title = 'Find Dotfiles',
  }
end

-- Mappings
local map = require('utils').map
local opts = { noremap = true, silent = true }

map('n', '<leader>f' , ':Telescope find_files<CR>', opts)
-- map('n', '<leader>/' , ':Telescope live_grep<CR>', opts)
map('n', '<leader>bl', ':Telescope buffers<CR>', opts)
map('n', '<leader>gb', ':Telescope git_branches<CR>', opts)
map('n', '<leader>ht', ':Telescope help_tags<CR>', opts)
map('n', '<leader>S' , ':Telescope lsp_workspace_symbols<CR>', opts)
-- map('n', '<leader>gs', ':Telescope git_status<CR>', opts)
-- List all YADM tracked files
map('n', '<leader>ed', ":lua require('plugins.telescope').find_dotfiles()<CR>", opts)

return M

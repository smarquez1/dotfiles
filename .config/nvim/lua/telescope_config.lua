-- Setup
local telescope = require('telescope')
local actions = require('telescope.actions')
local previewers = require('telescope.previewers')

telescope.setup {
  defaults = {
    mappings = {
      i = { ["<esc>"] = actions.close }
    },
    file_previewer = previewers.cat.new,
  }
}

telescope.load_extension 'fzy_native'

-- Mappings
local map = require('utils').map
local opts = { noremap = true, silent = true }

map('n', '<leader>f' , ':Telescope find_files<CR>' , opts)
map('n', '<leader>B' , ':Telescope buffers<CR>' , opts)
map('n', '<leader>gb', ':Telescope git_branches<CR>' , opts)
map('n', '<leader>ht', ':Telescope help_tags<CR>' , opts)
map('n', '<leader>S' , ':Telescope lsp_workspace_symbols<CR>', opts)
  -- List all YADM tracked files
map('n', "<leader>ed", ":lua require('telescope_config').find_dotfiles()<CR>", opts)

-- Custom functions
local M = {}

function M.find_dotfiles()
;qa
  require('telescope.builtin').find_files {
    prompt_title = "Find Dotfiles",
    shorten_path = false,
    cwd = "~",
    find_command = { 'yadm', 'list', '-a' },
  }
end

return M

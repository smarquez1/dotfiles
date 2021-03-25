local telescope = require('telescope')
local actions = require('telescope.actions')
local previewers = require('telescope.previewers')
local map_lua = require('utils').map_lua
local map = require('utils').map
telescope.load_extension 'fzy_native'
telescope.load_extension('media_files')

telescope.setup {
  defaults = {
    mappings = {
      i = { ["<esc>"] = actions.close }
    },
    file_previewer = previewers.vim_buffer_cat.new,
  }
}

-- Mappings
local opts = { noremap = true, silent = true }

map('n', '<leader>f' , ':Telescope find_files<CR>' , opts)
map('n', '<leader>B' , ':Telescope buffers<CR>' , opts)
map('n', '<leader>gb', ':Telescope git_branches<CR>' , opts)
map('n', '<leader>ht', ':Telescope help_tags<CR>' , opts)
map('n', '<leader>S' , ':Telescope lsp_workspace_symbols<CR>', opts)
  -- List all YADM tracked files
map_lua('n', "<leader>ed", "require('plugins.telescope').find_dotfiles()<CR>", opts)

-- Custom functions
local M = {}

function M.find_dotfiles()
  require('telescope.builtin').find_files {
    prompt_title = "Find Dotfiles",
    shorten_path = false,
    cwd = "~",
    find_command = { 'yadm', 'list', '-a' },
  }
end

return M

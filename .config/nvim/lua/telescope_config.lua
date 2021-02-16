-- Setup
local actions = require('telescope.actions')
local previewers = require('telescope.previewers')

require('telescope').setup {
  defaults = {
    mappings = {
      i = { ["<esc>"] = actions.close }
    },
  }
}

require('telescope').load_extension 'fzy_native'

-- Mappings
local opts = { noremap = true, silent = true }
local map = vim.api.nvim_set_keymap

map('n', '<leader>f' , ':Telescope find_files<CR>'           , opts)
map('n', '<leader>B' , ':Telescope buffers<CR>'              , opts)
map('n', '<leader>gb', ':Telescope git_branches<CR>'         , opts)
map('n', '<leader>ht', ':Telescope help_tags<CR>'            , opts)
  -- List all YADM tracked files
map('n', "<leader>ed", ":lua require('telescope_config').find_dotfiles()<CR>", opts)
-- nmap <silent> <leader>S :CocList symbols<CR>
-- map('n', "<leader>fg", ":Telescope.live_grep prompt_prefix=🔍<CR>", opts)
map('n', '<leader>S' , ':Telescope lsp_workspace_symbols<CR>', opts)

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

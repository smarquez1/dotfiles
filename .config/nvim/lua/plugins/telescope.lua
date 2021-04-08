local telescope = require('telescope')
local actions = require('telescope.actions')
local action_state = require('telescope.actions.state')
local builtin = require('telescope.builtin')
local previewers = require('telescope.previewers')

local map = require('utils').map

telescope.setup {
  defaults = {
    prompt_position = "top",
    sorting_strategy = "ascending",
    mappings = {
      i = { ["<esc>"] = actions.close },
      n = { ["<esc>"] = actions.close },
    },
    -- file_previewer = previewers.vim_buffer_cat.new,
    file_previewer = previewers.cat.new,
    color_devicons = true,
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

function M.custom_buffers()
  builtin.buffers {
    attach_mappings = function(prompt_bufnr, map)
      local delete_buf = function()
        local selection = action_state.get_current_selection()
        -- depending if you want to close or not, include this or not
        actions.close(prompt_bufnr)
        -- print(vim.inspect(selection))
        -- better print selection before first running this. I am not sure if it have a bufnr or if this field is named differently
        vim.api.nvim_buf_delete(selection.bufnr, { force = true })
      end

      -- mode, key, func
      -- this is just an example
      map('n', 'd', delete_buf)
    end
  }
end

-- Mappings
local opts = { noremap = true, silent = true }

map('n', '<leader>f' , ':Telescope find_files<CR>' , opts)
map('n', '<leader>b' , ':Telescope buffers<CR>' , opts)
map('n', '<leader>gb', ':Telescope git_branches<CR>' , opts)
map('n', '<leader>ht', ':Telescope help_tags<CR>' , opts)
map('n', '<leader>S' , ':Telescope lsp_workspace_symbols<CR>', opts)
-- List all YADM tracked files
-- map('n', "<leader>b", ":lua require('plugins.telescope').custom_buffers()<CR>", opts)
map('n', "<leader>ed", ":lua require('plugins.telescope').find_dotfiles()<CR>", opts)

return M

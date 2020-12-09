require('telescope').load_extension('fzy_native')

local opts = {}

vim.api.nvim_set_keymap('n', "<leader>f", "<CMD> lua require('telescope.builtin').find_files()<CR>", opts)
vim.api.nvim_set_keymap('n', "<leader>B", ":lua require('telescope.builtin').buffers()<CR>", opts)
vim.api.nvim_set_keymap('n', "<leader>gb", ":lua require('telescope.builtin').git_branches()<CR>", opts)
vim.api.nvim_set_keymap('n', "<leader>ht", ":lua require('telescope.builtin').help_tags()<CR>", opts)
-- List all YADM tracked files
vim.api.nvim_set_keymap('n', "<leader>ed", ":lua require('telescope.builtin').find_files({ find_command = { 'yadm', 'list', '-a' }, cwd = '~'})<CR>", opts)

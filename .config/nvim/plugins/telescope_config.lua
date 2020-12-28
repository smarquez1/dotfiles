require('telescope').load_extension('fzy_native')
require '../utils'

local opts = {}

U.map('n', "<leader>f", "<CMD> lua require('telescope.builtin').find_files()<CR>", opts)
U.map('n', "<leader>B", ":lua require('telescope.builtin').buffers()<CR>", opts)
U.map('n', "<leader>gb", ":lua require('telescope.builtin').git_branches()<CR>", opts)
U.map('n', "<leader>ht", ":lua require('telescope.builtin').help_tags()<CR>", opts)
-- List all YADM tracked files
U.map('n', "<leader>ed", ":lua require('telescope.builtin').find_files({ find_command = { 'yadm', 'list', '-a' }, cwd = '~'})<CR>", opts)

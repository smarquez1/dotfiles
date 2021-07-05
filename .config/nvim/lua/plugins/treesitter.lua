require('nvim-autopairs').setup()

require("nvim-treesitter.configs").setup {
  ensure_installed = "maintained",
  highlight = { enable = true, use_languagetree = true },
  indent = { enable = true },
  autotag = { enable = true },
  context_commentstring = { enable = true },
  matchup = { enable = true },
  autopairs = {enable = true},
  -- incremental_selection = { enable = false },
  -- textsubjects = {enable = true, keymaps = {['.'] = 'textsubjects-smart'}},
  -- textobjects = {
  --   select = {
  --     enable = true,
  --     keymaps = {
	-- ['aa'] = '@parameter.outer',
	-- ['ia'] = '@parameter.inner',
	-- ['af'] = '@function.outer',
	-- ['if'] = '@function.inner',
	-- ['ac'] = '@class.outer',
	-- ['ic'] = '@class.inner'
  --     }
  --   },
  --   swap = {
  --     enable = true,
  --     swap_next = {['<leader>a'] = '@parameter.inner'},
  --     swap_previous = {['<leader>A'] = '@parameter.inner'}
  --   }
  -- },
}

-- Treesitter based folding
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldmethod = "expr"
vim.wo.foldlevel = 99
-- vim.cmd[[ autocmd FileType vim,yaml,ruby setlocal foldmethod=indent ]]

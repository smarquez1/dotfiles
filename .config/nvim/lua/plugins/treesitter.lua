require("nvim-treesitter.configs").setup {
  -- ensure_installed = "all", -- "all", "maintained"
  ensure_installed = "", -- "all", "maintained"
  highlight = { enable = true, },
  -- indent = { enable = true },
  -- incremental_selection = { enable = false },
}

-- Enable folding by default
-- vim.o.foldmethod = 'indent'
-- vim.o.foldlevel = 99
-- Treesitter based folding
-- vim.api.nvim_set_option('foldmethod', 'expr')
-- vim.api.nvim_set_option('foldexpr', 'nvim_treesitter#foldexpr()')

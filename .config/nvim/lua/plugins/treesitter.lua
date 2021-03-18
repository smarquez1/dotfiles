require("nvim-treesitter.configs").setup {
  -- ensure_installed = "all", -- "all", "maintained"
  ensure_installed = "", -- :TSInstallFromGrammar javascrypt ruby json typescript bash lua css yaml
  highlight = { enable = true, },
  indent = { enable = true },
  incremental_selection = { enable = false },
}

-- Treesitter based folding
-- vim.api.nvim_set_option('foldmethod', 'expr')
-- vim.api.nvim_set_option('foldexpr', 'nvim_treesitter#foldexpr()')

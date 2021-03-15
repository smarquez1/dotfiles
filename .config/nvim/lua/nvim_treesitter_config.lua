require("nvim-treesitter.configs").setup {
  ensure_installed = "all", -- "all", "maintained"
  highlight = { enable = true, },
  -- indent = { enable = true },
  -- incremental_selection = { enable = false },
}

-- folding (TODO: translate to lua)
-- set foldmethod=expr
-- set foldexpr=nvim_treesitter#foldexpr()

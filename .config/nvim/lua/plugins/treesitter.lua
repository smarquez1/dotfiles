require("nvim-treesitter.configs").setup {
  -- ensure_installed = "all", -- "all", "maintained"
	-- :TSUninstall all
	-- :TSInstallFromGrammar javascript ruby json typescript bash lua css yaml
	--:TSInstallFromGrammar maintained
  ensure_installed = "",
  highlight = {
		enable = true,
		disable = { "javascript" },  -- list of language that will be disabled
	},
  indent = { enable = false },
  incremental_selection = { enable = false },
  autotag = {
    enable = true,
    filetypes = {
      'html', 'javascript', 'javascriptreact', 'typescriptreact', 'eruby'
    }
  },
}

-- Treesitter based folding
-- vim.api.nvim_set_option('foldmethod', 'expr')
-- vim.api.nvim_set_option('foldexpr', 'nvim_treesitter#foldexpr()')

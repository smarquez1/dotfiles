require("nvim-treesitter.configs").setup {
  ensure_installed = "all",
  ignore_install = { "haskell" }, -- Seems to be broken
  highlight = { enable = true, },
  indent = { enable = true, disable = {"python"} },
  incremental_selection = { enable = false },
  autotag = {
    enable = true,
    filetypes = {
      'html', 'javascript', 'javascriptreact', 'typescriptreact', 'eruby'
    }
  },
  context_commentstring = { enable = true }
}

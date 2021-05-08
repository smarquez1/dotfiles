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

-- Treesitter based folding, can cause slowdowns
-- https://github.com/nvim-treesitter/nvim-treesitter/issues/1100#issuecomment-828138292
vim.cmd[[ set foldexpr=nvim_treesitter#foldexpr() ]]
vim.cmd[[ set foldmethod=expr ]]
vim.cmd[[ autocmd FileType vim,yaml setlocal foldmethod=indent ]]
vim.wo.foldlevel = 99

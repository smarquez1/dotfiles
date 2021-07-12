require('nvim-autopairs').setup()

require("nvim-treesitter.configs").setup {
  ensure_installed = "maintained",
  indent = { enable = true },
  autotag = { enable = true },
  context_commentstring = { enable = true },
  matchup = { enable = true },
  autopairs = {enable = true},
  highlight = { enable = true },-- syntax highlighting
  --[[ textobjects = {
    select = { enable = true, },
    swap = { enable = true, }
  }, ]]
  -- textsubjects = { enable = true },
}

-- Treesitter based folding
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldmethod = "expr"
vim.wo.foldlevel = 99
-- vim.cmd[[ autocmd FileType vim,yaml,ruby setlocal foldmethod=indent ]]

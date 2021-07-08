require('nvim-autopairs').setup()

require("nvim-treesitter.configs").setup {
  ensure_installed = "maintained",
  indent = { enable = true },
  autotag = { enable = true },
  context_commentstring = { enable = true },
  matchup = { enable = true },
  autopairs = {enable = true},
  --[[ textobjects = {
    select = { enable = true, },
    swap = { enable = true, }
  }, ]]
  -- textsubjects = { enable = true },
  -- highlight = { enable = true, use_languagetree = true },
  -- rainbow = {
  --   enable = true,
  --   extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
  --   max_file_lines = 1000, -- Do not enable for files with more than 1000 lines, int
  -- },
}

-- Treesitter based folding
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldmethod = "expr"
vim.wo.foldlevel = 99
-- vim.cmd[[ autocmd FileType vim,yaml,ruby setlocal foldmethod=indent ]]

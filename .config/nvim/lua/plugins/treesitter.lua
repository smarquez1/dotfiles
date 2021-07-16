-- local autopairs = require("nvim-autopairs")

--[[ autopairs.setup()
require("nvim-autopairs.completion.compe").setup({
  map_cr = true, --  map <CR> on insert mode
  map_complete = true -- it will auto insert `(` after select function or method item
})

local endwise = require("nvim-autopairs.ts-rule").endwise
autopairs.add_rules(require("nvim-autopairs.rules.endwise-lua"))

autopairs.add_rules({
  endwise(" do$", "end", "ruby", nil),
  endwise(" do$", "end", "elixir", nil)
}) ]]

require("nvim-treesitter.configs").setup {
  ensure_installed = "maintained",
  indent = { enable = false }, --
  autotag = { enable = false }, --
  context_commentstring = { enable = false }, --
  matchup = { enable = false }, --
  autopairs = { enable = false }, --
  highlight = { enable = true },-- syntax highlighting
  textobjects = {
    select = { enable = false, },
    swap = { enable = false }
  }, --
  textsubjects = { enable = false }, --
}

-- Treesitter based folding
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldmethod = "expr"
vim.wo.foldlevel = 99
-- vim.cmd[[ autocmd FileType vim,yaml,ruby setlocal foldmethod=indent

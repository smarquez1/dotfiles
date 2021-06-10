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

require "nvim-treesitter.configs".setup {
  playground = {
    enable = true,
    disable = {},
    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false, -- Whether the query persists across vim sessions
  }
}

require "nvim-treesitter.parsers".get_parser_configs().Solidity = {
  install_info = {
    url = "https://github.com/JoranHonig/tree-sitter-solidity",
    files = {"src/parser.c"},
    requires_generate_from_grammar = true,
  },
  filetype = 'solidity'
}

-- Treesitter based folding, can cause slowdowns
-- https://github.com/nvim-treesitter/nvim-treesitter/issues/1100#issuecomment-828138292
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldmethod = "expr"
vim.wo.foldlevel = 99
vim.cmd[[ autocmd FileType vim,yaml,ruby setlocal foldmethod=indent ]]

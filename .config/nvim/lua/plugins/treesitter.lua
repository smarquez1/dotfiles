require('nvim-autopairs').setup()

require("nvim-treesitter.configs").setup {
  ensure_installed = "maintained",
  highlight = { enable = true, },
  indent = { enable = true },
  autotag = { enable = true },
  context_commentstring = { enable = true },
  matchup = { enable = true },
  autopairs = {enable = true},
  -- incremental_selection = { enable = false },
  -- textsubjects = {enable = true, keymaps = {['.'] = 'textsubjects-smart'}},
  -- textobjects = {
  --   select = {
  --     enable = true,
  --     keymaps = {
	-- ['aa'] = '@parameter.outer',
	-- ['ia'] = '@parameter.inner',
	-- ['af'] = '@function.outer',
	-- ['if'] = '@function.inner',
	-- ['ac'] = '@class.outer',
	-- ['ic'] = '@class.inner'
  --     }
  --   },
  --   swap = {
  --     enable = true,
  --     swap_next = {['<leader>a'] = '@parameter.inner'},
  --     swap_previous = {['<leader>A'] = '@parameter.inner'}
  --   }
  -- },
}

-- Treesitter based folding
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldmethod = "expr"
vim.wo.foldlevel = 99
-- vim.cmd[[ autocmd FileType vim,yaml,ruby setlocal foldmethod=indent ]]

-- Treesitter playground config
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

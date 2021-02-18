require "nvim-treesitter.configs".setup {
    ensure_installed = "maintained", -- "all", "maintained"
    highlight = { enable = true },
    indent = { enable = false },
    rainbow = { enable = false },
    incremental_selection = { enable = false },
}

-- Treesitter based folding
-- vim.api.nvim_set_option('foldmethod', 'expr')
-- vim.api.nvim_set_option('foldexpr', 'nvim_treesitter#foldexpr()')

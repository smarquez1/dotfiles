require "nvim-treesitter.configs".setup {
    ensure_installed = "maintained", -- "all", "maintained"
    highlight = { enable = true },
    indent = { enable = true },
    rainbow = { enable = true },
    incremental_selection = { enable = true },
}

-- Treesitter based folding
vim.api.nvim_set_option('foldmethod', 'expr')
vim.api.nvim_set_option('foldexpr', 'nvim_treesitter#foldexpr()')

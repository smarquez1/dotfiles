require "nvim-treesitter.configs".setup {
    ensure_installed = "all", -- "all", "maintained"
    highlight = { enable = true },
    indent = { enable = false },
    rainbow = { enable = false },
    incremental_selection = { enable = false },
    textobjects = { enable = true },
    refactor = {
        highlight_definitions = {
            enable = true
        },
        smart_rename = {
            enable = true,
            keymaps = {
                smart_rename = "grr"
            }
        }
    }
}

-- Treesitter based folding
-- vim.api.nvim_set_option('foldmethod', 'expr')
-- vim.api.nvim_set_option('foldexpr', 'nvim_treesitter#foldexpr()')

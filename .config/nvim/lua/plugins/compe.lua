-- local map = require('utils').map

-- Completion does not select anything automatically
vim.o.completeopt = 'menuone,noselect'
-- Do not display "Pattern not found" messages during completion.
vim.opt.shortmess = vim.opt.shortmess + 'c'

require('compe').setup {
  source = {
    path = { kind = "  " },
    buffer = { kind = "  " },
    calc = { kind = "  " },
    vsnip = { kind = "  " },
    nvim_lsp = { kind = "  " },
    nvim_lua = { kind = "  " },
    spell = { kind = "  " },
    tags = false,
    -- treesitter = {kind = "  "},
    emoji = { kind = " ﲃ " } -- for emoji press :
  }
}

-- Better nav for popup menues
vim.cmd('inoremap <expr> <c-j> pumvisible() ? "<c-n>" : "<c-j>"')
vim.cmd('inoremap <expr> <c-k> pumvisible() ? "<c-p>" : "<c-k>"')

vim.cmd("imap <expr> <Tab> vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : '<Tab>'")
vim.cmd("smap <expr> <Tab> vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : '<Tab>'")

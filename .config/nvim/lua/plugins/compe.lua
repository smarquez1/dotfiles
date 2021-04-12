local map = require('utils').map

-- Completion does not select anything automatically
vim.o.completeopt = 'menuone,noselect'
-- Do not display "Pattern not found" messages during completion.
vim.cmd [[set shortmess+=c]]

require('compe').setup {
  enabled = true;
  autocomplete = true;
  minlength = 1;
  documentation = true;
  preselect = 'enable';

  source = {
    path = true,
    buffer = true,
    calc = true,
    nvim_lsp = true,
    nvim_lua = true,
    spell = true,
    ultisnips = true,
    treesitter = false,
    emoji = true, -- type :
    vsnip = false,
  }
}

-- Better nav for popup menues
vim.cmd('inoremap <expr> <c-j> pumvisible() ? "<c-n>" : "<c-j>"')
vim.cmd('inoremap <expr> <c-k> pumvisible() ? "<c-p>" : "<c-k>"')

-- Ultisnips config
vim.g.UltiSnipsExpandTrigger="<tab>"
vim.g.UltiSnipsJumpForwardTrigger="<tab>"
vim.g.UltiSnipsJumpBackwardTrigger="<s-tab>"

-- vim.cmd [[autocmd FileType javascript,javascriptreact,typescript,typescriptreact UltiSnipsAddFiletypes javascript.javascriptreact.typescript.typescriptreact]]

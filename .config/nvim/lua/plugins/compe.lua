local map = require('utils').map

-- Completion does not select anything automatically
vim.o.completeopt = 'menuone,noselect'
-- Do not display "Pattern not found" messages during completion.
vim.cmd [[set shortmess+=c]]

-- Better nav for popup menues
vim.cmd('inoremap <expr> <c-j> pumvisible() ? "<c-n>" : "<c-j>"')
vim.cmd('inoremap <expr> <c-k> pumvisible() ? "<c-p>" : "<c-k>"')

require('compe').setup {
  enabled = true;
  autocomplete = true;
  minlength = 1;
  documentation = true;
	preselect = 'enable';

  source = {
		path = {kind = "  "},
		buffer = {kind = "  "},
		calc = {kind = "  "},
		nvim_lsp = {kind = "  "},
		nvim_lua = {kind = "  "},
		spell = {kind = "  "},
		tags = false,
		ultisnips = {kind = "  "},
		snippets_nvim = {kind = "  "},
		-- treesitter = {kind = "  "},
		treesitter = false,
		emoji = {kind = " ﲃ "}
		-- for emoji press : (idk if that in compe tho)
	}
}


-- use tab to navigate completion menu?
local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif vim.fn.call("vsnip#available", {1}) == 1 then
    return t "<Plug>(vsnip-expand-or-jump)"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn['compe#complete']()
  end
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  elseif vim.fn.call("vsnip#jumpable", {-1}) == 1 then
    return t "<Plug>(vsnip-jump-prev)"
  else
    return t "<S-Tab>"
  end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})

-- Ultisnips config
vim.g.UltiSnipsExpandTrigger="<c-l>"
vim.g.UltiSnipsJumpForwardTrigger="<tab>"
vim.g.UltiSnipsJumpBackwardTrigger="<s-tab>"

vim.cmd [[
  autocmd FileType javascript, javascriptreact, typescript, typescriptreact UltiSnipsAddFiletypes javascript.javascriptreact.typescript.typescriptreact
]]

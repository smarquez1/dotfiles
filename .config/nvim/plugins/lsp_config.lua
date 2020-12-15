local lsp = require('lspconfig')
local configs = require('lspconfig/configs')
local completion = require('completion')
local lsp_status = require('lsp-status')

lsp.solargraph.setup {
  settings = { solargraph = { diagnostics = true } },
  on_attach = completion.on_attach
}

lsp.tsserver.setup {
  on_attach = completion.on_attach
}

local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then for k, v in pairs(opts) do options[k] = v end end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map('n', '<space>gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
map('n', '<space>af', '<cmd>lua vim.lsp.buf.formatting()<CR>')
map('n', '<space>k', '<cmd>lua vim.lsp.buf.hover()<CR>')
map('n', '<space>gR', '<cmd>lua vim.lsp.buf.rename()<CR>')
map('n', '<space>r', '<cmd>lua vim.lsp.buf.references()<CR>')
map('n', '<space>s', '<cmd>lua vim.lsp.buf.document_symbol()<CR>')

-- let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

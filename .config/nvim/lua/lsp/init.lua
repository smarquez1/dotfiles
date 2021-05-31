local lspconfig = require('lspconfig')
local on_attach = require('lsp.on_attach')
local capabilities = require('lsp.capabilities')

-- handlers
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = false,
    underline = true,
    update_in_insert = true,
    signs = true,
  }
)

local servers = { "cssls", "html", "jsonls", "solargraph" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup { capabilities = capabilities, on_attach = on_attach }
end

require('lsp.efm')
require('lsp.sumneko_lua')
require('lsp.tsserver')

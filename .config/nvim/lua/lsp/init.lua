local lspconfig = require('lspconfig')
local on_attach = require('lsp.on_attach')
local capabilities = require('lsp.capabilities')

require('lsp.handlers').setup()

local servers = { "cssls", "html", "jsonls", "solargraph" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    capabilities = capabilities,
    on_attach = on_attach
  }
end

require('lsp.efm')
require('lsp.emmet_ls')
require('lsp.sumneko_lua')
require('lsp.tsserver')

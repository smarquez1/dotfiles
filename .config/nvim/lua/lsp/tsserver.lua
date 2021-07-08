local lspconfig = require('lspconfig')
local on_attach = require('lsp.on_attach')
local capabilities = require('lsp.capabilities')

lspconfig.tsserver.setup {
  settings = { documentFormatting = false },
  capabilities = capabilities,
  on_attach = function(client)
    client.resolved_capabilities.document_formatting = false,
    on_attach
  end
}


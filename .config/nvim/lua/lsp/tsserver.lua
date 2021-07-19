local lspconfig = require('lspconfig')
local on_attach = require('lsp.on_attach')

local capabilities = vim.lsp.protocol.make_client_capabilities()
local completionItem = capabilities.textDocument.completion.completionItem

completionItem.snippetSupport = true
completionItem.resolveSupport = {
  properties = { 'documentation', 'detail', 'additionalTextEdits', }
}

-- TODO: replace with ts-utils
lspconfig.tsserver.setup {
  init_options = { documentFormatting = false },
  capabilities = capabilities,
  on_attach = on_attach,
  flags = {
    debounce_text_changes = 150,
  }
}

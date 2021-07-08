local capabilities = vim.lsp.protocol.make_client_capabilities()
  local completionItem = capabilities.textDocument.completion.completionItem

completionItem.snippetSupport = true
completionItem.resolveSupport = {
  properties = { 'documentation', 'detail', 'additionalTextEdits', }
}

return capabilities

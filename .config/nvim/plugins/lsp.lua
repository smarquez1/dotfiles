local lspconfig = require'lspconfig'
local configs = require'lspconfig/configs'

lsp.solargraph.setup({
    settings = {
      solargraph = {
        diagnostics = true
      }
    },
    on_attach = on_attach,
    capabilities = lsp_status.capabilities
  })

lsp.tsserver.setup({
    on_attach = on_attach,
    capabilities = lsp_status.capabilities
  })

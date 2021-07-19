local lspconfig = require('lspconfig')
require('lsp.handlers')

-- symbols for autocomplete
vim.lsp.protocol.CompletionItemKind = { '  ', '  ', '  ', '  ', ' ﴲ ', '[]', '  ', ' ﰮ ', '  ', ' 襁', '  ', '  ', ' 練', '  ', '  ', '  ', '  ', '  ', '  ', '  ', ' ﲀ ', ' ﳤ ', '  ', '  ', '  ', }

local function on_attach(client, bufnr)
  client.resolved_capabilities.document_formatting = false,
  require('lsp.on_attach')
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
local completionItem = capabilities.textDocument.completion.completionItem

completionItem.snippetSupport = true
completionItem.resolveSupport = {
  properties = { 'documentation', 'detail', 'additionalTextEdits', }
}

local servers = { "jsonls", "cssls", "stylelint_lsp", "html", "solargraph" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    init_options = { documentFormatting = false },
    on_attach = on_attach,
    capabilities = capabilities,
    flags = {
      debounce_text_changes = 150,
    }
  }
end

-- require('lsp.null-ls')
require('lsp.efm')
require('lsp.emmet_ls')
require('lsp.sumneko_lua')
require('lsp.tsserver')

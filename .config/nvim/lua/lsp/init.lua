local lspconfig = require('lspconfig')
local on_attach = require('lsp.on_attach')
local capabilities = require('lsp.capabilities')

require('lsp.handlers').setup()

-- symbols for autocomplete
vim.lsp.protocol.CompletionItemKind = { '  ', '  ', '  ', '  ', ' ﴲ ', '[]', '  ', ' ﰮ ', '  ', ' 襁', '  ', '  ', ' 練', '  ', '  ', '  ', '  ', '  ', '  ', '  ', ' ﲀ ', ' ﳤ ', '  ', '  ', '  ', }

local servers = { "jsonls", "cssls", "stylelint_lsp", "html", "solargraph" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    capabilities = capabilities,
    on_attach = function(client)
      client.resolved_capabilities.document_formatting = false,
      on_attach
    end,
    settings = { documentFormatting = false },
    flags = {
      debounce_text_changes = 500,
    }
  }
end

require('lsp.efm')
require('lsp.emmet_ls')
require('lsp.sumneko_lua')
require('lsp.tsserver')

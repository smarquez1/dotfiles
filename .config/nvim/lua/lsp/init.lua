local lspconfig = require('lspconfig')
local on_attach = require('lsp.on_attach')
local capabilities = require('lsp.capabilities')

require('lsp.handlers').setup()

-- kind icons
-- symbols for autocomplete
vim.lsp.protocol.CompletionItemKind = {
  '  ',
  '  ',
  '  ',
  '  ',
  ' ﴲ ',
  '[]',
  '  ',
  ' ﰮ ',
  '  ',
  ' 襁',
  '  ',
  '  ',
  ' 練',
  '  ',
  '  ',
  '  ',
  '  ',
  '  ',
  '  ',
  '  ',
  ' ﲀ ',
  ' ﳤ ',
  '  ',
  '  ',
  '  ',
}

local servers = { "cssls", "html", "jsonls", "solargraph" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    capabilities = capabilities,
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 250,
    }
  }
end

require('lsp.efm')
require('lsp.emmet_ls')
require('lsp.sumneko_lua')
require('lsp.tsserver')

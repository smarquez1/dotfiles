-- https://github.com/lucastrvsn/dot/blob/master/.config/nvim/lua/lsp/init.lua
local lspconfig = require('lspconfig')
local on_attach = require('lsp.on_attach')

require('lsp.efm')

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = false,
    underline = true,
    signs = true,
  }
)

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig.solargraph.setup {
  settings = {
    solargraph = {
      commandPath = '/Users/kassioborges/.asdf/shims/solargraph',
      completion = true
    }
  },
  capabilities = capabilities,
  on_attach = on_attach
}

lspconfig.sumneko_lua.setup({
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostics = {
        enable = true,
        globals = {
          "vim",
          "describe",
          "it",
          "before_each",
          "after_each",
          "awesome",
          "theme",
          "client"
        }
      }
    }
  }
})

local servers_with_efm = { "cssls","html", "jsonls", "tsserver" }

for _, lsp in ipairs(servers_with_efm) do
  lspconfig[lsp].setup {
    capabilities = capabilities,
    on_attach = function(client)
      client.resolved_capabilities.document_formatting = false
      on_attach(client)
    end
  }
end

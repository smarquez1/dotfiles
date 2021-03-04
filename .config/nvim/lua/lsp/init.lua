-- https://github.com/lucastrvsn/dot/blob/master/.config/nvim/lua/lsp/init.lua
local lspconfig = require('lspconfig')
local on_attach = require('lsp.on_attach')
local lsp = vim.lsp

lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = false,
    underline = false,
    signs = true,
  }
)

local capabilities = lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- require('lsp.efm')

lspconfig.solargraph.setup {
  settings = {
    solargraph = {
      -- commandPath = '/Users/kassioborges/.asdf/shims/solargraph',
      completion = true
    }
  },
  capabilities = capabilities,
  on_attach = on_attach
}

-- https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#sumneko_lua
-- lspconfig.sumneko_lua.setup({
--   on_attach = on_attach,
--   settings = {
--     Lua = {
--       diagnostics = {
--         enable = true,
--         globals = { "vim", "describe", "it", "before_each", "after_each", "awesome", "theme", "client" }
--       }
--     }
--   }
-- })

local function organize_imports()
 local params = {
   command = "_typescript.organizeImports",
   arguments = { vim.api.nvim_buf_get_name(0) },
   title = ""
 }
 vim.lsp.buf.execute_command(params)
end

lspconfig.tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  commands = {
    OrganizeImports = {
      organize_imports,
      description = "Organize Imports"
    }
  },
  on_attach = function(client)
    client.resolved_capabilities.document_formatting = false
    on_attach(client)
  end
}

local servers = { "cssls","html", "jsonls" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    capabilities = capabilities,
    on_attach = function(client)
      client.resolved_capabilities.document_formatting = false
      on_attach(client)
    end
  }
end

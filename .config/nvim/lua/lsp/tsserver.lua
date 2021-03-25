local lspconfig = require('lspconfig')
local on_attach = require('lsp.on_attach')

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local function organize_imports()
 local params = {
   command = "_typescript.organizeImports",
   arguments = { vim.api.nvim_buf_get_name(0) },
   title = ""
 }
 vim.lsp.buf.execute_command(params)
end

lspconfig.tsserver.setup {
  capabilities = capabilities,
  commands = {
    OrganizeImports = {
      organize_imports,
      description = "Organize Imports"
    }
  },
  on_attach = on_attach
}


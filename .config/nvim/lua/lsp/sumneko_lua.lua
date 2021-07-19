local lspconfig = require('lspconfig')
local on_attach = require('lsp.on_attach')

lspconfig.sumneko_lua.setup {
  cmd = { "lua-langserver" },
  -- capabilities = capabilities,
  on_attach = on_attach,
  --[[ settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
        path = vim.split(package.path, ';'),
      },
      diagnostics = {
        globals = {'vim'},
      },
      workspace = {
	library = {},
	maxPreload = 2000,
	preloadFileSize = 150,
      },
      telemetry = { enable = false },
    },
  } ]]
}

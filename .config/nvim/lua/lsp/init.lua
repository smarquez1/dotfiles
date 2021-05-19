local lspconfig = require('lspconfig')
local on_attach = require('lsp.on_attach')
local capabilities = require('lsp.capabilities')
local saga = require('lspsaga')

saga.init_lsp_saga {
  code_action_icon = '💡',
  code_action_prompt = {
    virtual_text = true
  },
}

-- handlers
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = false,
    underline = true,
    update_in_insert = true,
    signs = true,
  }
)
vim.lsp.diagnostic.show_line_diagnostics =
  require('lspsaga.diagnostic').show_line_diagnostics

vim.lsp.handlers["textDocument/hover"] =
  require('lspsaga.hover').handler

local servers = { "cssls", "html", "jsonls", "solargraph" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup { capabilities = capabilities, on_attach = on_attach }
end

require('lsp.efm')
require('lsp.sumneko_lua')
require('lsp.tsserver')

-- vim.cmd([[
--   augroup prewrites
--     " *.rb,*.js,*.jsx,*.scss,*.json,*.html*.rb,*.js,*.jsx,*.scss,*.json,*.html
--     autocmd BufWritePre * lua vim.lsp.buf.formatting_sync(nil, 1000)
--   augroup END
-- ]])

-- to disable the augroup...
-- augroup prewrites
--   autocmd!
-- augroup END

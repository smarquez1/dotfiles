local U = require './utils'
local lsp = require 'lspconfig'
local completion = require 'completion'
local lsp_status = require 'lsp-status'

local custom_on_attach = function(client, bufnr)
  completion.on_attach()
  lsp_status.on_attach(client)
end

lsp.solargraph.setup {
  settings = { solargraph = { diagnostics = true } },
  on_attach = custom_on_attach
}

lsp.tsserver.setup {
  on_attach = custom_on_attach
}

lsp_status.register_progress()

U.map('n', '<leader>gd', ':lua vim.lsp.buf.definition()<cr>')
U.map('n', '<leader>af', ':lua vim.lsp.buf.formatting()<cr>')
U.map('n', '<leader>k', ':lua vim.lsp.buf.hover()<cr>')
U.map('n', '<leader>gR', ':lua vim.lsp.buf.rename()<cr>')
U.map('n', '<leader>r', ':lua vim.lsp.buf.references()<cr>')
U.map('n', '<leader>s', ':lua vim.lsp.buf.document_symbol()<cr>')

U.opt('o', 'completion_matching_strategy_list', ['exact', 'substring', 'fuzzy'])

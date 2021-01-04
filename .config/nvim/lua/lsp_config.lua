require '../utils'

local lsp = require 'lspconfig'
local configs = require('lspconfig/configs')
local completion = require('completion')
local lsp_status = require('lsp-status')

lsp.solargraph.setup {
  settings = { solargraph = { diagnostics = true } },
  on_attach = completion.on_attach
}

lsp.tsserver.setup {
  on_attach = completion.on_attach
}

U.map('n', '<space>gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
U.map('n', '<space>af', '<cmd>lua vim.lsp.buf.formatting()<CR>')
U.map('n', '<space>k', '<cmd>lua vim.lsp.buf.hover()<CR>')
U.map('n', '<space>gR', '<cmd>lua vim.lsp.buf.rename()<CR>')
U.map('n', '<space>r', '<cmd>lua vim.lsp.buf.references()<CR>')
U.map('n', '<space>s', '<cmd>lua vim.lsp.buf.document_symbol()<CR>')

U.opt('o', 'completion_matching_strategy_list', ['exact', 'substring', 'fuzzy'])

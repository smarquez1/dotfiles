local lsp_status = require 'lsp-status'
local lspconfig = require 'lspconfig'
local saga = require 'lspsaga'

local u = require('utils')
local o = vim.o
local w = vim.wo
local b = vim.bo

local on_attach = function(client, bufnr)
  b.omnifunc = 'v:lua.vim.lsp.omnifunc'

  -- Mappings
  local opts = { noremap=true, silent=true }
  u.map_lua_buf('n', 'gD', 'vim.lsp.buf.declaration()', opts)
  u.map_lua_buf('n', 'gd', 'vim.lsp.buf.definition()', opts)
  u.map_lua_buf('n', 'dp', "require('lspsaga.provider').preview_definition()", opts)
  -- u.map_lua_buf ('n', 'K', 'vim.lsp.buf.hover()', opts)
  u.map_lua_buf('n', 'K', "require('lspsaga.provider').render_hover_doc()", opts)
  u.map_lua_buf('n', 'gi', 'vim.lsp.buf.implementation()', opts)
  -- u.map_lua_buf ('n', '<C-k>', 'vim.lsp.buf.signature_help()', opts)
  u.map_lua_buf('n', '<leader>wa', 'vim.lsp.buf.add_workspace_folder()', opts)
  u.map_lua_buf('n', '<leader>wr', 'vim.lsp.buf.remove_workspace_folder()', opts)
  u.map_lua_buf('n', '<leader>wl', 'print(vim.inspect(vim.lsp.buf.list_workspace_folders()))', opts)
  u.map_lua_buf('n', '<leader>D', 'vim.lsp.buf.type_definition()', opts)
  -- u.map_lua_buf('n', '<leader>rn', 'vim.lsp.buf.rename()', opts)
  u.map_lua_buf('n', '<leader>rn', "require('lspsaga.rename').rename()", opts)
  u.map_lua_buf('n', 'gr', 'vim.lsp.buf.references()', opts)
  -- u.map_lua_buf('n', '<leader>e', 'vim.lsp.diagnostic.show_line_diagnostics()', opts)
  u.map_lua_buf('n', '[d', "require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()", opts)
  u.map_lua_buf('n', ']d', "require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()", opts)
  u.map_lua_buf('n', '<leader>q', 'vim.lsp.diagnostic.set_loclist()', opts)
  u.map_lua_buf('n', '<leader>ca', "require('lspsaga.codeaction').code_action()", opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'v', '<leader>ca', "<cmd>'<,'>lua require('lspsaga.codeaction').range_code_action()<cr>", opts)

  -- vim.cmd [[autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()]]
  vim.cmd [[autocmd CursorHold * lua require'lspsaga.diagnostic'.show_line_diagnostics()]]
  -- nnoremap <silent> <leader>cd :Lspsaga show_line_diagnostics<CR>
  vim.cmd [[autocmd CursorHoldI * silent! lua vim.lsp.buf.signature_help()]]

  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
    u.map_lua_buf("n", "<leader>qf", "vim.lsp.buf.formatting()", opts)
  elseif client.resolved_capabilities.document_range_formatting then
    u.map_lua_buf("n", "<leader>qf", "vim.lsp.buf.range_formatting()", opts)
  end
end

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = false,
    underline = true,
    signs = true,
  }
)

local servers =
  { "solargraph", "cssls","html", "jsonls", "dockerls", "yamlls" } -- sumneko

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    capabilities = capabilities,
    on_attach = on_attach,
  }
end


lspconfig.tsserver.setup {
    on_attach = function(client, bufnr)
        client.resolved_capabilities.document_formatting = false
        on_attach(client, bufnr)
    end
}
local eslint = {
  lintCommand = "./node_modules/.bin/eslint -f unix --stdin",
  lintIgnoreExitCode = true,
  lintStdin = true
}

lspconfig.efm.setup {
  filetypes = {"javascriptreact", "typescript"},
  init_options = { documentFormatting = true},
  settings = {
    rootMarkers = { ".eslintrc.js", },
    languages = {
      typescript = {eslint},
      javascript = {eslint},
      typescriptreact = {eslint},
      javascriptreact = {eslint},
    }
  },
  on_attach = on_attach,
}

lsp_status.register_progress()
saga.init_lsp_saga()
require('formatter').setup()

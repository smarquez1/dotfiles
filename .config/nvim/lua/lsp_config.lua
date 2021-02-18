local lsp_status = require 'lsp-status'
local nvim_lsp = require 'lspconfig'
local saga = require 'lspsaga'

local on_attach = function(client, bufnr)
  local function bmap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function boption(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  boption('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }
  bmap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  -- bmap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  bmap('n', 'gd', "<cmd>lua require'lspsaga.provider'.preview_definition()<CR>", opts)
  -- bmap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  bmap('n', 'K', "<cmd>lua require'lspsaga.provider'.render_hover_doc()<CR>", opts)
  bmap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  -- bmap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  bmap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  bmap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  bmap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  bmap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  -- bmap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  bmap('n', '<leader>rn', "<cmd>lua require('lspsaga.rename').rename()", opts)
  bmap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  -- bmap('n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  bmap('n', '[d', "<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>", opts)
  bmap('n', ']d', "<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>", opts)
  bmap('n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

  bmap('n', '<leader>ca', "<cmd>lua require'lspsaga.codeaction'.code_action()<CR>", opts)
  bmap('v', '<leader>ca', "<cmd>'<,'>lua require'lspsaga.codeaction'.range_code_action()<CR>", opts)

  -- vim.cmd [[autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()]]
  vim.cmd [[autocmd CursorHold * lua require'lspsaga.diagnostic'.show_line_diagnostics()]]
  -- nnoremap <silent> <leader>cd :Lspsaga show_line_diagnostics<CR>
  vim.cmd [[autocmd CursorHoldI * silent! lua vim.lsp.buf.signature_help()]]

  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
    bmap("n", "<leader>qf", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  elseif client.resolved_capabilities.document_range_formatting then
    bmap("n", "<leader>qf", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  end

  -- Format on save
  vim.cmd [[autocmd BufWritePre *.ruby lua vim.lsp.buf.formatting_sync(nil, 1000)]]
  vim.cmd [[autocmd BufWritePre *.jsx lua vim.lsp.buf.formatting_sync(nil, 1000)]]
  vim.cmd [[autocmd BufWritePre *.js lua vim.lsp.buf.formatting_sync(nil, 1000)]]
end

lsp_status.register_progress()
saga.init_lsp_saga()
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- gem install solargraph
nvim_lsp.solargraph.setup {
  settings = { solargraph = { diagnostics = true } },
  capabilities = capabilities,
  on_attach = on_attach
}

-- npm install -g vscode-css-languageserver-bin
-- npm install -g typescript typescript-language-server
-- npm install -g vscode-html-languageserver-bin
-- npm install -g vscode-json-languageserver
-- npm install -g dockerfile-language-server-nodejs
-- npm install -g yaml-language-server
-- https://github.com/sumneko/lua-language-server/wiki/Build-and-Run-(Standalone)

local servers =
  { "cssls", "tsserver", "html", "jsonls", "dockerls", "yamlls", "sumneko_lua" }
  
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup { capabilities = capabilities; on_attach = on_attach, }
end

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = false,
    underline = true,
    signs = true,
  }
)

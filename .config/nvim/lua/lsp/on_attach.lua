local map_buf = require('utils').map_buf
local buf_option = require('utils').buf_option

local on_attach = function(client)
  buf_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings
  local opts = { noremap = true, silent = true }

  map_buf('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  map_buf('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  map_buf('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  map_buf('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  map_buf('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  -- map_buf('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  -- map_buf('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  -- map_buf('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  -- map_buf('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  map_buf('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  map_buf('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  map_buf('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  -- map_buf('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  map_buf('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  map_buf('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  map_buf('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  map_buf("n", "<space>bf", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

  vim.cmd [[
    augroup lsp
      au CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()
      au CursorHoldI * silent! lua vim.lsp.buf.signature_help()
      au CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()
      au CursorHold  <buffer> lua vim.lsp.buf.document_highlight()
      au CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()
      au CursorMoved <buffer> lua vim.lsp.buf.clear_references()
    augroup END
  ]]
end

return on_attach

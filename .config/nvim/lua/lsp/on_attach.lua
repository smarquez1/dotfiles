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
  map_buf('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  map_buf('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  map_buf('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  map_buf('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  map_buf('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  map_buf("n", "<leader>bf", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  -- map_buf('n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  -- map_buf('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  -- map_buf('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  -- map_buf('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  -- map_buf('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  -- map_buf('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)

  vim.cmd [[
    augroup lsp
      au CursorHoldI * silent! lua vim.lsp.buf.signature_help()
      au CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      au CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics({ border = "single", focusable = false })
    augroup END
  ]]
end

return on_attach

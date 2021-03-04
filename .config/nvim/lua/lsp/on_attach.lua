local map_lua_buf = require('utils').map_lua_buf
local buf_option = require('utils').buf_option

require('lspsaga').init_lsp_saga()

local on_attach = function(client)
  buf_option = 'v:lua.vim.lsp.omnifunc'

  -- Mappings
  local opts = { noremap=true, silent=true }
  map_lua_buf('n', 'gD', 'vim.lsp.buf.declaration()', opts)
  map_lua_buf('n', 'gd', 'vim.lsp.buf.definition()', opts)
  map_lua_buf('n', 'dp', "require('lspsaga.provider').preview_definition()", opts)
  -- map_lua_buf ('n', 'K', 'vim.lsp.buf.hover()', opts)
  map_lua_buf('n', 'K', "require('lspsaga.provider').render_hover_doc()", opts)
  map_lua_buf('n', 'gi', 'vim.lsp.buf.implementation()', opts)
  -- map_lua_buf ('n', '<C-k>', 'vim.lsp.buf.signature_help()', opts)
  map_lua_buf('n', '<leader>wa', 'vim.lsp.buf.add_workspace_folder()', opts)
  map_lua_buf('n', '<leader>wr', 'vim.lsp.buf.remove_workspace_folder()', opts)
  map_lua_buf('n', '<leader>wl', 'print(vim.inspect(vim.lsp.buf.list_workspace_folders()))', opts)
  map_lua_buf('n', '<leader>D', 'vim.lsp.buf.type_definition()', opts)
  -- map_lua_buf('n', '<leader>rn', 'vim.lsp.buf.rename()', opts)
  map_lua_buf('n', '<leader>rn', "require('lspsaga.rename').rename()", opts)
  map_lua_buf('n', 'gr', 'vim.lsp.buf.references()', opts)
  -- map_lua_buf('n', '<leader>e', 'vim.lsp.diagnostic.show_line_diagnostics()', opts)
  map_lua_buf('n', '[d', "require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()", opts)
  map_lua_buf('n', ']d', "require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()", opts)
  map_lua_buf('n', '<leader>q', 'vim.lsp.diagnostic.set_loclist()', opts)
  map_lua_buf('n', '<leader>ca', "require('lspsaga.codeaction').code_action()", opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'v', '<leader>ca', "<cmd>'<,'>lua require('lspsaga.codeaction').range_code_action()<cr>", opts)

  -- vim.cmd [[autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()]]
  vim.cmd [[autocmd CursorHold * lua require'lspsaga.diagnostic'.show_line_diagnostics()]]
  -- nnoremap <silent> <leader>cd :Lspsaga show_line_diagnostics<CR>
  vim.cmd [[autocmd CursorHoldI * silent! lua vim.lsp.buf.signature_help()]]

  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
    map_lua_buf("n", "<leader>qf", "vim.lsp.buf.formatting()", opts)
  elseif client.resolved_capabilities.document_range_formatting then
    map_lua_buf("n", "<leader>qf", "vim.lsp.buf.range_formatting()", opts)
  end
end

return on_attach

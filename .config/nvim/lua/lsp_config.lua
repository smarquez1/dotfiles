-- TODO: Fix loading js snippets, Enable vsnips, maybe replace ultisnips
-- TODO: check that snipeets jump to next using tab
-- TODO: display diagnostics in floating window, not virtual text ... Enable LSP saga and/or lsp utils https://www.reddit.com/r/neovim/comments/l61gzb/builtin_lsp_client_exeprience/
-- TODO: improve lsp status messaging
-- TODO: add mhartington/formatter.nvim?
-- https://www.reddit.com/r/neovim/comments/l61gzb/builtin_lsp_client_exeprience/
-- https://www.reddit.com/r/neovim/comments/l6okhx/nvimcompe_is_an_excellent_autocompletion_plugin/

local lsp_status = require 'lsp-status'
lsp_status.register_progress()

local lsp = require 'lspconfig'

local custom_on_attach = function(client, bufnr)
  lsp_status.on_attach(client)
end

-- gem install solargraph
lsp.solargraph.setup {
  settings = { solargraph = { diagnostics = true } },
  on_attach = custom_on_attach
}
-- npm install -g vscode-css-languageserver-bin
lsp.cssls.setup { on_attach = custom_on_attach }
-- npm install -g typescript typescript-language-server
lsp.tsserver.setup { on_attach = custom_on_attach }
-- npm install -g vscode-html-languageserver-bin
lsp.html.setup { on_attach = custom_on_attach }
-- npm install -g vscode-json-languageserver
lsp.jsonls.setup { on_attach = custom_on_attach }
-- npm install -g dockerfile-language-server-nodejs
lsp.dockerls.setup { on_attach = custom_on_attach }
-- npm install -g yaml-language-server
lsp.yamlls.setup { on_attach = custom_on_attach }
-- https://github.com/sumneko/lua-language-server/wiki/Build-and-Run-(Standalone)
lsp.sumneko_lua.setup { on_attach = custom_on_attach }

lsp_status.register_progress()

-- Mappings
local opts = { noremap = true, silent = true }
local map = vim.api.nvim_set_keymap

map('n', '<silent>gd', ':lua vim.lsp.buf.definition()<cr>', opts)
map('n', '<silent>K' , ':lua vim.lsp.buf.hover()<cr>', opts)
map('n', '<silent>gr', ':lua vim.lsp.buf.references()<cr>', opts)

map('n', '<leader>gR', ':lua vim.lsp.buf.rename()<cr>', opts)
map('n', '<leader>af', ':lua vim.lsp.buf.formatting()<cr>', opts)

local compe = require'compe'

-- Compe TODO: move to own file
compe.setup {
  enabled = true,

  source = {
    path = true,
    buffer = true,
    vsnip = true,
    ultisnips = true,
    nvim_lsp = true
  }
}

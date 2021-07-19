local lspconfig = require('lspconfig')
local on_attach = require('lsp.on_attach')

local configs = require'lspconfig/configs'
if not lspconfig.emmet_ls then
  configs.emmet_ls = {
    default_config = {
      cmd = {'emmet-ls', '--stdio'};
      filetypes = {'html', 'css'};
      root_dir = function(fname)
        return vim.loop.cwd()
      end;
      settings = {};
    },
    flags = {
      debounce_text_changes = 150,
    }
  }
end

lspconfig.emmet_ls.setup {}

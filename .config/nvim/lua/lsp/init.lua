-- https://github.com/lucastrvsn/dot/blob/master/.config/nvim/lua/lsp/init.lua
local lspconfig = require('lspconfig')
local on_attach = require('lsp.on_attach')
local lsp = vim.lsp
local saga = require('lspsaga').init_lsp_saga()

lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = false,
    underline = false,
    signs = true,
  }
)

-- TODO: Lsp saga config, check out readme. Can replaces mppings on on_attach
-- https://github.com/tjdevries/config_manager/blob/master/xdg_config/nvim/lua/tj/lsp/handlers.lua
-- Override various utility functions.
vim.lsp.diagnostic.show_line_diagnostics =
  require('lspsaga.diagnostic').show_line_diagnostics
vim.lsp.handlers["textDocument/hover"] =
  require('lspsaga.hover').handler

local capabilities = lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- require('lsp.efm')

-- https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#sumneko_lua
-- lspconfig.sumneko_lua.setup({
--   on_attach = on_attach,
--   settings = {
--     Lua = {
--       diagnostics = {
--         enable = true,
--         globals = { "vim", "describe", "it", "before_each", "after_each", "awesome", "theme", "client" }
--       }
--     }
--   }
-- })

-- https://github.com/sumneko/lua-language-server/wiki/Build-and-Run-(Standalone)
USER = vim.fn.expand('$USER')

local sumneko_root_path = ""
local sumneko_binary = ""

if vim.fn.has("mac") == 1 then
    sumneko_root_path = "/Users/" .. USER .. "/.config/nvim/lua-language-server"
    sumneko_binary = "/Users/" .. USER .. "/.config/nvim/lua-language-server/bin/macOS/lua-language-server"
elseif vim.fn.has("unix") == 1 then
    sumneko_root_path = "/home/" .. USER .. "/.config/nvim/lua-language-server"
    sumneko_binary = "/home/" .. USER .. "/.config/nvim/lua-language-server/bin/Linux/lua-language-server"
else
    print("Unsupported system for sumneko")
end

require'lspconfig'.sumneko_lua.setup {
    cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
                -- Setup your lua path
                path = vim.split(package.path, ';')
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {'vim'}
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = {[vim.fn.expand('$VIMRUNTIME/lua')] = true, [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true}
            }
        }
    }
}

local function organize_imports()
 local params = {
   command = "_typescript.organizeImports",
   arguments = { vim.api.nvim_buf_get_name(0) },
   title = ""
 }
 vim.lsp.buf.execute_command(params)
end

lspconfig.tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  commands = {
    OrganizeImports = {
      organize_imports,
      description = "Organize Imports"
    }
  },
  on_attach = function(client)
    on_attach(client)
  end
}

local servers = { "cssls", "html", "jsonls", "solargraph" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    capabilities = capabilities,
    on_attach = on_attach
  }
end

-- lightbulb config
vim.cmd [[autocmd CursorHold,CursorHoldI * lua require('nvim-lightbulb').update_lightbulb()]]

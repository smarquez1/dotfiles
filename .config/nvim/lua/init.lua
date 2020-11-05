--
-- LSP

-- local lsp = require('nvim_lsp')

-- local on_attach = function(client)
--   require('completion').on_attach()
--   require('diagnostic').on_attach()
--   require('lsp-status').on_attach(client)
-- end

-- local lsp_status = require('lsp-status')

-- lsp_status.register_progress()

-- lsp.solargraph.setup({
--     settings = {
--       solargraph = {
--         diagnostics = true
--       }
--     },
--     on_attach = on_attach,
--     capabilities = lsp_status.capabilities
--   })

-- lsp.tsserver.setup({
--     on_attach = on_attach,
--     capabilities = lsp_status.capabilities
--   })

-- lsp.cssls.setup({
--     on_attach = on_attach,
--     capabilities = lsp_status.capabilities
--   })

-- lsp.html.setup({
--     on_attach = on_attach,
--     capabilities = lsp_status.capabilities
--   })

-- lsp.jsonls.setup({
--     on_attach = on_attach,
--     capabilities = lsp_status.capabilities
--   })

-- lsp.vimls.setup({
--     on_attach = on_attach,
--     capabilities = lsp_status.capabilities
--   })

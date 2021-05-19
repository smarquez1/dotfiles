local lsp_config = require('lspconfig')
local on_attach = require('lsp.on_attach')

local eslint = {
  lintCommand = 'eslint_d  -f unix --stdin --stdin-filename ${INPUT}',
  lintIgnoreExitCode = true,
  lintStdin = true,
  lintFormats = {"%f:%l:%c: %m"},
  formatCommand = "eslint_d --fix-to-stdout --stdin --stdin-filename=${INPUT}",
  formatStdin = true
}

local prettier =  {
  formatCommand = 'prettier --find-config-path --stdin-filepath ${INPUT}',
  formatStdin = true
}

local languages = {
  json = { prettier },
  javascript = { eslint, prettier },
  javascriptreact = { eslint, prettier },
  typescript = { eslint, prettier },
  typescriptreact = { eslint, prettier },
  css = { prettier },
  scss = { prettier },
  -- yaml = { prettier },
  -- markdown = { prettier },
  -- graphql = { prettier },
  -- html = { prettier }
}

lsp_config.efm.setup({
  root_dir = lsp_config.util.root_pattern("yarn.lock", ".git"),
  init_options = { documentFormatting = true, codeAction = true },
  filetypes = vim.tbl_keys(languages),
  settings = {languages = languages, log_level = 1, log_file = '~/efm.log'},
  on_attach = on_attach,
})

local lsp_config = require('lspconfig')
local on_attach = require('lsp.on_attach')
-- local eslint = require('lsp.efm.eslint')
-- local prettier = require('lsp.efm.prettier')

local eslint = {
  -- lintCommand = 'eslint_d --stdin --stdin-filename ${INPUT} -f unix',
  lintCommand = 'eslint --stdin --stdin-filename ${INPUT} -f unix',
  lintStdin = true,
  lintIgnoreExitCode = true,
  lintFormats = {"%f:%l:%c: %m"},
}

local prettier =  {
  formatCommand = 'prettier --find-config-path --stdin-filepath ${INPUT}',
  formatStdin = true
}

local efm_languages = {
  yaml = { prettier },
  json = { prettier },
  markdown = { prettier },
  -- javascript = { eslint, prettier },
  -- javascriptreact = { eslint, prettier },
  -- typescript = { eslint, prettier },
  -- typescriptreact = { eslint, prettier },
  javascript = { eslint },
  javascriptreact = { eslint },
  typescript = { eslint },
  typescriptreact = { eslint },
  css = { prettier },
  scss = { prettier },
  sass = { prettier },
  less = { prettier },
  json = { prettier },
  graphql = { prettier },
  html = { prettier }
}

lsp_config.efm.setup({
  args = { "-c", "~/.config/nvim/lua/lsp/efm/config.yaml" },
  on_attach = on_attach,
  init_options = { documentFormatting = false },
  settings = {
    rootMarkers = { 'package.json', '.git/', '.zshrc' },
    languages = efm_languages
  },
  diagnostics = { onChange = false }
})

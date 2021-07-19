local lsp_config = require('lspconfig')
local on_attach = require('lsp.on_attach')

local eslint = {
  lintCommand = "eslint_d -f visualstudio --stdin --stdin-filename ${INPUT}",
  lintIgnoreExitCode = true,
  lintStdin = true,
  lintFormats = { "%f(%l,%c): %tarning %m", "%f(%l,%c): %trror %m" },
}

local prettier =  {
  formatCommand = 'prettier --find-config-path --stdin-filepath ${INPUT}',
  formatStdin = true
}

local eslintPrettier = { prettier, eslint }

local languages = {
  json = { prettier },
  javascript = eslintPrettier,
  javascriptreact = eslintPrettier,
  typescript = eslintPrettier,
  typescriptreact = eslintPrettier,
  --[[ css = { prettier },
  scss = { prettier }, ]]
  -- yaml = { prettier },
  -- markdown = { prettier },
  -- graphql = { prettier },
  -- html = { prettier }
}

lsp_config.efm.setup({
  init_options = { documentFormatting = true },
  filetypes = vim.tbl_keys(languages),
  settings = {
    rootMarkers = { "package.json", ".git" },
    languages = languages,
  },
  on_attach = on_attach,
})

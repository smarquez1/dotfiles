-- I will use this until formatting from LSP is stable.

local eslint = function()
  return {
    exe = "eslint",
    args = {
      "--stdin-filename",
      vim.api.nvim_buf_get_name(0),
      "--fix",
      "--cache"
    },
    stdin = false
  }
end

local prettier = function()
  return {
    exe = "prettier",
    args = {
      "--stdin-filepath",
      vim.api.nvim_buf_get_name(0),
      "--single-quote"
    },
    stdin = true
  }
end

require('formatter').setup({
  logging = false,
  filetype = {
    javascript = { eslint },
    javascriptreact = { eslint },
    typescript = { eslint },
    typescriptreact = { eslint },
    -- javascript = { prettier },
    -- javascriptreact = { prettier },
    -- typescript = { prettier },
    -- typescriptreact = { prettier },
    css = { prettier },
    less = { prettier },
    sass = { prettier },
    scss = { prettier },
    json = { prettier },
    graphql = { prettier },
    markdown = { prettier },
    yaml = { prettier },
    html = { prettier }
  }
})

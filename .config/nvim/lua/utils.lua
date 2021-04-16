local M = {}

function M.map(mode, key, fn, opts)
  vim.api.nvim_set_keymap(mode, key, fn, opts or {})
end

function M.map_buf(...)
  vim.api.nvim_buf_set_keymap(bufnr, ...)
end

-- Buffer local option
function M.buf_option(...)
  vim.api.nvim_buf_set_option(bufnr, ...)
end

return M

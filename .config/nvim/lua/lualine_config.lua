local lualine = require('lualine')
lualine.theme = 'onedark'

local function coc_status()
  if not vim.g.coc_status then return '' end
  return vim.g.coc_status
end

local function lsp_status()
  if not ( #vim.lsp.buf_get_clients() > 0 ) then return '' end
  return require('lsp-status').status()
end

lualine.sections = {
  lualine_a = { 'mode' },
  lualine_b = { 'branch' },
  lualine_c = { 'filename', lsp_status },
  lualine_x = { },
  lualine_y = { 'filetype' },
  lualine_z = { 'location' },
}

lualine.inactive_sections = {
  lualine_c = { 'filename' },
  lualine_x = { 'location' },
}

lualine.status()

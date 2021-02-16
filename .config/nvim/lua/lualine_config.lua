local lualine = require('lualine')
lualine.options.theme = 'onedark'

local function coc_status()
  if not vim.g.coc_status then return '' end
  return vim.g.coc_status
end

local function lsp_status()
  if not vim.tbl_isempty(vim.lsp.buf_get_clients(0)) then
    -- local error_count = vim.lsp.diagnostic.get_count(0, 'Error')
    -- local warning_count = vim.lsp.diagnostic.get_count(0, 'Warning')
    -- local info_count = vim.lsp.diagnostic.get_count(0, 'Information') +  vim.lsp.diagnostic.get_count(0, 'Hint') 
    -- return 'E: ' .. error_count .. ' W: ' .. warning_count .. ' I: ' .. info_count
    return require('lsp-status').status()
  else
    return ''
  end
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

-- local diagnostics = require('lsp-status/diagnostics')

-- local function statusline()
--   if #vim.lsp.buf_get_clients() == 0 then
--     return ''
--   end

--   local buf_diagnostics = diagnostics()

--   local errors = ""
--   local warnings = ""
--   local info = ""
--   local hints = ""

--   if buf_diagnostics.errors and buf_diagnostics.errors > 0 then
--     errors = "%#LspStatusError# 󰅚  "..buf_diagnostics.errors
--   end

--   if buf_diagnostics.warnings and buf_diagnostics.warnings > 0 then
--     warnings = "%#LspStatusWarning# 󰗖  "..buf_diagnostics.warnings
--   end

--   if buf_diagnostics.info and buf_diagnostics.info > 0 then
--     info = "%#LspStatusInformation# 󰙎 "..buf_diagnostics.info
--   end

--   if buf_diagnostics.hints and buf_diagnostics.hints > 0 then
--     hints = "%#LspStatusHint# 󱉵  "..buf_diagnostics.hints
--   end

--   return errors..warnings..info..hints
-- end

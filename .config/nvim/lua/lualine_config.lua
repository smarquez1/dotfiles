local lualine = require('lualine')
lualine.theme = 'onedark'
-- lualine.extensions = { 'fzf' }

local function coc_status()
  if not vim.g.coc_status then return '' end
  return vim.g.coc_status
end

local function git_blame()
  if not vim.b.coc_git_blame then return '' end
  return vim.b.coc_git_blame
  -- return winwidth(0) > 120 ? blame : ''
end

local function lsp_status()
  return require('lsp-status').messages()
end

lualine.sections = {
  lualine_a = { 'mode' },
  lualine_b = { 'branch' },
  lualine_c = { 'filename', coc_status, git_blame },
  lualine_x = { },
  lualine_y = { 'filetype' },
  lualine_z = { 'location' },
}

lualine.inactive_sections = {
  lualine_c = { 'filename' },
  lualine_x = { 'location' },
}

lualine.status()

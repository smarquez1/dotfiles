local lualine = require('lualine')
lualine.theme = 'onedark'
-- lualine.extensions = { 'fzf' }

local function coc_diagnostic_count(section)
  local info = vim.b.coc_diagnostic_info
  if info == nil or next(info) == nil then return 0 end
  return info[section]
end

local function coc_diagnostic(symbol, section)
  local count = coc_diagnostic_count(section)
  if count > 0 then return symbol .. ': ' .. count else return '' end
end

local function coc_status()
  if not vim.g.coc_status then return '' end
  return vim.g.coc_status
end

local function coc_diagnostics()
  local sections = {}
    -- local errors = coc_diagnostic('E', 'error'),
  -- if errorstable.insert(sections, errors)
    -- local hints = coc_diagnostic('H', 'hint'),
    -- coc_diagnostic('I', 'information'),
    -- coc_diagnostic('W', 'warning')

  -- for i = 1, 4 do
  --   if sections[i] == '' then table.remove(sections, i) end
  -- end

  -- return table.concat(sections, " | ")
  return ''
end

lualine.sections = {
  lualine_a = { 'mode'},
  lualine_b = { 'branch' },
  lualine_c = { 'filename', coc_status },
  lualine_x = {  },
  lualine_y = { 'filetype'},
  lualine_z = { coc_diagnostics },
}

lualine.inactive_sections = {
  lualine_c = { 'filename' },
  lualine_x = { 'location' },
}

lualine.status()

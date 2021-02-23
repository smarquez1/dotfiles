local lualine = require('lualine')

lualine.options = {
  theme = 'onedark',
  component_separators = {'|', '|'},
}

lualine.sections = {
  lualine_a = { 'mode' },
  lualine_b = { 'branch', 'signify' },
  lualine_c = {
    { 'diagnostics', sources = { 'nvim_lsp', 'ale' }, symbols = { error = ' ', warn = ' ', info = ' ' } },
    'filename'
  },
  lualine_x = { },
  lualine_y = { 'filetype' },
  lualine_z = { 'location' },
}

lualine.inactive_sections = {
  lualine_c = { 'filename' },
  lualine_x = { 'location' },
}

lualine.status()

require('lualine').setup {
  options = {
    theme = 'onedark',
    section_separators = {'',''},
    component_separators = {'|', '|'},
    icons_enabled = true,
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch', 'diff' },
    lualine_c = {
      {
	'diagnostics',
	sources = { 'nvim_lsp' },
	symbols = { error = ' ', warn = ' ', info = ' ' }
      },
      { 'filename', file_status = true },
    },
    lualine_x = { 'encoding', 'fileformat', 'filetype' },
    lualine_y = { },
    lualine_z = { 'location' },
  },

  inactive_sections = {
    lualine_c = { 'filename' },
    lualine_x = { 'location' },
  },
  extensions = { 'fzf' }
}

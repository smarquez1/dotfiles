require('settings')
require('mappings')
require('plugins')
require('colorscheme')

-- Allow using local .nvimrc
-- vim.o.exrc = true
-- The option above is not working rn.
-- more info: https://github.com/neovim/neovim/issues/13501
-- Workaround:
local local_vimrc = vim.fn.getcwd()..'/.nvimrc'
if vim.loop.fs_stat(local_vimrc) then
  vim.cmd('source '..local_vimrc)
end

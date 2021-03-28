require('settings')
require('mappings')
require('plugins')

--https://github.com/neovim/neovim/issues/13501
-- vim.o.exrc = true -- Allow using local nvimrc
local local_vimrc = vim.fn.getcwd()..'/.nvimrc'
if vim.loop.fs_stat(local_vimrc) then
  vim.cmd('source '..local_vimrc)
end

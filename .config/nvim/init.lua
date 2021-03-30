require('settings')
require('mappings')
require('plugins')

-- Allow using local .nvimrc
-- vim.o.exrc = true
-- https://github.com/neovim/neovim/issues/13501
local local_vimrc = vim.fn.getcwd()..'/.nvimrc'
if vim.loop.fs_stat(local_vimrc) then
  vim.cmd('source '..local_vimrc)
end

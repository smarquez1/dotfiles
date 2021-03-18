vim.o.mouse = 'a' -- Enable mouse
vim.o.lazyredraw = true -- the screen will not be redrawn unless necessary
vim.o.exrc = true -- Allow using local nvimrc
-- Search
vim.o.ignorecase = true
vim.o.smartcase  = true
vim.o.inccommand = 'nosplit' -- Enable live substitution
-- No backups or swapfile
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false
vim.o.undodir = '/tmp//,.'
vim.o.undofile = true
vim.o.hidden = true -- Keep undo history for hidden buffers
-- more Natural splits behaviour
vim.o.splitbelow = true
vim.o.splitright = true
-- Wrap text
vim.o.linebreak = true
vim.o.breakindent = true
vim.o.showbreak = '↪' -- Show breakline symbol
vim.o.clipboard = 'unnamed,unnamedplus' -- Use system's clipboard
-- Ident using 2 spaces by default
vim.bo.expandtab = true -- converts tabs to spaces
vim.o.smarttab = true
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.tabstop = 2
vim.o.termguicolors = true -- Support 24 bit color
vim.o.updatetime = 300  --Faster completion
vim.o.sidescrolloff = 4
vim.o.scrolloff = 4
vim.o.pumheight=10 --Makes popup menu smaller
vim.o.conceallevel=0  --So that I can see `` in markdown files
vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.cursorline = true -- Highlight cursor
vim.wo.signcolumn="yes"                      --Always show the signcolumn, otherwise it would shift the text each time

vim.cmd('set iskeyword+=-') --treat dash separated words as a word text object"
-- ft=markdown

vim.cmd [[autocmd FileType markdown setl spell]] -- Enable spelling
-- ft=terminal
vim.cmd [[autocmd TermOpen term://* startinsert]] -- Start on insert mode.
vim.cmd [[autocmd TermOpen * setlocal nonumber norelativenumber]] -- No line numbers

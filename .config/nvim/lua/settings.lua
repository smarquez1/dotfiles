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
vim.o.hidden = true -- Keep undo history for hidden buffers
-- Show line numbers
vim.o.number = true
vim.o.relativenumber = true
-- more Natural splits behaviour
vim.o.splitbelow = true
vim.o.splitright = true
-- Wrap text
vim.o.linebreak = true
vim.o.breakindent = true
vim.o.showbreak = '↪' -- Show breakline symbol
vim.o.clipboard = 'unnamed,unnamedplus' -- Use system's clipboard
-- Ident using 2 spaces by default
vim.o.expandtab = true
vim.o.smarttab = true
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.tabstop = 2
vim.o.termguicolors = true -- Support 24 bit color
-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable delays and poor user experience.
vim.o.updatetime = 300
-- vim.o.cursorline = true Highlight cursor
-- number of lines to scroll when the cursor gets off the screen
vim.o.sidescrolloff = 5
vim.o.scrolloff = 5

-- ft=markdown
-- Enable spelling
vim.cmd [[autocmd FileType markdown setl spell]]
-- ft=terminal
-- Start on insert mode.
vim.cmd [[autocmd TermOpen term://* startinsert]]
-- No line numbers
vim.cmd [[autocmd TermOpen * setlocal nonumber norelativenumber]]

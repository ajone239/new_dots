--
-- Nvim options
--

vim.o.syntax = true
vim.o.autoindent = true
vim.o.smartindent = true

vim.o.background = 'dark'

-- "Tell you if you are in insert mode
vim.o.showmode = true

-- "See where you've been
vim.o.showcmd = true

-- "match parenthesis, i.e. ) with (and } with {
vim.o.showmatch = true

-- search options
vim.o.wildmode = 'longest'
vim.o.incsearch = true
vim.o.hlsearch = true

vim.o.scrolloff = 5

-- line numbers
vim.o.relativenumber = true
vim.o.number = true

vim.g.filetype = 'on'

-- " visual beep
vim.g.vb = true

-- "ignore case when doing searches
vim.g.ignorecase = true
vim.g.smartcase = true

-- "tell you how many lines have been changed
vim.g.report = 0

local prefix = vim.env.XDG_CONFIG_HOME or vim.fn.expand("~/.config")

vim.opt.undodir = { prefix .. "/nvim/.undo//" }
vim.opt.backupdir = { prefix .. "/nvim/.backup//" }
vim.opt.directory = { prefix .. "/nvim/.swap//" }

-- Set the behavior of tab
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.smarttab = true

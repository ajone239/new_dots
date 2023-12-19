vim.o.syntax = true
vim.cmd [[
filetype plugin indent on
]]

vim.o.autoindent = true
vim.o.smartindent = true

local prefix = vim.env.XDG_CONFIG_HOME or vim.fn.expand("~/.config")

vim.opt.undodir = { prefix .. "/nvim/.undo//" }
vim.opt.backupdir = { prefix .. "/nvim/.backup//" }
vim.opt.directory = { prefix .. "/nvim/.swap//" }

vim.g.filetype = 'on'

-- " stop Vim from beeping all the time
vim.g.vb = true

-- Set the behavior of tab
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.smarttab = true

-- set ruler
vim.o.background = 'dark'

-- "Tell you if you are in insert mode
vim.o.showmode = true

-- "See where you've been
vim.o.showcmd = true

-- "match parenthesis, i.e. ) with (and } with {
vim.o.showmatch = true

-- "ignore case when doing searches
vim.g.ignorecase = true
vim.g.smartcase = true

-- "tell you how many lines have been changed
vim.g.report = 0

vim.o.scrolloff = 5
vim.o.wildmode = 'longest'
vim.o.incsearch = true
vim.o.hlsearch = true

-- set showtabline=2
vim.o.relativenumber = true
vim.o.number = true

--
-- Remaps
--

-- Insert mode

vim.keymap.set('i', 'jj', '<Esc>')
vim.keymap.set('i', 'jk', '<Esc>')

-- Normal mode

-- " move between vim panes
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')

-- -- Leader maps
vim.g.mapleader = ' '
vim.g.timeoutlen = 500

vim.keymap.set('n', '<leader>h', ':noh<CR>')
vim.keymap.set('n', '<leader>s', '1z=')
vim.keymap.set('n', '<leader>rr', ':luafile ~/.config/nvim/init.lua<CR>')
vim.keymap.set('n', '<leader>y', '"+y')
vim.keymap.set('v', '<leader>y', '"+y')
vim.keymap.set('n', '<leader>ll', ':set nonumber norelativenumber<CR>')
vim.keymap.set('n', '<leader>lL', ':set number relativenumber<CR>')

-- " Pandoc build
-- autocmd FileType markdown map <leader>cc :!f=%; pandoc -o ${f/md/pdf} $f<CR>
--
-- autocmd FileType markdown map <leader>od :!f=%; open ${f/md/pdf}<CR><ESC>

local augroup = vim.api.nvim_create_augroup('austins_group', { clear = true })

-- Do C-style auto indentation on C/C++/Perl files only :)
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'c,cpp,perl',
  group = augroup,
  command = ':set cindent'
})

-- Check spelling on text docs
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'md,markdown,tex,txt',
  group = augroup,
  command = ':set spell'
})

-- Trailing whitespace is cringe
vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*',
  group = augroup,
  command = ':%s/\\s\\+$//e'
})

-- -- Golang autoformating
-- vim.api.nvim_create_autocmd('BufWritePre', {
--   pattern = '*.go',
--   group = augroup,
--   command = ':%!gofmt'
-- })
--
-- -- Golang autoformating
-- vim.api.nvim_create_autocmd('BufWritePost', {
--   pattern = '*.rs',
--   group = augroup,
--   command = ":execute \'!cargo fmt -- %\' | edit"
-- })

-- Load plugins
require('lazy_plugs')
require('lualine').setup()

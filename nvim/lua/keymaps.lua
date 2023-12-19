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
-- TODO(ajone239): fix this
vim.keymap.set('n', '<leader>rr', ':luafile ~/.config/nvim/init.lua<CR>')
vim.keymap.set('n', '<leader>y', '"+y')
vim.keymap.set('v', '<leader>y', '"+y')
vim.keymap.set('n', '<leader>ll', ':set nonumber norelativenumber<CR>')
vim.keymap.set('n', '<leader>lL', ':set number relativenumber<CR>')

--
-- Auto Commands
--

local augroup = vim.api.nvim_create_augroup('austins_group', { clear = true })

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

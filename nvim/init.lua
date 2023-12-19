vim.cmd [[
filetype plugin indent on
]]

-- Set options
require('options')

-- Get Keymaps
require('keymaps')

-- Load auto commands
require('auto')

-- Load plugins
require('lazy_plugs')
require('lualine').setup()

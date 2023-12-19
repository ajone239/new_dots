--
-- Lazy Nvim
--

-- But strap
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Use
require("lazy").setup({
  -- the colorscheme should be available when starting Neovim
  {
    "folke/tokyonight.nvim",
    lazy = false,    -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme tokyonight]])
    end,
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  },
  {
    "NoahTheDuke/vim-just",
    ft = just,
  },
  {
    "imsnif/kdl.vim",
    ft = kdl
  },
  { "ggandor/lightspeed.nvim", },
  -- Autocompletion plugin,
  { "hrsh7th/nvim-cmp", },
  -- LSP source for nvim-cmp,
  { "hrsh7th/cmp-nvim-lsp", },
  -- Snippets source for nvim-cmp
  { "saadparwaiz1/cmp_luasnip", },
  -- Snippets plugin
  { "L3MON4D3/LuaSnip", },
  -- LSP Configuration & Plugins
  { "williamboman/mason.nvim", },
  { "williamboman/mason-lspconfig.nvim", },
  {
    "neovim/nvim-lspconfig",
    requires = {
      -- Automatically install LSPs to stdpath for neovim
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      require("plugins.config.lsp")
    end,
  },
  { "tpope/vim-surround", },
  { "tpope/vim-fugitive", },
  { 'nvim-tree/nvim-web-devicons' },
  {
    'nvim-lualine/lualine.nvim',
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    requires = { 'nvim-tree/nvim-web-devicons', opt = true },
    options = { theme = 'iceberg_dark' },
  },
})

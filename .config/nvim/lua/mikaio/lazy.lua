-- This file can be loaded by calling `lua require('plugins')` from your init.vim

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
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

return require('lazy').setup({
  "folke/tokyonight.nvim",
  "sam4llis/nvim-tundra",
  "nvim-lua/plenary.nvim", -- don't forget to add this one if you don't have it yet!
  "ThePrimeagen/harpoon",
  "preservim/nerdtree",
  "christoomey/vim-tmux-navigator",
  "nvim-telescope/telescope.nvim",
  "nvim-telescope/telescope-media-files.nvim",
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "kyazdani42/nvim-web-devicons", lazy = true }
  },
  "akinsho/toggleterm.nvim",

 -- cmp plugins
  "hrsh7th/nvim-cmp", -- The completion plugin
  "hrsh7th/cmp-buffer", -- buffer completions
  "hrsh7th/cmp-path", -- path completions
  "hrsh7th/cmp-cmdline", -- cmdline completions
  "saadparwaiz1/cmp_luasnip", -- snippet completions
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-nvim-lua",

  -- snippets
  "L3MON4D3/LuaSnip", --snippet engine
  "rafamadriz/friendly-snippets", -- a bunch of snippets to use

  -- LSP
  "neovim/nvim-lspconfig", -- enable LSP
  "williamboman/mason.nvim", -- simple to use language server installer
  "williamboman/mason-lspconfig.nvim", -- simple to use language server installer
  "jose-elias-alvarez/null-ls.nvim", -- LSP diagnostics and code actions

  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate"
  },
  "windwp/nvim-autopairs",
  "windwp/nvim-ts-autotag",

  -- comment stuff
  "numToStr/Comment.nvim",
  "JoosepAlviste/nvim-ts-context-commentstring",

  "gbprod/substitute.nvim",

  -- use "tiagofumo/vim-nerdtree-syntax-highlight"
  "johnstef99/vim-nerdtree-syntax-highlight",
  "Xuyuanp/nerdtree-git-plugin",
  "ryanoasis/vim-devicons",
})

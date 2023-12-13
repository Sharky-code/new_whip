-- _L. A. Z. Y._ --

-- Lazy Setup (Copy and Paste from the website) --
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

-- Plugin List --
local plugins = {
  "xiyaowong/transparent.nvim", 
  "folke/tokyonight.nvim",
  "nvim-treesitter/nvim-treesitter"
}
-- Lazy Options --
local opts = {}

-- .Setup() -- 
require("lazy").setup(plugins, opts)

-- 1. _A. E. S. T. H. E. T. I. C. S._ -- 

-- 1.1 Transparent Background Plugin -- 
require("transparent").setup {}

-- _R. U. N. T. I. M. E.  C. O. M. M. A. N. D. S_ --

vim.cmd(":TransparentEnable")
vim.cmd(":color tokyonight")

-- require("lua/lsp")
require("lua/color")

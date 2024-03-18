local fn, g, loop, opt = vim.fn, vim.g, vim.loop, vim.opt
local lazypath = fn.stdpath("data") .. "/lazy/lazy.nvim"

g.mapleader = " "

if not loop.fs_stat(lazypath) then
  fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")
require("set")

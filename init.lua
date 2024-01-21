-- Bootstrap lazy vim
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

-- Install plugins
require("lazy").setup({
  require "plugins.nvim-luasnip",
  require "plugins.nvim-autopairs",
  require "plugins.nvim-cmp",
  require "plugins.nvim-treesitter",
  require "plugins.nvim-comment",
  require "plugins.nvim-telescope",
  require "plugins.nvim-project",
  require "plugins.nvim-tree",
  require "plugins.nvim-keymaps",
  require "plugins.nvim-vscode-colorscheme",
})

require "lsp"
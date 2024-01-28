-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("config.settings")
require("config.keymaps")
require("config.autocommands")
require("config.lazy") -- Bootstrap lazy vim and import plugins

-- setup leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "


-- setup space and tabs
vim.cmd.expandtab = true
vim.cmd.tabstop = 2
vim.cmd.softtabstop = 2
vim.cmd.shiftwidht = 2



-- bootstrap lazy.nvim and plugins
require("config.lazy")
require("config.settings")

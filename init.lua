-- setup leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- bootstrap lazy.nvim and plugins
require("neovim.config.core")
require("neovim.config.lazy")
require("neovim.config.keymaps")

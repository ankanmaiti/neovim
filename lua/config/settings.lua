
-- setup color scheme
vim.cmd[[colorscheme tokyonight-moon]]

-- setup copy color
vim.cmd([[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank({higroup='Search', timeout=250})
  augroup END
]])



-- ************************************* Keymaps ********************************
-- ~/.config/nvim/lua/settings/init.lua
require("keymaps.harpoon")
require("keymaps.telescope")
require("keymaps.neo-tree")

return {
  {
		"catppuccin/nvim",
		lazy = false,
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				cusotm_highlights = function(colors)
					return { netrwTreeBar = { fg = colors.surface0 } }
				end,
			})

			vim.cmd.colorscheme("catppuccin")
		end,
	},
	-- {
	-- 	"folke/tokyonight.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		vim.cmd([[colorscheme tokyonight-moon]])
	-- 	end,
	-- },
}

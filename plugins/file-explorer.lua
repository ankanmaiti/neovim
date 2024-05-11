return {
	{
		"nvim-tree/nvim-tree.lua",
		event = "VeryLazy",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			-- disable netrw at the very start of your init.lua
			vim.g.loaded_netrw = 1
			vim.g.loaded_netrwPlugin = 1

			-- optionally enable 24-bit colour
			vim.opt.termguicolors = true

			require("nvim-tree").setup({
				view = {
					width = 40,
					relativenumber = true,
				},
				-- setup icons
				renderer = {
					indent_markers = {
						enable = true,
						inline_arrows = true,
						icons = {
							corner = "└",
							edge = "▏",
							item = "│",
							bottom = "─",
							none = " ",
						},
					},
					icons = {
						glyphs = {
							folder = {
								arrow_closed = "+",
								arrow_open = "-",
							},
						},
					},
				},
				-- disable window_picker
				-- for explorer to work well
				-- with window split
				actions = {
					open_file = {
						window_picker = {
							enable = false,
						},
					},
				},
				filters = {
					custom = { ".DS_Store" },
				},
				git = {
					ignore = false,
				},
			})

			--setup keymap
			local keyopts = { noremap = true, silent = true }

			keyopts.desc = "File Explorer"
			vim.keymap.set("n", "<leader>e", ":NvimTreeFindFileToggle<cr>", keyopts)
		end,
	},
	{
		"stevearc/oil.nvim",
		event = "VeryLazy",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			keymaps = {
				["<esc>"] = "actions.close",
			},
		},
		init = function()
			--setup keymap
			local keyopts = { noremap = true, silent = true }

			keyopts.desc = "Open parent directory"
			vim.keymap.set("n", "-", ":Oil --float<cr>", keyopts)
		end,
	},
}

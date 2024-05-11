return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		event = "VeryLazy",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
			"3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
		},
		opts = {
			view = {
				relativenumber = true,
			},
			filesystem = {
				follow_current_file = {
					enabled = true,
					leave_dirs_open = true,
				},
			},
			window = {
				position = "left",
				width = 40,
				mappings = {
					["p"] = {
						"toggle_preview",
						config = {
							use_float = false,
							use_image_nvim = true,
						},
					},
				},
			},
		},
		init = function()
			--setup keymap
			local opts = { noremap = true, silent = true }

			opts.desc = "File Explorer"
			vim.keymap.set("n", "<leader>e", ":Neotree filesystem toggle left<cr>", opts)
		end,
	},
}

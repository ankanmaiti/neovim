return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		event = "VeryLazy",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
			--"3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
		},
		opts = {
			event_handlers = {
				{
					event = "neo_tree_buffer_enter",
					handler = function()
						vim.cmd([[
              setlocal relativenumber
            ]])
					end,
				},
			},
		},
		init = function()
			--setup keymap
			local keyopts = { noremap = true, silent = true }

			keyopts.desc = "File Explorer"
			vim.keymap.set("n", "<leader>e", ":Neotree toggle<cr>", keyopts)
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

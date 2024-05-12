return {
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			"nvim-tree/nvim-web-devicons",
		},

		config = function()
			local telescope = require("telescope")
			local actions = require("telescope.actions")

			telescope.setup({
				defaults = {
					file_ignore_patterns = { "node_modules", ".git" },
					mappings = {
						i = {
							["<C-k>"] = actions.move_selection_previous, -- move to prev result
							["<C-j>"] = actions.move_selection_next, -- move to next result
							["<S-tab>"] = actions.move_selection_previous, -- move to prev result
							["<tab>"] = actions.move_selection_next, -- move to next result
							["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
						},
					},
				},
			})

			telescope.load_extension("fzf")

			-- set keymaps
			local keymap = vim.keymap -- for concisness
			local keyopts = { noremap = true, silent = true }

			keyopts.desc = "Find Files (cwd)"
			keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", keyopts)

			keyopts.desc = "Find Recent Files"
			keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", keyopts)

			keyopts.desc = "Live Grep (cwd)"
			keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", keyopts)

			keyopts.desc = "Live Grep (selected string) (cwd)"
			keymap.set("v", "<leader>fs", "<cmd>Telescope grep_string<cr>", keyopts)

			keyopts.desc = "Find Buffers"
			keymap.set("n", "<leader>fb", ":Telescope buffers<cr>", keyopts)

		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			-- To get ui-select loaded and working with telescope, you need to call
			-- load_extension, somewhere after setup function:
			require("telescope").load_extension("ui-select")
		end,
	},
}

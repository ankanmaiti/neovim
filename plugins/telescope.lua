return {
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"AckslD/nvim-neoclip.lua",
			"folke/noice.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			{ "nvim-telescope/telescope-live-grep-args.nvim", version = "^1.0.0" },
			{ "nvim-telescope/telescope-ui-select.nvim" },
			{ "nvim-telescope/telescope-frecency.nvim" },
		},

		config = function()
			local telescope = require("telescope")
			local actions = require("telescope.actions")

			telescope.setup({
				defaults = {
					file_ignore_patterns = { "node_modules", ".git", "vendor" },
					mappings = {
						i = {
							["<C-k>"] = actions.move_selection_previous, -- move to prev result
							["<C-j>"] = actions.move_selection_next, -- move to next result
							-- freeze the current list and start a fuzzy search in the frozen list
							["<C-space>"] = actions.to_fuzzy_refine,
							-- ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
						},
					},
				},
				extensions = {
					frecency = {
						show_filter_column = false,
						show_scores = true,
						show_unindexed = true,
						auto_validate = true,
						db_validate_threshold = 10,
						db_safe_mode = true,

						ignore_patterns = {
							"*/.git",
							"*/.git/*",
							"*/.DS_Store",
							"*/vendor/*",
							"*/node_modules/*",
						},
					},
				},
			})

			-- telescope load extensions
			telescope.load_extension("fzf")
			telescope.load_extension("live_grep_args")
			telescope.load_extension("ui-select")
			telescope.load_extension("frecency")
			telescope.load_extension("noice")

			-- set keymaps
			local keymap = vim.keymap -- for concisness
			local keyopts = { noremap = true, silent = true }

			keyopts.desc = "Find Files (cwd)"
			keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", keyopts)
			keymap.set("n", "<C-p>", ":Telescope frecency workspace=CWD<cr>", keyopts)

			keyopts.desc = "Find Recent Files"
			keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", keyopts)

			keyopts.desc = "Live Grep (cwd)"
			keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep_args<cr>", keyopts)

			keyopts.desc = "Live Grep (selected string) (cwd)"
			keymap.set({ "n", "v" }, "<leader>fs", "<cmd>Telescope grep_string<cr>", keyopts)

			keyopts.desc = "Find Buffers"
			keymap.set("n", "<leader>fb", ":Telescope buffers<cr>", keyopts)

			keyopts.desc = "Find Quickfix"
			keymap.set("n", "<leader>fq", ":Telescope quickfix<cr>", keyopts)
			keymap.set("n", "<leader>cq", ":Telescope quickfix<cr>", keyopts)

			keyopts.desc = "Find Keymaps"
			vim.keymap.set("n", "<leader>fk", ":Telescope keymaps<cr>", keyopts)
		end,
	},
}

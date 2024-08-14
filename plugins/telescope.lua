return {
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"folke/noice.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			{ "nvim-telescope/telescope-live-grep-args.nvim", version = "*" },
			{ "nvim-telescope/telescope-ui-select.nvim" },
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
			})

			-- telescope load extensions
			telescope.load_extension("fzf")
			telescope.load_extension("live_grep_args")
			telescope.load_extension("ui-select")
			telescope.load_extension("noice")

			-- set keymaps
			local keymap = vim.keymap -- for concisness
			local keyopts = { noremap = true, silent = true }

			keyopts.desc = "Files (cwd)" -- Find files
			keymap.set("n", "<leader>ff", ":Telescope find_files<cr>", keyopts)

			keyopts.desc = "Recent Files" -- Find Recent Files
			keymap.set("n", "<leader>fr", ":Telescope oldfiles cwd_only=true<cr>", keyopts)

			keyopts.desc = "Live Grep (cwd)" -- Find Live Grep
			keymap.set("n", "<leader>fg", ":Telescope live_grep_args theme=dropdown<cr>", keyopts)

			keyopts.desc = "Buffers" -- Find Buffers
			keymap.set("n", "<leader>fb", ":Telescope buffers<cr>", keyopts)

			keyopts.desc = "Quickfix" -- Find Quickfix
			keymap.set("n", "<leader>fq", ":Telescope quickfix<cr>", keyopts)
			keymap.set("n", "<leader>cq", ":Telescope quickfix<cr>", keyopts)

			keyopts.desc = "Marks" -- Find Glbal Marks
			keymap.set("n", "<leader>fm", ":Telescope marks mark_type=global<cr>", keyopts)

			keyopts.desc = "Keymaps" -- Find Keymaps
			keymap.set("n", "<leader>fk", ":Telescope keymaps<cr>", keyopts)
		end,
	},
}

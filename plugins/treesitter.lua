return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
		opts = {
			highlight = { enable = true, additional_vim_regex_highlighting = false },
			indent = { enable = true },
			ensure_installed = {
				"html",
				"javascript",
				"json",
				"lua",
				"markdown",
				"tsx",
				"typescript",
				"vim",
				"yaml",
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-space>",
					node_incremental = "<C-space>",
					scope_incremental = false,
					node_decremental = "<C-S-space>",
				},
			},
		},

		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
	{
		"nvim-treesitter/playground",

		config = function()
			--setup keymap
			local opts = { noremap = true, silent = true }

			opts.desc = "Treesitter Playground"
			vim.keymap.set("n", "<leader>cpt", ":TSPlaygroundToggle<cr>", opts)

			opts.desc = "Inspect Tree"
			vim.keymap.set("n", "<leader>cpi", ":InspectTree<cr>", opts)
		end,
	},
}

return {
	"Wansmer/treesj",
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	event = "VeryLazy",
	config = function()
		require("treesj").setup({
			use_default_keymaps = false,
		})

		-- setup keymaps
		local opts = { noremap = true, silent = true }

		opts.desc = "Split code block (toggle)"
		vim.keymap.set({'n', 'v'}, '<leader>s', ':lua require("treesj").toggle()<cr>', opts)
		vim.keymap.set({ "n", "v" }, "<leader>cs", ':lua require("treesj").toggle()<cr>', opts)
	end,
}

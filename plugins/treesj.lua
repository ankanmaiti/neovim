return {
	"Wansmer/treesj",
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	event = "VeryLazy",
	config = function()
		require("treesj").setup({
			use_default_keymaps = false,
		})

		-- setup keymaps
		local keyopts = { noremap = true, silent = true }

		keyopts.desc = "Split code block (toggle)"
		-- vim.keymap.set({ 'n', 'v' }, '<leader>s', ':lua require("treesj").toggle()<cr>', keyopts)
		vim.keymap.set( "n", "<leader>cs", ':lua require("treesj").toggle()<cr>', keyopts)
	end,
}

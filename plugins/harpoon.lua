return {
	"ThePrimeagen/harpoon",
	event = "VeryLazy",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},

	config = function()
		local harpoon = require("harpoon")
		harpoon.setup()

		-- setup harpoon with telescope
		require("telescope").load_extension("harpoon")

		-- setup keymaps
		local opts = { noremap = true, silent = true }

		opts.desc = "harpoon menu"
		vim.keymap.set("n", "<leader>hh", ":Telescope harpoon marks<cr>", opts)

		opts.desc = "add mark"
		vim.keymap.set("n", "<leader>ha", require("harpoon.mark").add_file, opts)

		opts.desc = "prev mark"
		vim.keymap.set("n", "<leader>hp", require("harpoon.ui").nav_prev, opts)

		opts.desc = "next mark"
		vim.keymap.set("n", "<leader>hn", require("harpoon.ui").nav_next, opts)

		opts.desc = "harpoon menu"
		vim.keymap.set("n", "<leader>hm", require("harpoon.ui").toggle_quick_menu, opts)
		vim.keymap.set("n", "<leader><leader>", require("harpoon.ui").toggle_quick_menu, opts)
	end,
}

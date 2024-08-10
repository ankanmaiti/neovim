return {
	"folke/todo-comments.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },

	config = function()
		local todo = require("todo-comments")

		todo.setup({})

		-- setup keymap
		local opts = { noremap = true, silent = true }

		opts.desc = "Find Todos"
		vim.keymap.set("n", "<leader>ft", ":TodoTelescope<cr>", opts)

		opts.desc = "Jump next todo"
		vim.keymap.set("n", "]t", todo.jump_next, opts)

		opts.desc = "Jump previous todo"
		vim.keymap.set("n", "[t", todo.jump_prev, opts)
	end,
}

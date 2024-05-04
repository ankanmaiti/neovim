return {
	"christoomey/vim-tmux-navigator",

	config = function()
		local opts = { noremap = true, silent = true }

    opts.desc = "tmux navigation"
		vim.keymap.set("n", "<c-h>", ":TmuxNavigateLeft<CR>", opts)
		vim.keymap.set("n", "<c-j>", ":TmuxNavigateDown<CR>", opts)
		vim.keymap.set("n", "<c-k>", ":TmuxNavigateUp<CR>", opts)
		vim.keymap.set("n", "<c-l>", ":TmuxNavigateRight<CR>", opts)
	end,
}


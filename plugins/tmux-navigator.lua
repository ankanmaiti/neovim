return {
	"christoomey/vim-tmux-navigator",

	config = function()
		local keyopts = { noremap = true, silent = true }

    keyopts.desc = "tmux navigation"
		vim.keymap.set("n", "<c-h>", ":TmuxNavigateLeft<CR>", keyopts)
		vim.keymap.set("n", "<c-j>", ":TmuxNavigateDown<CR>", keyopts)
		vim.keymap.set("n", "<c-k>", ":TmuxNavigateUp<CR>", keyopts)
		vim.keymap.set("n", "<c-l>", ":TmuxNavigateRight<CR>", keyopts)
	end,
}


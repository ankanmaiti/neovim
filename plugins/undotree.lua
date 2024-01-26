return {
	"mbbill/undotree",
	config = function()
		local opts = { noremap = true, silent = true }

		opts.desc = "Undo Tree"
		vim.keymap.set("n", "<leader>cu", ":UndotreeToggle<cr>", opts)
	end,
}

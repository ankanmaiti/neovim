return {
	-- install without yarn or npm
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
		config = function()
			-- setup keybindings
			local keyopts = { noremap = true, silent = true }

			keyopts.desc = "Markdown Preview (toggle)"
			vim.keymap.set("n", "<leader>cp", ":MarkdownPreviewToggle<CR>", keyopts)
		end,
	},
}

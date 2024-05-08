return {
	"kevinhwang91/nvim-ufo",
	event = "VeryLazy",
	dependencies = {
		"kevinhwang91/promise-async",
	},

	config = function()
		require("ufo").setup({
			provider_selector = function(bufnr, filetype, buftype)
				return { "lsp", "indent" }
			end,
		})

		-- setup code-folding in neovim
		vim.o.foldenable = true
		vim.o.foldlevel = 99
		vim.o.foldlevelstart = 99

		-- remap bingings
		local opts = { noremap = true, silent = true }

		opts.desc = "Open all folds"
		vim.keymap.set("n", "zR", require("ufo").openAllFolds, opts)

		opts.desc = "Close all folds"
		vim.keymap.set("n", "zM", require("ufo").closeAllFolds, opts)

		opts.desc = "Peek Fold"
		vim.keymap.set("n", "zk", function()
			local winid = require("ufo").peekFoldedLinesUnderCursor()
			if not winid then
				vim.lsp.buf.hover()
			end
		end, opts)
	end,
}

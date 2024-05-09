return {
	-- git signes
	{
		"lewis6991/gitsigns.nvim",
		event = "VeryLazy",

		config = function()
			local gitsigns = require("gitsigns")

			gitsigns.setup()

			-- setup keymaps
			local opts = { noremap = true, silent = true }

			opts.desc = "preview hunk"
			vim.keymap.set("n", "<leader>gp", gitsigns.preview_hunk, opts)

			opts.desc = "line blame"
			vim.keymap.set("n", "<leader>gl", gitsigns.toggle_current_line_blame, opts)
		end,
	},
  -- run git command in neovim
  {
    'tpope/vim-fugitive',

    config = function ()
      
			-- setup keymaps
			local opts = { noremap = true, silent = true }

			opts.desc = "Blame History"
			vim.keymap.set("n", "<leader>gb", ':Git blame<CR>', opts)
    end
  }
}

return {
	{
		"tpope/vim-dadbod",
		event = "VeryLazy",
	},
	{
		"kristijanhusak/vim-dadbod-ui",
		event = "VeryLazy",
		cmd = {
			"DBUI",
			"DBUIToggle",
			"DBUIAddConnection",
			"DBUIFindBuffer",
		},
		init = function()
			-- Your DBUI configuration
			vim.g.db_ui_use_nerd_fonts = 1
		end,
	},
	{
		"kristijanhusak/vim-dadbod-completion",
		event = "VeryLazy",
		ft = { "sql", "mysql", "postgresql", "mongodb" },

		dependencies = {
			"hrsh7th/nvim-cmp",
		},

		config = function()
			-- Define a local function db_completion()
			-- to set up completion for vim-dadbod-completion with nvim-cmp.
			local function db_completion()
				require("cmp").setup.buffer({ sources = { { name = "vim-dadbod-completion" } } })
			end

			-- Create an autocmd for FileType event to set the omnifunc for db filetypes.
			-- This autocmd sets the omnifunc option to use vim_dadbod_completion#omni for db files.
			vim.api.nvim_create_autocmd("FileType", {
				pattern = {
					"sql",
					"mysql",
					"postgresql",
				},
				command = [[setlocal omnifunc=vim_dadbod_completion#omni]],
			})

			-- an autocmd for FileType event to trigger db_completion()
			-- for resepective db filetypes.
			vim.api.nvim_create_autocmd("FileType", {
				pattern = {
					"sql",
					"mysql",
					"postgresql",
				},
				callback = function()
					vim.schedule(db_completion)
				end,
			})
		end,
	},
}

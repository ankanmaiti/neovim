return {
	"nvim-treesitter/nvim-treesitter-textobjects",
	event = "VeryLazy",
	dependencies = { "nvim-treesitter/nvim-treesitter" },

	config = function()
		require("nvim-treesitter.configs").setup({
			textobjects = {
				select = {
					enable = true,
					lookahed = true,

					keymaps = {

						["ap"] = { query = "@parameter.outer", { desc = "outer parameter" } },
						["ip"] = { query = "@parameter.inner", { desc = "inner parameter" } },

						["af"] = { query = "@function.outer", { desc = "outer function" } },
						["if"] = { query = "@function.inner", { desc = "inner function" } },

						["am"] = { query = "@call.outer", { desc = "outer function call" } },
						["im"] = { query = "@call.inner", { desc = "inner function call" } },

						["ac"] = { query = "@class.outer", { desc = "outer class" } },
						["ic"] = { query = "@class.inner", { desc = "inner class" } },

						["ai"] = { query = "@conditional.outer", { desc = "outer conditional" } },
						["ii"] = { query = "@conditional.inner", { desc = "inner conditional" } },

						["al"] = { query = "@loop.outer", { desc = "outer loop" } },
						["il"] = { query = "@loop.inner", { desc = "inner loop" } },
					},
				},

				move = {
					enable = true,
					set_jumps = true,
					goto_next_start = {
						["np"] = { query = "@parameter.outer", { desc = "Next parameter" } },
						["nf"] = { query = "@function.outer", { desc = "Next function" } },
						["nm"] = { query = "@call.outer", { desc = "Next function call" } },
						["nc"] = { query = "@class.outer", { desc = "Next class" } },
						["ni"] = { query = "@conditional.outer", { desc = "Next conditional" } },
						["nl"] = { query = "@loop.outer", { desc = "Next loop" } },
					},
					goto_previous_start = {
						["Np"] = { query = "@parameter.outer", { desc = "Prev parameter" } },
						["Nf"] = { query = "@function.outer", { desc = "Prev function" } },
						["Nm"] = { query = "@call.outer", { desc = "Prev function call" } },
						["Nc"] = { query = "@class.outer", { desc = "Prev class" } },
						["Ni"] = { query = "@conditional.outer", { desc = "Prev conditional" } },
						["Nl"] = { query = "@loop.outer", { desc = "Prev loop" } },
					},
				},
			},
		})
	end,
}

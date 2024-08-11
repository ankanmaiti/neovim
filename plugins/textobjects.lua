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
						["]p"] = { query = "@parameter.outer", desc = "Next parameter" },
						["]f"] = { query = "@function.outer", desc = "Next function" },
						["]m"] = { query = "@call.outer", desc = "Next function call" },
						["]c"] = { query = "@class.outer", desc = "Next class" },
						["]i"] = { query = "@conditional.outer", desc = "Next conditional" },
						["]l"] = { query = "@loop.outer", desc = "Next loop" },
					},
					goto_previous_start = {
						["[p"] = { query = "@parameter.outer", desc = "Prev parameter" },
						["[f"] = { query = "@function.outer", desc = "Prev function" },
						["[m"] = { query = "@call.outer", desc = "Prev function call" },
						["[c"] = { query = "@class.outer", desc = "Prev class" },
						["[i"] = { query = "@conditional.outer", desc = "Prev conditional" },
						["[l"] = { query = "@loop.outer", desc = "Prev loop" },
					},
				},
			},
		})
	end,
}

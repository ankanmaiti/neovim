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

						["ap"] = { query = "@parameter.outer", desc = "outer parameter" },
						["ip"] = { query = "@parameter.inner", desc = "inner parameter" },

						["af"] = { query = "@function.outer", desc = "outer function" },
						["if"] = { query = "@function.inner", desc = "inner function" },

						["ac"] = { query = "@call.outer", desc = "outer function call" },
						["ic"] = { query = "@call.inner", desc = "inner function call" },

						["ai"] = { query = "@conditional.outer", desc = "outer conditional" },
						["ii"] = { query = "@conditional.inner", desc = "inner conditional" },

						["al"] = { query = "@loop.outer", desc = "outer loop" },
						["il"] = { query = "@loop.inner", desc = "inner loop" },

						["ar"] = { query = "@return.outer", desc = "outer return statement" },
						["ir"] = { query = "@return.inner", desc = "inner return statement" },
					},
				},

				move = {
					enable = true,
					set_jumps = true,
					goto_next_start = {
						["]a"] = { query = "@assignment.outer", desc = "assignment" },
						["]p"] = { query = "@parameter.outer", desc = "parameter" },
						["]f"] = { query = "@function.outer", desc = "function" },
						["]c"] = { query = "@call.outer", desc = "function call" },
						["]i"] = { query = "@conditional.outer", desc = "conditional" },
						["]l"] = { query = "@loop.outer", desc = "loop" },
					},
					goto_previous_start = {
						["[a"] = { query = "@assignment.outer", desc = "assignment" },
						["[p"] = { query = "@parameter.outer", desc = "parameter" },
						["[f"] = { query = "@function.outer", desc = "function" },
						["[c"] = { query = "@call.outer", desc = "function call" },
						["[i"] = { query = "@conditional.outer", desc = "conditional" },
						["[l"] = { query = "@loop.outer", desc = "loop" },
					},
				},
			},
		})
	end,
}

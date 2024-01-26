return {
  "nvim-treesitter/nvim-treesitter-textobjects",
  lazy=true,

  config = function ()
    require("nvim-treesitter.configs").setup({
      textobjects = {
        select={
          enable=true,
          lookahed=true,

          keymaps = {
            ["aa"] = { query="@assignment.outer", {desc="Select outer part of an assignment"} },
            ["ia"] = { query="@assignment.inner", {desc="Select inner part of an assignment"} },
            ["la"] = { query="@assignment.lhs", {desc="Select left hand side part of an assignment"} },
            ["ra"] = { query="@assignment.rhs", {desc="Select right hand side part of an assignment"} },

            ["ap"] = { query="@parameter.outer", {desc="Select outer part of a parameter"} },
            ["ip"] = { query="@parameter.inner", {desc="Select inner part of a parameter"} },

            ["ai"] = { query="@conditional.outer", {desc="Select outer part of a conditional"} },
            ["ii"] = { query="@conditional.inner", {desc="Select inner part of a conditional"} },

            ["al"] = { query="@loop.outer", {desc="Select outer part of a loop"} },
            ["il"] = { query="@loop.inner", {desc="Select inner part of a loop"} },

            ["af"] = { query="@function.outer", {desc="Select outer part of a function definition"} },
            ["if"] = { query="@function.inner", {desc="Select inner part of a function definition"} },

            ["ac"] = { query="@class.outer", {desc="Select outer part of a class definition"} },
            ["ic"] = { query="@class.inner", {desc="Select inner part of a class definition"} },
          }
        },

        swap = {
          enable = true,
          swap_next = {
            ["<leader>np"] = "@parameter.inner",
            ["<leader>nf"] = "@function.outer",
          },
          swap_previous = {
            ["<leader>pp"] = "@parameter.inner",
            ["<leader>pf"] = "@function.outer",
          }
        }
      }
    })
  end,
}

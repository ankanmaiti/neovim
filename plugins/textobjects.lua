return {
  "nvim-treesitter/nvim-treesitter-textobjects",
  lazy = true,
  dependencies = { "nvim-treesitter/nvim-treesitter", },

  config = function()
    require("nvim-treesitter.configs").setup({
      textobjects = {
        select = {
          enable = true,
          lookahed = true,

          keymaps = {
            ["aa"] = { query = "@assignment.outer", { desc = "Select outer part of an assignment" } },
            ["ia"] = { query = "@assignment.inner", { desc = "Select inner part of an assignment" } },
            ["la"] = { query = "@assignment.lhs", { desc = "Select left hand side part of an assignment" } },
            ["ra"] = { query = "@assignment.rhs", { desc = "Select right hand side part of an assignment" } },

            ["ap"] = { query = "@parameter.outer", { desc = "Select outer part of a parameter" } },
            ["ip"] = { query = "@parameter.inner", { desc = "Select inner part of a parameter" } },

            ["ai"] = { query = "@conditional.outer", { desc = "Select outer part of a conditional" } },
            ["ii"] = { query = "@conditional.inner", { desc = "Select inner part of a conditional" } },

            ["al"] = { query = "@loop.outer", { desc = "Select outer part of a loop" } },
            ["il"] = { query = "@loop.inner", { desc = "Select inner part of a loop" } },

            ["af"] = { query = "@function.outer", { desc = "Select outer part of a function definition" } },
            ["if"] = { query = "@function.inner", { desc = "Select inner part of a function definition" } },

            ["ac"] = { query = "@class.outer", { desc = "Select outer part of a class definition" } },
            ["ic"] = { query = "@class.inner", { desc = "Select inner part of a class definition" } },
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
        },

        move = {
          enable = true,
          set_jumps = true,
          goto_next_start = {
            ["]f"] = { query = "@function.outer", { desc = "Next function start" } },
            ["]c"] = { query = "@class.outer", { desc = "Next class start" } },
            ["]i"] = { query = "@conditional.outer", { desc = "Next conditional start" } },
            ["]l"] = { query = "@loop.outer", { desc = "Next loop start" } },

            ["]s"] = { query = "@scope", query_group = "locals", desc = "Next Scope" },
          },
          goto_next_end = {
            ["]F"] = { query = "@function.outer", { desc = "Next function end" } },
            ["]C"] = { query = "@class.outer", { desc = "Next class end" } },
            ["]I"] = { query = "@conditional.outer", { desc = "Next conditional end" } },
            ["]L"] = { query = "@loop.outer", { desc = "Next loop end" } },
          },
          goto_previous_start = {
            ["[f"] = { query = "@function.outer", { desc = "Prev function start" } },
            ["[c"] = { query = "@class.outer", { desc = "Prev class start" } },
            ["[i"] = { query = "@conditional.outer", { desc = "Prev conditional start" } },
            ["[l"] = { query = "@loop.outer", { desc = "Prev loop start" } },
          },
          goto_previous_end = {
            ["[F"] = { query = "@function.outer", { desc = "Prev function end" } },
            ["[C"] = { query = "@class.outer", { desc = "Prev class end" } },
            ["[I"] = { query = "@conditional.outer", { desc = "Prev conditional end" } },
            ["[L"] = { query = "@loop.outer", { desc = "Prev loop end" } },
          },
        },
      }
    })

    local ts_repeat_move = require("nvim-treesitter.textobjects.repeatable_move")

    -- vim way: goes to the direction you were moving.
    vim.keymap.set({ 'n', 'x', 'o' }, ';', ts_repeat_move.repeat_last_move)
    vim.keymap.set({ 'n', 'x', 'o' }, ';', ts_repeat_move.repeat_last_move_opposite)

    -- Optionally, make builtin f, F, t, T also repeatable with ; and ,
    vim.keymap.set({ 'n', 'x', 'o' }, ';', ts_repeat_move.builtin_f)
    vim.keymap.set({ 'n', 'x', 'o' }, ';', ts_repeat_move.builtin_F)
    vim.keymap.set({ 'n', 'x', 'o' }, ';', ts_repeat_move.builtin_t)
    vim.keymap.set({ 'n', 'x', 'o' }, ';', ts_repeat_move.builtin_T)
  end,
}

return {
  "folke/trouble.nvim",
  event = "VeryLazy",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  cmd = { "TroubleToggle", "Trouble" },

  config = function()
    local trouble = require("trouble")
    trouble.setup({
      signs = { error = "󰅚 ", warn = "󰀪 ", hint = "󰌶 ",information = "", other = "", },
      use_diagnostic_signs = true,
    })

    -- setup keymap
    local opts = { noremap = true, silent = true }

    opts.desc = "Workspace Diagnostics"
    vim.keymap.set("n", "<leader>xx", ":Trouble diagnostics toggle win.position=right<cr>", opts)
    vim.keymap.set("n", "<leader>cd", ":Trouble diagnostics toggle win.position=right<cr>", opts)

    opts.desc = "Buffer Diagnostics"
    vim.keymap.set("n", "<leader>xb", ":Trouble diagnostics toggle filter.buf=0<cr>", opts)


    opts.desc = "Toggle Quickfix"
    vim.keymap.set("n", "<leader>xq", ":Trouble quickfix<cr>", opts)
  end,
}

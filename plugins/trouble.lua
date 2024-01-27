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
      action_keys = {
        close = { "q", "<esc>" },
        cancel = { "<C-e>" },
      },
    })

    -- setup keymap
    local opts = { noremap = true, silent = true }

    opts.desc = "Document Diagnostics"
    vim.keymap.set("n", "<leader>xx", ":TroubleToggle document_diagnostics<cr>", opts)

    opts.desc = "Workspace Diagnostics"
    vim.keymap.set("n", "<leader>xX", ":TroubleToggle workspace_diagnostics<cr>", opts)

    opts.desc = "Toggle Quickfix"
    vim.keymap.set("n", "<leader>xq", ":TroubleToggle quickfix<cr>", opts)
  end,
}

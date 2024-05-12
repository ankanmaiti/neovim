return {
  "nvimtools/none-ls.nvim",
  event="VeryLazy",
  dependencies = {
    "nvimtools/none-ls-extras.nvim",
  },
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettierd,
        require("none-ls.diagnostics.eslint_d"), -- requires none-ls-extras.nvim
      },
    })
    -- set keymap
    local keyopts = { noremap = true, silent = true }

    keyopts.desc = "Format Code"
    vim.keymap.set({ "n", "v" }, "<leader>cf", vim.lsp.buf.format, keyopts)
  end,
}

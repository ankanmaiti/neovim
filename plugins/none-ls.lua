return {
  "nvimtools/none-ls.nvim",

  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.diagnostics.eslint,
     }
    })
    -- set keymap
    local opts = { noremap = true, silent = true }

    opts.desc = "Format Code"
    vim.keymap.set({ 'n', 'v' }, '<leader>cf', vim.lsp.buf.format, opts)
  end
}

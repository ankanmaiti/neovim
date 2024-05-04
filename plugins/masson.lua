return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local mason_tool_installer = require("mason-tool-installer")

    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    mason_lspconfig.setup({
      ensure_installed = {
        "tsserver",
        "html",
        "cssls",
        "tailwindcss",
        "lua_ls",
        "emmet_ls",
      },

      -- auto-install configured servers (with lspconfig)
      automatic_installation = true, -- not the same as ensure_installed
    })

    -- install mason tool automatic
    mason_tool_installer.setup({
      ensure_installed = {
        "prettier", -- formatter
        "stylua", -- formatter
        "eslint_d", -- js linter
      },
    })

    --set keymaps
    local opts = { noremap = true, silent = true }
    opts.desc = "Mason"
    vim.keymap.set("n", "<leader>cM", ":Mason<cr>", opts)
  end,
}

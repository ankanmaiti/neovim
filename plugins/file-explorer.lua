return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    event = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      --"3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    config = function()
      --setup keymap
      local opts = { noremap = true, silent = true }

      opts.desc = "File Explorer"
      vim.keymap.set("n", "<leader>e", ":Neotree toggle left<cr>", opts)
    end,
  },
}

return {
	{
  "nvim-treesitter/nvim-treesitter",
  version = "*", -- last release is way too old and doesn't work on Windows
  build = ":TSUpdate",
  dependencies={},
  opts = {
	  highlight = { enable = true, additional_vim_regex_highlighting = false },
    indent = { enable = true },
    ensure_installed = {
      "html",
      "javascript",
      "json",
      "lua",
      "markdown",
      "tsx",
      "typescript",
      "vim",
      "yaml",
    },
  },
---@param opts TSConfig
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
  },
{'nvim-treesitter/playground'},
  }

return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },

  config = function ()
    local todo = require("todo-comments")

    todo.setup({})

    -- setup keymap
    local opts = {noremap=true, silent=true}
    
    opts.desc="Jump next todo"
    vim.keymap.set('n', ']t', todo.jump_next, opts)
    
    opts.desc="Jump previous todo"
    vim.keymap.set('n', '[t', todo.jump_next, opts)
  end,
}



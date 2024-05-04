local opts = { noremap = true, silent = true }

-- local wk = require("which-key")

-- wk.register({
--   f = { name = "Find/Files" },
--   b = { name = "Buffers" },
--   c = { name = "Code" },
--   cp = { name = "Playground" },
--   x = { name = "Diagonistics" },
--   n = { name = "Next Jump" },
--   p = { name = "Prev Jump" },
-- }, { mode = "n", prefix = "<leader>" })

-- Navigate buffers
opts.desc = "Next Buffer"
vim.keymap.set("n", "<S-l>", ":bnext<CR>", opts)

opts.desc = "Previous Buffer"
vim.keymap.set("n", "<S-h>", ":bprevious<CR>", opts)

opts.desc = "Delete Buffer"
vim.keymap.set("n", "<leader>bd", ":bd<cr>", opts)

-- Better window navigation
opts.desc = "Windows Navigation"
vim.keymap.set("n", "<C-h>", "<C-w>h", opts)
vim.keymap.set("n", "<C-j>", "<C-w>j", opts)
vim.keymap.set("n", "<C-k>", "<C-w>k", opts)
vim.keymap.set("n", "<C-l>", "<C-w>l", opts)

-- Lazy Package Manager
opts.desc = "Lazy"
vim.keymap.set("n", "<leader>l", ":Lazy<cr>", opts)



-- disable some default keymaps
-- opts.desc = ""
-- vim.keymap.set({ 'v', 'x' }, 's', '<Nop>', opts)

local keyopts = { noremap = true, silent = true }

-- Navigate buffers
keyopts.desc = "Next Buffer"
vim.keymap.set("n", "<S-l>", ":bnext<CR>", keyopts)

keyopts.desc = "Previous Buffer"
vim.keymap.set("n", "<S-h>", ":bprevious<CR>", keyopts)

-- split window vertically
keyopts.desc = "vertical split"
vim.keymap.set({ "n", "v" }, "<leader>wv", ":vsplit<CR>", keyopts)

-- split window horizontally
keyopts.desc = "horizontally split"
vim.keymap.set({ "n", "v" }, "<leader>ws", ":split<CR>", keyopts)

-- close window
keyopts.desc = "close window"
vim.keymap.set({ "n", "v" }, "<leader>wc", ":close<CR>", keyopts)

-- Better window navigation
keyopts.desc = "Windows Navigation"
vim.keymap.set("n", "<C-h>", "<C-w>h", keyopts)
vim.keymap.set("n", "<C-j>", "<C-w>j", keyopts)
vim.keymap.set("n", "<C-k>", "<C-w>k", keyopts)
vim.keymap.set("n", "<C-l>", "<C-w>l", keyopts)


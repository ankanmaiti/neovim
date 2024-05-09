local opts = { noremap = true, silent = true }

-- Navigate buffers
opts.desc = "Next Buffer"
vim.keymap.set("n", "<S-l>", ":bnext<CR>", opts)

opts.desc = "Previous Buffer"
vim.keymap.set("n", "<S-h>", ":bprevious<CR>", opts)

-- opts.desc = "Delete Buffer"
-- vim.keymap.set("n", "<leader>bd", ":bd<cr>", opts)

-- split window vertically
opts.desc = "vertical split"
vim.keymap.set({ "n", "v" }, "<leader>w%", ":vsplit<CR>", opts)
vim.keymap.set({ "n", "v" }, "<leader>wv", ":vsplit<CR>", opts)

-- split window horizontally
opts.desc = "horizontally split"
vim.keymap.set({ "n", "v" }, '<leader>w"', ":split<CR>", opts)
vim.keymap.set({ "n", "v" }, "<leader>wh", ":split<CR>", opts)

-- close window
opts.desc = "close window"
vim.keymap.set({ "n", "v" }, "<leader>wc", ":close<CR>", opts)

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

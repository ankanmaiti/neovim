local opts = {noremap=true, silent=true}

local wk = require("which-key")

wk.register({
    f={ name="Find/Files" },
    b={ name="Buffers" },
    d={ name="Delets" },
    c={ name="Code" }
}, {mode="n", prefix="<leader>", noremap=true, silent=true})



-- Navigate buffers
vim.keymap.set("n", "<S-l>", ":bnext<CR>", opts)
vim.keymap.set("n", "<S-h>", ":bprevious<CR>", opts)

opts.desc = "Delete Buffer"
vim.keymap.set('n', '<leader>bd', ':bd<cr>', opts)
vim.keymap.set('n', '<leader>db', ':bd<cr>', opts)



-- Better window navigation
opts.desc = "Windows Navigation"
vim.keymap.set("n", "<C-h>", "<C-w>h", opts)
vim.keymap.set("n", "<C-j>", "<C-w>j", opts)
vim.keymap.set("n", "<C-k>", "<C-w>k", opts)
vim.keymap.set("n", "<C-l>", "<C-w>l", opts)

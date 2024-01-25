local opts = {noremap=true, silent=true}

-- Shorten function name
local keymap = vim.keymap.set
local wk = require("which-key")


-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- close buffer
keymap('n', '<leader>bd', ':bd<CR>', { desc="Delete Buffer", noremap=true, silent=true })
wk.register({
	b={ "<cmd>bd<cr>", "Delete Buffer" },
}, {mode="n", prefix="<leader>d", name="Delete"})


-- telescope buffers
local builtin = require("telescope.builtin")
wk.register({
	fb={ builtin.buffers, "Find Buffers" },
	bb={ builtin.buffers, "Find Buffers" },
}, { mode="n", prefix="<leader>", noremap=true, silent=true })


-- Neo-tree buffers
wk.register({
	e={ "<cmd>neotree toggle buffers left<cr>", "Buffer Explore (neotree)" }
}, {mode='n', prefix="<leader>b", name="Buffers", tnoremap=true, silent=true })

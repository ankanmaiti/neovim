local wk = require("which-key")


wk.register({
	t={ ":TSPlaygroundToggle<CR>", "Treesitter" }
}, {mode="n", prefix="<leader>p", name="playground"})

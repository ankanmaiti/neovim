local builtin = require("telescope.builtin")

require("which-key").register({
		f={ builtin.find_files, "Find Files (CWD)"},
		w={ builtin.live_grep, "Find Word (Live Grep)" },
		g={ builtin.git_files, "Find Files (Git)" },

}, { mode="n", prefix="<leader>f", name="file/find" })

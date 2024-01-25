local builtin = require("telescope.builtin")

require("which-key").register({
		f={ builtin.find_files, "Find Files (CWD)"},
		w={ builtin.live_grep, "Find Word (Live Grep)" },
		g={ builtin.git_files, "Find Files (Git)" },
	--	b={ builtin.buffers, "Find Buffers" },
		h={ builtin.help_tags, "Find Help Tags" }

}, { mode="n", prefix="<leader>f", name="file/find" })


--require("which-key").register({
--	b={ builtin.buffers, "Find Buffers" },
--}, {mode="n", prefix="<leader>b", name="buffers"})

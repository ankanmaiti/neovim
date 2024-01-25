
require("which-key").register({
	e={"<cmd>Neotree toggle filesystem dir=./ left<cr>", "Neotree Toggle (cwd)"},
	--be={"<cmd>Neotree toggle buffers left<cr>", "Buffer Explorer"}

}, { mode="n", prefix="<leader>" })

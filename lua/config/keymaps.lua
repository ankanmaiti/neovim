local wk = require("which-key")


wk.register({
    f={ name="Find/Files" },
    b={ name="Buffers" },
    d={ name="Delets" },
    c={ name="Code" }
}, {mode="n", prefix="<leader>", noremap=true, silent=true})


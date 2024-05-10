-- LSP: language server protocall
-- is a open json-rpc standard that communicate between code-editor & language-servers
-- which provide language intelegence feature.
--
-- LSP is like a backend for code related stuff
--
return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true }, -- rename files in neotree and effect import statement
	},
	config = function()
		local lspconfig = require("lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		local keymap = vim.keymap
		local opts = { noremap = true, silent = true }

		local on_attach = function(_, bufnr)
			opts.buffer = bufnr

			-- set keybinds

			-- Lookup
			opts.desc = "Show documentation on hover"
			keymap.set("n", "K", vim.lsp.buf.hover, opts)
			-- keymap.set("n", "<leader>cd", vim.lsp.buf.hover, opts)

			-- Go to
			opts.desc = "Go to definitions"
			keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<cr>", opts)

			opts.desc = "Show LSP implementations"
			keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<cr>", opts)

			opts.desc = "Show LSP type definitions"
			keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<cr>", opts)

			opts.desc = "See Code Actions"
			keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

			-- Rename
			opts.desc = "Smart Rename"
			keymap.set({ "n", "v" }, "<leader>cr", vim.lsp.buf.rename, opts)

			-- Diagnostics
			opts.desc = "Show buffer diagnostics"
			keymap.set("n", "<leader>xb", "<cmd>Telescope diagnostics bufnr=0<cr>", opts)

			opts.desc = "Show Line Diagnostics"
			keymap.set("n", "<leader>xl", vim.diagnostic.open_float, opts)
		end

		-- used to enable autocompletion (assign to every lsp server config)
		local capabilities = cmp_nvim_lsp.default_capabilities()

		--change the diagnostic symbols in the sign column (gutter)
		local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		-- configure tsserver server
		lspconfig["tsserver"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			commands = {

				-- organize imports
				OrganizeImports = {
					function()
						local params = {
							command = "_typescript.organizeImports",
							arguments = { vim.api.nvim_buf_get_name(0) },
							title = "",
						}
						vim.lsp.buf.execute_command(params)
					end,
					description = "Organize Imports",
				},
			},
		})

		-- configure css server
		lspconfig["cssls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure tailwindcss server
		lspconfig["tailwindcss"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = {
				"html",
				"javascriptreact",
				"typescriptreact",
			},
		})

		-- configure html server
		lspconfig["html"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure emmet server
		lspconfig["emmet_ls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = { "html", "typescriptreact", "javascriptreact", "css" },
		})

		-- configure lua server
		lspconfig["lua_ls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = {
				Lua = {
					-- make language server recognize "vim" global
					diagnostics = { global = { "vim" } },
					workspace = {
						-- make language server aware of runtime files
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.stdpath("config") .. "/lua"] = true,
						},
					},
				},
			},
		})
	end,
}

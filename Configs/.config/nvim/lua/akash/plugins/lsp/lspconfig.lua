return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "folke/neodev.nvim", opts = {} },
	},
	config = function()
		-- import lspconfig plugin
		local lspconfig = require("lspconfig")

		-- import mason_lspconfig plugin
		local mason_lspconfig = require("mason-lspconfig")

		-- import cmp-nvim-lsp plugin
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		local keymap = vim.keymap -- for conciseness

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				-- Buffer local mappings.
				-- See `:help vim.lsp.*` for documentation on any of the below functions
				local opts = { buffer = ev.buf, silent = true }

				-- set keybinds
				opts.desc = "Show LSP references"
				keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

				opts.desc = "Go to declaration"
				keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

				opts.desc = "Show LSP definitions"
				keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

				opts.desc = "Show LSP implementations"
				keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

				opts.desc = "Show LSP type definitions"
				keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

				opts.desc = "See available code actions"
				keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

				opts.desc = "Smart rename"
				keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

				opts.desc = "Show buffer diagnostics"
				keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

				opts.desc = "Show line diagnostics"
				keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

				opts.desc = "Go to previous diagnostic"
				keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

				opts.desc = "Go to next diagnostic"
				keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

				opts.desc = "Show documentation for what is under cursor"
				keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

				opts.desc = "Restart LSP"
				keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
			end,
		})

		-- used to enable autocompletion (assign to every lsp server config)
		local capabilities = cmp_nvim_lsp.default_capabilities()

		-- Change the Diagnostic symbols in the sign column (gutter)
		-- (not in youtube nvim video)
		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		lspconfig["pylsp"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lspconfig["texlab"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- lspconfig["lua-language-server"].setup({
		--  capabilities = capabilities,
		--  on_attach = on_attach,
		--})
		--
		-- configure verible server
		-- lspconfig["verible"].setup({
		-- capabilities = capabilities,
		-- on_attach = on_attach,
		-- })

		--configure svlangserver server
		-- lspconfig["svlangserver"].setup({
		-- capabilities = capabilities,
		-- on_attach = on_attach,
		-- })

		-- lspconfig["clangd"].setup({
		--   capabilities = capabilities,
		--   on_attach = on_attach,
		-- })
		--
		--
		-- configure ltex server
		-- lspconfig["ltex"].setup({
		-- capabilities = capabilities,
		-- on_attach = on_attach,
		-- })

		lspconfig.ccls.setup({
			init_options = {
				cache = {
					directory = ".ccls-cache",
				},
			},
		})

		local keymap = vim.keymap -- for conciseness
		keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>") -- show definition, references
		keymap.set("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>") -- got to declaration
		keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>") -- see definition and make edits in window
		keymap.set("n", "gi", "<cmd>Lspsaga goto_definition<CR>") -- go to implementation
		keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>") -- see available code actions
		keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>") -- smart rename
		keymap.set("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>") -- show  diagnostics for line
		keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>") -- show diagnostics for cursor
		keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>") -- jump to previous diagnostic in buffer
		keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>") -- jump to next diagnostic in buffer
		keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>") -- show documentation for what is under cursor
		keymap.set("n", "<leader>o", "<cmd>LSoutlineToggle<CR>") -- see outline on right hand side

		-- local util = require "lspconfig/util"
		--
		-- lspconfig.rust_analyzer.setup({
		--   capabilities = capabilities,
		--   on_attach = on_attach,
		--   filetypes = { "rust" },
		--   root_dir = util.root_pattern("Cargo.toml"),
		--   settings = {
		--     ["rust_analyzer"] = {
		--       cargo = {
		--         allFeatures = true,
		--       },
		--     },
		--   },
		-- })
		mason_lspconfig.setup_handlers({
			-- default handler for installed servers
			function(server_name)
				lspconfig[server_name].setup({
					capabilities = capabilities,
				})
			end,
			["svelte"] = function()
				-- configure svelte server
				lspconfig["svelte"].setup({
					capabilities = capabilities,
					on_attach = function(client, bufnr)
						vim.api.nvim_create_autocmd("BufWritePost", {
							pattern = { "*.js", "*.ts" },
							callback = function(ctx)
								-- Here use ctx.match instead of ctx.file
								client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.match })
							end,
						})
					end,
				})
			end,
			["graphql"] = function()
				-- configure graphql language server
				lspconfig["graphql"].setup({
					capabilities = capabilities,
					filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
				})
			end,
			["emmet_ls"] = function()
				-- configure emmet language server
				lspconfig["emmet_ls"].setup({
					capabilities = capabilities,
					filetypes = {
						"html",
						"typescriptreact",
						"javascriptreact",
						"css",
						"sass",
						"scss",
						"less",
						"svelte",
					},
				})
			end,
			["lua_ls"] = function()
				-- configure lua server (with special settings)
				lspconfig["lua_ls"].setup({
					capabilities = capabilities,
					settings = {
						Lua = {
							-- make the language server recognize "vim" global
							diagnostics = {
								globals = { "vim" },
							},
							completion = {
								callSnippet = "Replace",
							},
						},
					},
				})
			end,
		})
	end,
}

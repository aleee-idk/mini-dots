return {
	-- LSP Configuration & Plugins
	"neovim/nvim-lspconfig",
	event = { "BufReadPost", "BufNewFile", "BufWritePre" },
	dependencies = {
		-- Automatically install LSPs to stdpath for neovim
		{ "williamboman/mason.nvim" },
		"williamboman/mason-lspconfig.nvim",
		-- Additional lua configuration, makes nvim stuff amazing!
		{ "folke/neodev.nvim", opts = {} },
	},

	config = function()
		-- LSP settings.
		local on_attach = function(_, bufnr)
			local nmap = function(keys, func, desc)
				if desc then
					desc = "LSP: " .. desc
				end

				vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
			end

			nmap("<leader>lr", vim.lsp.buf.rename, "Rename")
			-- stylua: ignore
			vim.keymap.set({ "n", "x", "v" }, "<leader>la", vim.lsp.buf.code_action, { buffer = bufnr, desc = "Code Action" })
			nmap("<leader>ld", vim.lsp.buf.type_definition, "Go to type definition")
			nmap("<leader>lf", function()
				vim.lsp.buf.format()
			end, "Format")

			nmap("gd", vim.lsp.buf.definition, "Go to definition")
			nmap("gr", require("telescope.builtin").lsp_references, "Goto References")
			nmap("gI", vim.lsp.buf.implementation, "Go to Implementation")

			-- See `:help K` for why this keymap
			nmap("K", vim.lsp.buf.hover, "Hover Documentation")
			-- nmap("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")

			-- Lesser used LSP functionality
			nmap("gD", vim.lsp.buf.declaration, "Goto Declaration")

			nmap("<leader>lj", vim.diagnostic.goto_next, "Go to next diagnostic")
			nmap("<leader>lk", vim.diagnostic.goto_prev, "Go to prev diagnostic")

			-- Create a command `:Format` local to the LSP buffer
			vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
				vim.lsp.buf.format()
			end, { desc = "Format current buffer with LSP" })
		end

		-- Enable the following language servers
		-- To see options and cofigurations: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
		local servers = {
			astro = {},
			bashls = {},
			cssls = {},
			dockerls = {},
			emmet_ls = {},
			html = {},
			marksman = {},
			pyright = {},
			phpactor = {},
			gopls = {
				settings = {
					gopls = {
						completeUnimported = true,
						usePlaceholders = true,
						analyses = {
							unusedparams = true,
						},
					},
				},
			},
			rust_analyzer = {
				settings = {
					["rust-analyzer"] = {
						imports = {
							granularity = {
								group = "module",
							},
							prefix = "self",
						},
						cargo = {
							buildScripts = {
								enable = true,
							},
						},
						procMacro = {
							enable = true,
						},
					},
				},
			},
			sqlls = {},
			yamlls = {},
			tsserver = {
				init_options = {
					preferences = {
						disableSuggestions = true,
					},
				},
			},
			lua_ls = {
				settings = {
					Lua = {
						runtime = {
							-- Tell the language server which version of Lua you're using
							-- (most likely LuaJIT in the case of Neovim)
							version = "LuaJIT",
						},
						-- Make the server aware of Neovim runtime files
						workspace = {
							checkThirdParty = false,
							library = {
								vim.env.VIMRUNTIME,
								-- "${3rd}/luv/library"
								-- "${3rd}/busted/library",
							},
						},
					},
				},
			},
		}

		-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

		-- Ensure the servers above are installed
		local mason_lspconfig = require("mason-lspconfig")

		mason_lspconfig.setup({
			ensure_installed = vim.tbl_keys(servers),
		})

		mason_lspconfig.setup_handlers({
			function(server_name)
				local _border = "single"

				local default_config = {
					capabilities = capabilities,
					on_attach = on_attach,
					handlers = {
						["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
							border = _border,
						}),
						["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
							border = _border,
						}),
					},
				}

				require("lspconfig")[server_name].setup(
					vim.tbl_deep_extend("force", default_config, servers[server_name] or {})
				)
			end,
		})

		vim.diagnostic.config({
			underline = true,
			update_in_insert = false,
			virtual_text = false,
			-- virtual_text = {
			-- 	spacing = 1,
			-- 	source = "if_many",
			-- 	prefix = " ●",
			-- 	suffix = " ",
			-- 	-- this will set set the prefix to a function that returns the diagnostics icon based on the severity
			-- 	-- this only works on a recent 0.10.0 build. Will be set to "●" when not supported
			-- 	-- prefix = "icons",
			-- },
			severity_sort = true,
		})

		-- Customize gutter icons
		local signs = require("aleidk.constants").icons.diagnostics
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
		end
	end,
}

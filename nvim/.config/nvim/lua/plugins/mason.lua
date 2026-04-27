-- ~/.config/nvim/lua/plugins/mason.lua
-- Mason + LSP + Formatting configuration for Neovim 0.11+
-- Stack: Node.js, TypeScript, React, Kubernetes, Docker, Helm
-- Uses the new vim.lsp.config() and vim.lsp.enable() API

return {
	-- Mason: Package manager for LSP servers, formatters, linters
	{
		"mason-org/mason.nvim",
		opts = {
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
				border = "rounded",
			},
		},
	},

	-- Mason-LSPConfig: Bridge between Mason and nvim-lspconfig
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			"mason-org/mason.nvim",
			"neovim/nvim-lspconfig", -- Still needed for config definitions
		},
		opts = {
			ensure_installed = {
				-- Core (TypeScript/JavaScript)
				"ts_ls", -- TypeScript/JavaScript LSP
				"biome", -- Linting + Formatting (replaces ESLint + Prettier)

				-- Neovim config
				"lua_ls", -- Lua LSP

				-- Web
				"html", -- HTML
				"cssls", -- CSS
				"tailwindcss", -- Tailwind CSS (remove if not using)
				"jsonls", -- JSON with schema support

				-- DevOps / Infrastructure
				"yamlls",  -- YAML + Kubernetes schemas
				"helm_ls", -- Helm charts
				"dockerls", -- Dockerfiles
				"docker_compose_language_service", -- docker-compose

				-- Shell
				"bashls", -- Bash/Shell scripts
			},
			-- Automatically enable installed servers via vim.lsp.enable()
			automatic_enable = true,
		},
	},

	-- nvim-lspconfig: Provides LSP config definitions
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"mason-org/mason-lspconfig.nvim",
			"b0o/schemastore.nvim", -- JSON/YAML schemas
		},
		config = function()
			-- Configure individual LSP servers using vim.lsp.config()

			-- TypeScript/JavaScript
			vim.lsp.config("ts_ls", {
				settings = {
					typescript = {
						inlayHints = {
							includeInlayParameterNameHints = "all",
							includeInlayFunctionParameterTypeHints = true,
							includeInlayVariableTypeHints = true,
						},
					},
					javascript = {
						inlayHints = {
							includeInlayParameterNameHints = "all",
							includeInlayFunctionParameterTypeHints = true,
							includeInlayVariableTypeHints = true,
						},
					},
				},
				-- Disable formatting (we use Biome)
				on_attach = function(client, bufnr)
					client.server_capabilities.documentFormattingProvider = false
					client.server_capabilities.documentRangeFormattingProvider = false
				end,
			})

			-- Biome (linting + formatting for JS/TS/JSON)
			vim.lsp.config("biome", {})

			-- Lua (for Neovim config)
			vim.lsp.config("lua_ls", {
				settings = {
					Lua = {
						runtime = { version = "LuaJIT" },
						diagnostics = {
							globals = { "vim" },
						},
						workspace = {
							library = vim.api.nvim_get_runtime_file("", true),
							checkThirdParty = false,
						},
						telemetry = { enable = false },
					},
				},
			})

			-- JSON with schemas
			vim.lsp.config("jsonls", {
				settings = {
					json = {
						schemas = require("schemastore").json.schemas(),
						validate = { enable = true },
					},
				},
			})

			-- YAML with Kubernetes + Docker Compose schemas
			vim.lsp.config("yamlls", {
				settings = {
					yaml = {
						validate = true,
						schemaStore = {
							enable = true,
							url = "https://www.schemastore.org/api/json/catalog.json",
						},
						schemas = {
							kubernetes = {
								"k8s/**/*.yaml",
								"k8s/**/*.yml",
								"**/deployment*.yaml",
								"**/service*.yaml",
								"**/configmap*.yaml",
								"**/ingress*.yaml",
								"**/secret*.yaml",
							},
							["https://raw.githubusercontent.com/docker/compose/master/compose/config/compose_spec.json"] = {
								"docker-compose*.yml",
								"docker-compose*.yaml",
								"compose*.yml",
								"compose*.yaml",
							},
							["https://json.schemastore.org/github-workflow.json"] =
							".github/workflows/*.yml",
							["https://json.schemastore.org/github-action.json"] =
							".github/actions/*/action.yml",
						},
					},
				},
			})

			-- Helm
			vim.lsp.config("helm_ls", {
				settings = {
					["helm-ls"] = {
						logLevel = "info",
						valuesFiles = {
							mainValuesFile = "values.yaml",
							additionalValuesFilesGlobPattern = "values*.yaml",
						},
						yamlls = {
							enabled = true,
							path = "yaml-language-server",
						},
					},
				},
			})

			-- Docker (no extra config needed)
			vim.lsp.config("dockerls", {})
			vim.lsp.config("docker_compose_language_service", {})

			-- HTML
			vim.lsp.config("html", {})

			-- CSS
			vim.lsp.config("cssls", {})

			-- Tailwind CSS (remove if not using)
			vim.lsp.config("tailwindcss", {})

			-- Bash
			vim.lsp.config("bashls", {})

			-- HTTP (kulala-ls) - Install via: npm install -g @mistweaverco/kulala-ls
			vim.lsp.config("kulala_ls", {})
			vim.lsp.enable("kulala_ls")

			-- Diagnostic appearance
			vim.diagnostic.config({
				virtual_text = {
					prefix = "●",
					spacing = 4,
				},
				signs = {
					text = {
						[vim.diagnostic.severity.ERROR] = " ",
						[vim.diagnostic.severity.WARN] = " ",
						[vim.diagnostic.severity.HINT] = "󰌵 ",
						[vim.diagnostic.severity.INFO] = " ",
					},
				},
				underline = true,
				update_in_insert = false,
				severity_sort = true,
				float = {
					border = "rounded",
					source = true,
				},
			})

			-- Custom keymaps (in addition to Neovim 0.11 defaults)
			-- Default keymaps in 0.11: grn (rename), gra (code action), grr (references), gri (implementation), K (hover)
			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(args)
					local opts = { buffer = args.buf, silent = true }

					-- Navigation (extending defaults)
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
					vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
					vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, opts)

					-- Diagnostics
					vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
					vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, opts)

					-- Format with LSP (backup, prefer conform.nvim)
					vim.keymap.set("n", "<leader>lf", function()
						vim.lsp.buf.format({ async = true })
					end, opts)
				end,
			})
		end,
	},

	-- SchemaStore: JSON/YAML schemas for popular config files
	{
		"b0o/schemastore.nvim",
		lazy = true,
	},

	-- Conform: Formatting (uses Biome for JS/TS, other formatters for rest)
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		keys = {
			{
				"<leader>f",
				function()
					require("conform").format({ async = true, lsp_fallback = true })
				end,
				mode = "",
				desc = "Format buffer",
			},
		},
		opts = {
			formatters_by_ft = {
				javascript = { "biome" },
				javascriptreact = { "biome" },
				typescript = { "biome" },
				typescriptreact = { "biome" },
				json = { "biome" },
				jsonc = { "biome" },

				-- Non-Biome files
				lua = { "stylua" },
				sh = { "shfmt" },
				bash = { "shfmt" },
				yaml = { "prettierd", "prettier", stop_after_first = true },
				markdown = { "prettierd", "prettier", stop_after_first = true },
				html = { "prettierd", "prettier", stop_after_first = true },
				css = { "prettierd", "prettier", stop_after_first = true },

				-- Fallback
				["_"] = { "trim_whitespace" },
			},
			format_on_save = false,
			notify_on_error = true,
		},
	},

	-- Mason Tool Installer: Auto-install formatters/linters not covered by mason-lspconfig
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = { "mason-org/mason.nvim" },
		opts = {
			ensure_installed = {
				-- Formatters
				"stylua", -- Lua formatter
				"shfmt", -- Shell formatter
				"prettierd", -- Prettier daemon (for YAML, MD, HTML, CSS)

				-- Linters (optional, Biome covers JS/TS)
				"hadolint", -- Dockerfile linter
				"shellcheck", -- Shell script linter
				"actionlint", -- GitHub Actions linter
			},
			auto_update = false,
			run_on_start = true,
		},
	},
}

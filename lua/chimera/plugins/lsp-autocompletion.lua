return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp", -- LSP source for nvim-cmp
		"hrsh7th/cmp-buffer", -- Buffer completions
		"hrsh7th/cmp-path", -- Path completions
		"hrsh7th/cmp-cmdline", -- Command line completions
		"L3MON4D3/LuaSnip", -- Snippet engine
		"saadparwaiz1/cmp_luasnip", -- Snippet completions
		"williamboman/mason.nvim", -- Mason
		"williamboman/mason-lspconfig.nvim", -- LSP Mason
		"WhoIsSethDaniel/mason-tool-installer.nvim", -- Installer
		"neovim/nvim-lspconfig", -- LSP Config
	},
	config = function()
		local mason_tool_installer = require("mason-tool-installer")
		mason_tool_installer.setup({
			-- https://github.com/mfussenegger/nvim-lint
			ensure_installed = {
				"prettier",
				"stylua",
				"isort",
				"black",
				"pylint",
				"eslint_d",
				"markdownlint",
				{ "golangci-lint", version = "v1.47.0" },
				{ "bash-language-server", auto_update = true },
				"lua-language-server",
				"vim-language-server",
				"gopls",
				"stylua",
				"editorconfig-checker",
				"gofumpt",
				"golines",
				"gomodifytags",
				"gotests",
				"impl",
				-- "json-to-struct",
				"luacheck",
				"misspell",
				"revive",
				"shellcheck",
				"shfmt",
				-- "staticcheck",
				"vint",
				"selene",
			},
			auto_update = false,
			run_on_start = true,
			start_delay = 3000,
			debounce_hours = 5,
			integrations = {
				["mason-lspconfig"] = true,
				["mason-null-ls"] = true,
				["mason-nvim-dap"] = true,
			},
		})
		local lsp_servers = {
			"html",
			"cssls",
			"tsserver",
			"eslint",
			"gopls",
			--"lua_ls",
			"bashls",
			"pyright",
			--"textlsp",
			"vuels",
			"yamlls",
			"jsonls",
			"gradle_ls",
			"dockerls",
			--'jinja_lsp',
			--'ast_grep',
			--"clangd", -- require unzip
			--"arduino_language_server", -- require unzip
			"ansiblels",
			"angularls",
			--"markdown_oxide",
		}
		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = lsp_servers,
		})
		local function setup_lsp(server)
			require("lspconfig")[server].setup({})
		end
		for _, server in ipairs(lsp_servers) do
			setup_lsp(server)
		end
		--- Autocompletions
		local cmp = require("cmp")
		cmp.setup({
			window = {
				completion = cmp.config.window.bordered(),
			},
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
			mapping = {
				["<C-j>"] = cmp.mapping.select_next_item(), -- Navigation to next item
				["<C-k>"] = cmp.mapping.select_prev_item(), -- Navigation to prev item
				["<C-Down>"] = cmp.mapping.select_next_item(), -- Navigation to next item
				["<C-Up>"] = cmp.mapping.select_prev_item(), -- Navigation to prev item
				["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
				["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
				["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
				["<C-y>"] = cmp.config.disable,
				["<C-e>"] = cmp.mapping({
					i = cmp.mapping.abort(),
					c = cmp.mapping.close(),
				}),
				["<CR>"] = cmp.mapping.confirm({ select = true }),
			},
			sources = cmp.config.sources({
				{ name = "nvim_lsp" }, -- Source LSP
				{ name = "luasnip" }, -- Source snippet
				{ name = "buffer" }, -- Source buffer
				{ name = "path" }, -- Source path
			}, {
				{ name = "buffer" },
			}),
		})
	end,
}

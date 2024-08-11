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
		"WhoIsSethDaniel/mason-tool-installer.nvim", -- Mason Installer Tools
		"neovim/nvim-lspconfig", -- LSP Config
		-- "onsails/lspkind-nvim", -- LSP Kind
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
    local function what_arch()
      local handle = io.popen("uname -m")
      local result = handle:read("*a")
      handle:close()
      if result:find("x86_64") then
        return "x64"
      elseif result:find("aarch64") then
        return "arm64"
      else
        return "unknown"
      end
    end
    local architecture = what_arch()
    -- vim.notify("Detected architecture: " .. architecture)
    if architecture == "arm64" then
      lsp_support = nil
    else
      lsp_support = {
        "clangd",
        "harper_ls",
        "graphql",
        "glint",
        "hyprls",
        "texlab",
        "helm_ls",
        "lua_ls",
        "luau_lsp",
        "vale_ls",
        "ols",
        "ruby_lsp",
        "vhdl_ls",
        "lemminx",
      }
    end
		local lsp_servers = {
			---- https://github.com/williamboman/mason-lspconfig.nvim
			"angularls",
			"ansiblels",
			"arduino_language_server",
			"bashls",
			--"pkgbuild_language_server",
			--"csharp_ls",
			--"ast_grep",
			"cmake",
			"cssls",
			"tailwindcss",
			--"jinja_lsp",
			"docker_compose_language_service",
			"dockerls",
			"elixirls",
			--"erlangls",
			--"flux_lsp",
			"gopls",
			"golangci_lint_ls",
			"gradle_ls",
			--"groovyls",
			--"hls",
			"haxe_language_server",
			"html",
			--"htmx",
			"twiggy_language_server",
			--"java_language_server",
			"jdtls",
			"eslint",
			"tsserver",
			"vtsls",
			"jsonls",
			"kotlin_language_server",
			"ltex",
			"cssls",
			-- "shopify_theme_ls",
			"grammarly",
			"marksman",
			"nginx_language_server",
			--"nickel_ls",
			"nim_langserver",
			"bsl_ls",
			"opencl_ls",
			"textlsp",
			"perlnavigator",
			--"pest_ls",
			--"intelephense",
			"phpactor",
			--"psalm",
			"stimulus_ls",
			"powershell_es",
			"puppet",
			"purescriptls",
			"pylsp",
			"pyright",
			--"r_language_server",
			--"sqlls",
			"sqls",
			"terraformls",
			"tflint",
			"taplo",
			"vimls",
			"volar",
			"vuels",
			"yamlls",
			-- "vls",
		}
    --for _, lsp_ext in ipairs(lsp_support) do
    --  if not vim.tbl_contains(lsp_servers, lsp_ext) then
    --    table.insert(lsp_servers, lsp_ext)
    --  end
    --end
    table.insert(lsp_servers, lsp_support)
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
		-- local has_words_before = function()
		-- 	if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
		-- 		return false
		-- 	end
		-- 	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
		-- 	return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match("^%s*$") == nil
		-- end
		--  local lspkind = require("lspkind")
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
				-- ["<Tab>"] = vim.schedule_wrap(function(fallback)
				-- 	if cmp.visible() and has_words_before() then
				-- 		cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
				-- 	else
				-- 		fallback()
				-- 	end
				-- end),
			},
			-- sorting = {
			-- 	priority_weight = 2,
			-- 	comparators = {
			-- 		require("copilot_cmp.comparators").prioritize,

			-- 		-- Below is the default comparitor list and order for nvim-cmp
			-- 		cmp.config.compare.offset,
			-- 		-- cmp.config.compare.scopes, --this is commented in nvim-cmp too
			-- 		cmp.config.compare.exact,
			-- 		cmp.config.compare.score,
			-- 		cmp.config.compare.recently_used,
			-- 		cmp.config.compare.locality,
			-- 		cmp.config.compare.kind,
			-- 		cmp.config.compare.sort_text,
			-- 		cmp.config.compare.length,
			-- 		cmp.config.compare.order,
			-- 	},
			-- },
			sources = cmp.config.sources({
				{ name = "nvim_lsp" }, -- Source LSP
				{ name = "luasnip" }, -- Source snippet
				{ name = "buffer" }, -- Source buffer
				{ name = "path" }, -- Source path
			}, {
				{ name = "buffer" },
			}),
			-- formatting = {
			-- 	format = lspkind.cmp_format({
			-- 		mode = "symbol",
			-- 		max_width = 50,
			-- 		symbol_map = { Copilot = "" },
			-- 	}),
			-- },
		})
	end,
}

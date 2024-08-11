return {
	"williamboman/mason.nvim", -- Mason
	dependencies = {
		"williamboman/mason-lspconfig.nvim", -- LSP Mason
		"WhoIsSethDaniel/mason-tool-installer.nvim", -- Mason Installer Tools
	},
	config = function()
		local function package(command)
			return vim.fn.executable(command) == 1
		end
		-- Check Arch
		local function is_arm64()
			local arch = vim.fn.system("uname -m"):match("^%s*(.-)%s*$")
			return arch == "aarch64" or arch == "arm64"
		end
		-- Not Support arm64
		local not_support_arm64 = {
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
		local function add(t, package_name, lsp, linter, dap, formatter)
			if package(package_name) and (not is_arm64() or not vim.tbl_contains(not_support_arm64, package_name)) then
				table.insert(t.lsp, lsp)
				table.insert(t.linter, linter)
				table.insert(t.dap, dap)
				table.insert(t.formatter, formatter)
			end
		end

		local tools = {
			lsp = {},
			linter = {},
			dap = {},
			formatter = {},
		}

		local function configure_tools()
			-- Python
			add(tools, "python3", "pyright", "flake8", "debugpy", "black")
			-- Node.js / Javascript
			add(tools, "node", "tsserver", "eslint", "node-debug2-adapter", "prettier")
			-- Golang
			add(tools, "go", "gopls", "golangci-lint", "delve", "gofmt")
			-- Lua
			add(tools, "luac", "lua_ls", "luacheck", "nlua", "stylua")
			-- C
			add(tools, "gcc", "clangd", "clang-tidy", "clangd", "clang-format")
			-- C++
			add(tools, "g++", "clangd", "clang-tidy", "clangd", "clang-format")
			-- C#
			add(tools, "dotnet", "omnisharp", nil, nil, nil)
			-- CSS
			add(tools, "node", nil, "stylelint", nil, "prettier")
			-- HTML
			add(tools, "node", nil, "htmlhint", nil, "prettier")
			-- Ruby
			add(tools, "ruby", "solargraph", "rubocop", nil, "rufo")
			-- Rust
			add(tools, "rustc", "rust_analyzer", "clippy", "rust-analyzer", "rustfmt")
			-- R
			add(tools, "r", "r_language_server", "lintr", nil, "formatR")
			-- Markdown
			add(tools, "node", nil, "markdownlint", nil, "prettier")
			-- Bash
			add(tools, "bash", "bashls", "shellcheck", nil, "shfmt")
			-- Arduino
			add(tools, "arduino-cli", "arduino-language-server", nil, nil, nil)
			-- Azure Pipeline
			add(tools, "az", "azure-pipelines-linter", nil, nil, nil)
			-- CMake
			add(tools, "cmake", "cmake-language-server", nil, nil, nil)
			-- Dart
			add(tools, "dart", "dartls", "dartanalyzer", "dart", "dartfmt")
			-- Docker
			add(tools, "docker", nil, "hadolint", nil, nil)
			-- Django
			add(tools, "python3", "jinja_lsp", "flake8", nil, "black")
			-- Gradle
			add(tools, "gradle", "gradle-language-server", nil, nil, nil)
			-- Helm
			add(tools, "helm", "helm-language-server", nil, nil, nil)
			-- Java
			add(tools, "java", "jdtls", "checkstyle", "jdtls", "google-java-format")
			-- JSON
			add(tools, "node", nil, "jsonlint", nil, "prettier")
			-- Kotlin
			add(tools, "java", "kotlin-language-server", "ktlint", nil, "ktfmt")
			-- Perl
			add(tools, "perl", nil, "perlcritic", nil, nil)
			-- PHP
			add(tools, "php", "intelephense", "phpcs", nil, "phpcs")
			-- PowerShell
			add(tools, "pwsh", "powershell", "pylint", nil, "powershell-script-analyzer")
			-- Puppet
			add(tools, "puppet", "puppet", "puppet-lint", nil, nil)
			-- SQL
			add(tools, "sqlcmd", "sqlls", "sqlfluff", nil, nil)
			-- Terraform
			add(tools, "terraform", "terraform-ls", "tflint", nil, nil)
			-- TypeScript
			add(tools, "node", "tsserver", "eslint", nil, "prettier")
			-- React
			add(tools, "node", "tsserver", "eslint", nil, "prettier")
			-- Vue.js
			add(tools, "node", "volar", "eslint", nil, "prettier")
			-- AngularJS
			add(tools, "node", "angularls", "eslint", nil, "prettier")
			-- Vimscript
			add(tools, "vim", "vimls", nil, nil, nil)
			-- YAML
			add(tools, "node", nil, "yaml-language-server", nil, "prettier")
		end
		configure_tools()
		-- Remove Duplicate LSP
		local function r_duplicate(list_lsp)
			local seen = {}
			local result = {}
			for _, item in ipairs(list_lsp) do
				if not seen[item] then
					table.insert(result, item)
					seen[item] = true
				end
			end
			return result
		end
		-- Combine all tools
		local function combine_tools(linter, dap, formatter)
			local combine = {}
			vim.list_extend(combine, linter)
			vim.list_extend(combine, dap)
			vim.list_extend(combine, formatter)
			local seen = {}
			local result = {}
			for _, item in ipairs(combine) do
				if not seen[item] then
					table.insert(result, item)
					seen[item] = true
				end
			end
			return result
		end
		local all_tools = combine_tools(tools.linter, tools.dap, tools.formatter)
		local mason_tool_installer = require("mason-tool-installer")
		mason_tool_installer.setup({
			-- https://github.com/mfussenegger/nvim-lint
			ensure_installed = all_tools,
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
		local lsp_servers = r_duplicate(tools.lsp)
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
	end,
}

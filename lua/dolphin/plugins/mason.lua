return {
	"williamboman/mason.nvim", -- Mason
	dependencies = {
		"williamboman/mason-lspconfig.nvim", -- LSP Mason
		"WhoIsSethDaniel/mason-tool-installer.nvim", -- Mason Installer Tools
		"neovim/nvim-lspconfig", -- LSP Config
	},
	config = vim.schedule(function()
    local lspconfig = require("lspconfig")
		local mason_tools = require("dolphin.utils.mason")
		local lsp_servers, other_tools = mason_tools.get_tools()
		local mason_tool_installer = require("mason-tool-installer")
		mason_tool_installer.setup({
			ensure_installed = other_tools,
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
		local mason = require("mason")
    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })
		require("mason-lspconfig").setup({
			ensure_installed = lsp_servers,
		})
		local function setup_lsp(server)
			lspconfig[server].setup({})
		end
		for _, server in ipairs(lsp_servers) do
			setup_lsp(server)
		end
    lspconfig.tsserver.setup {
      capabilities = require('cmp_nvim_lsp').default_capabilities(),
      on_attach = function(client)
        -- Enable diagnostics
        client.server_capabilities.documentHighlightProvider = true
      end,
    }
	end),
}


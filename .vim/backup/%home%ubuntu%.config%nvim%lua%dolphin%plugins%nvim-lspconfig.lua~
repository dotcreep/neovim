return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
    { "folke/neodev.nvim",                   opts = {} }
  },
  config = vim.schedule(function()
    local lspconfig = require("lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    local mason_tools = require("dolphin.utils.mason")
    local lsp_servers, other_tools = mason_tools.get_tools()
    local function setup(lsp)
      if lsp == "gopls" then
        lspconfig.gopls.setup {
          cmd = { "gopls" },
          filetypes = { "go", "gomod", "gowork", "gotmpl" },
          root_dir = lspconfig.util.root_pattern("go.work", "go.mod", ".git"),
          settings = {
            gopls = {
              completeUnimported = true,
              usePlaceholders = true,
              analyses = {
                unusedparams = true,
                shadow = true,
              },
              staticcheck = true,
            },
          },
        }
      else
        lspconfig[lsp].setup({})
      end
    end
    for _, lsp in ipairs(lsp_servers) do
      setup(lsp)
    end
    lspconfig.tsserver.setup {
      capabilities = cmp_nvim_lsp.default_capabilities(),
      on_attach = function(client)
        client.server_capabilities.documentHighlightProvider = true
      end
    }
  end)
}

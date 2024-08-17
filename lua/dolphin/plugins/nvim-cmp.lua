return {
	"hrsh7th/nvim-cmp",
  event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-buffer", -- Buffer completions
		"hrsh7th/cmp-path", -- Path completions
    {
      "L3MON4D3/LuaSnip", -- Snippet engine
      version = "2.*",
      build = "make install_jsregexp"
    },
		"saadparwaiz1/cmp_luasnip", -- Snippet completions
		"onsails/lspkind-nvim", -- pictograms
	},
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
		local lspkind = require("lspkind")
    require("luasnip.loaders.from_vscode").lazy_load()
    cmp.setup({
			window = {
				completion = cmp.config.window.bordered(),
			},
      completion = {
        completeopt = "menu,menuone,preview,noselect"
      },
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
			mapping = {
				["<C-j>"] = cmp.mapping.select_next_item(), -- Navigation to next item
				["<C-k>"] = cmp.mapping.select_prev_item(), -- Navigation to prev item
				["<C-Down>"] = cmp.mapping.select_next_item(), -- Navigation to next item
				["<C-Up>"] = cmp.mapping.select_prev_item(), -- Navigation to prev item
				["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
				["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
				["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
				["<C-e>"] = cmp.mapping({
					i = cmp.mapping.abort(),
					c = cmp.mapping.close(),
				}),
				["<CR>"] = cmp.mapping.confirm({
					behavior = cmp.ConfirmBehavior.Replace,
					select = true,
				}),
			},
			sources = cmp.config.sources({
				{ name = "nvim_lsp" }, -- Source LSP
				{ name = "luasnip" }, -- Source snippet
				{ name = "buffer" }, -- Source buffer
				{ name = "path" }, -- Source path
			}, {
				{ name = "buffer" },
			}),
			formatting = {
				format = lspkind.cmp_format({
					max_width = 50,
          ellipsis_char = "...",
				}),
			},
    })
  end,
}

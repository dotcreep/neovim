return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-nvim-lua",
		"octaltree/cmp-look",
		"hrsh7th/cmp-calc",
		"f3fora/cmp-spell",
		"hrsh7th/cmp-emoji",
		"ray-x/cmp-treesitter",
		{
			"L3MON4D3/LuaSnip",
			version = "2.*",
			build = "make install_jsregexp",
		},
		"saadparwaiz1/cmp_luasnip",
		"onsails/lspkind-nvim",
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		local lspkind = require("lspkind")
		require("luasnip.loaders.from_vscode").lazy_load()

		-- Source mapping configuration
		local source_mapping = {
			buffer = "[Buffer]",
			nvim_lsp = "[LSP]",
			nvim_lua = "[Lua]",
			cmp_tabnine = "[TN]",
			path = "[Path]",
			treesitter = "[TS]",
			look = "[Look]",
			spell = "[Spell]",
			calc = "[Calc]",
			emoji = "[Emoji]",
			neorg = "[Neorg]",
		}

		-- Configuration for nvim-cmp
		cmp.setup({
			sorting = {
				priority_weight = 2,
				comparators = {
					require("cmp_tabnine.compare"),
					cmp.config.compare.offset,
					cmp.config.compare.exact,
					cmp.config.compare.score,
					cmp.config.compare.recently_used,
					cmp.config.compare.kind,
					cmp.config.compare.sort_text,
					cmp.config.compare.length,
					cmp.config.compare.order,
				},
			},
			window = {
				completion = cmp.config.window.bordered(),
			},
			completion = {
				completeopt = "menu,menuone,noinsert",
				keyword_length = 1,
			},
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			mapping = {
				["<C-j>"] = cmp.mapping.select_next_item(),
				["<C-k>"] = cmp.mapping.select_prev_item(),
				["<C-d>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping({
					i = cmp.mapping.abort(),
					c = cmp.mapping.close(),
				}),
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif luasnip.expand_or_jumpable() then
						luasnip.expand_or_jump()
					else
						fallback()
					end
				end, { "i", "s" }),
				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif luasnip.jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),
				["<CR>"] = cmp.mapping.confirm({
					behavior = cmp.ConfirmBehavior.Replace,
					select = true,
				}),
			},
			sources = cmp.config.sources({
				{ name = "nvim_lsp", max_item_count = 10 },
				{ name = "nvim_lua", max_item_count = 5 },
				{ name = "luasnip", max_item_count = 5 },
				{ name = "cmp_tabnine", max_item_count = 10 },
				{ name = "codeium", max_item_count = 10 },
				{ name = "buffer", keyword_length = 5, max_item_count = 5 },
				{ name = "path" },
				{ name = "treesitter", max_item_count = 10 },
			}),
			formatting = {
				fields = { "abbr", "kind", "menu" },
				format = function(entry, vim_item)
					vim_item.kind = lspkind.symbolic(vim_item.kind, { mode = "symbol" })
					vim_item.menu = source_mapping[entry.source.name]

					if entry.source.name == "cmp_tabnine" then
						local detail = (entry.completion_item.labelDetails or {}).detail
						vim_item.kind = ""
						if detail and detail:find(".*%%.*") then
							vim_item.kind = vim_item.kind .. " " .. detail
						end
						if (entry.completion_item.data or {}).multiline then
							vim_item.kind = vim_item.kind .. " [ML]"
						end
					end

					vim_item.abbr = string.sub(vim_item.abbr, 1, 80)
					return vim_item
				end,
				expandable_indicator = true,
			},
		})

		vim.api.nvim_set_hl(0, "CmpItemKindTabNine", { fg = "#6CC644" })
	end,
}

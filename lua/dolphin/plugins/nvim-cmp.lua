return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-buffer", -- Buffer completions
		"hrsh7th/cmp-path", -- Path completions
		"hrsh7th/cmp-nvim-lsp",
		-- "quangnguyen30192/cmp-nvim-ultisnips",
		"hrsh7th/cmp-nvim-lua",
		"octaltree/cmp-look",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-calc",
		"f3fora/cmp-spell",
		"hrsh7th/cmp-emoji",
		"ray-x/cmp-treesitter",
		{
			"L3MON4D3/LuaSnip", -- Snippet engine
			version = "2.*",
			build = "make install_jsregexp",
		},
		"saadparwaiz1/cmp_luasnip", -- Snippet completions
		"onsails/lspkind-nvim", -- pictograms
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		local lspkind = require("lspkind")
		require("luasnip.loaders.from_vscode").lazy_load()
		local source_mapping = {
			buffer = "[Buffer]",
			nvim_lsp = "[LSP]",
			nvim_lua = "[Lua]",
			cmp_tabnine = "[TN]",
			path = "[Path]",
		}
		local compare = require("cmp.config.compare")
		cmp.setup({
			sorting = {
				priority_weight = 2,
				comparators = {
					require("cmp_tabnine.compare"),
					compare.offset,
					compare.exact,
					compare.score,
					compare.recently_used,
					compare.kind,
					compare.sort_text,
					compare.length,
					compare.order,
				},
			},
			window = {
				completion = cmp.config.window.bordered(),
			},
			completion = { completeopt = "menu,menuone,noinsert", keyword_length = 1 },
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
				["<Tab>"] = {
					c = function()
						if cmp.visible() then
							cmp.select_next_item()
						else
							cmp.complete()
						end
					end,
				},
				["<CR>"] = cmp.mapping.confirm({
					behavior = cmp.ConfirmBehavior.Replace,
					select = true,
				}),
			},
			sources = cmp.config.sources({
				{ name = "nvim_lsp", max_item_count = 10 }, -- Source LSP
				{ name = "nvim_lua", max_item_count = 5 },
				{ name = "luasnip", max_item_count = 5 }, -- Source snippet
				{ name = "cmp_tabnine", max_item_count = 10 }, -- AI Tabnine
				{ name = "buffer", keyword_length = 5, max_item_count = 5 }, -- Source buffer
				{ name = "path" }, -- Source path
				{ name = "treesitter", max_item_count = 10 },
			}, {
				{ name = "buffer" },
			}),
			formatting = {
				format = function(entry, vim_item)
					-- if you have lspkind installed, you can use it like
					-- in the following line:
					vim_item.kind = lspkind.symbolic(vim_item.kind, { mode = "symbol" })
					vim_item.menu = source_mapping[entry.source.name]
					if entry.source.name == "cmp_tabnine" then
						local detail = (entry.completion_item.labelDetails or {}).detail
						vim_item.kind = ""
						if detail and detail:find(".*%%.*") then
							vim_item.kind = vim_item.kind .. " " .. detail
						end

						if (entry.completion_item.data or {}).multiline then
							vim_item.kind = vim_item.kind .. " " .. "[ML]"
						end
					end
					local maxwidth = 80
					vim_item.abbr = string.sub(vim_item.abbr, 1, maxwidth)
					return vim_item
				end,
			},
			experimental = { native_menu = false, ghost_text = false },
		})
		vim.api.nvim_set_hl(0, "CmpItemKindTabNine", { fg = "#6CC644" })
		local tabnine = require("cmp_tabnine.config")
		tabnine:setup({
			max_lines = 1000,
			max_num_results = 20,
			sort = true,
			run_on_every_keystroke = true,
			snippet_placeholder = "..",
			ignored_file_types = {
				-- default is not to ignore
				-- uncomment to ignore in lua:
				lua = true,
			},
			show_prediction_strength = false,
			min_percent = 0,
		})
	end,
}

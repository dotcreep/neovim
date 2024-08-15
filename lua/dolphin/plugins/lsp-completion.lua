return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp", -- LSP source for nvim-cmp
		"hrsh7th/cmp-buffer", -- Buffer completions
		"hrsh7th/cmp-path", -- Path completions
		"hrsh7th/cmp-cmdline", -- Command line completions
		"L3MON4D3/LuaSnip", -- Snippet engine
		"saadparwaiz1/cmp_luasnip", -- Snippet completions
    "onsails/lspkind-nvim", -- pictograms
	},
	config = function()
		local status, cmp = pcall(require, "cmp")
    local lspkind = require('lspkind')
    if (not status) then return end
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
				["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
				["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
				["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
				["<C-y>"] = cmp.config.disable,
				["<C-e>"] = cmp.mapping({
					i = cmp.mapping.abort(),
					c = cmp.mapping.close(),
				}),
				["<CR>"] = cmp.mapping.confirm({ 
          behavior = cmp.ConfirmBehavior.Replace,
          select = true}),
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
          wirth_text = false, max_width = 50
        })
      },
		})
    vim.cmd [[
      set completeopt=menuone,noinsert,noselect
      highlight! default link CmpItemKind CmpItemMenuDefault
    ]]
	end,
}


local cmp = require('cmp')

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body) -- For using LuaSnip
    end,
  },
  mapping = {
    ['<C-n>'] = cmp.mapping.select_next_item(), -- Navigation to next item
    ['<C-p>'] = cmp.mapping.select_prev_item(), -- Navigation to prev item
    ['<C-Space>'] = cmp.mapping.complete(),      -- Show menu autocompletion
    ['<C-e>'] = cmp.mapping.close(),             -- Close menu autocompletion
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Choose confirmation
  },
  sources = {
    { name = 'nvim_lsp' },  -- Source LSP
    { name = 'buffer' },     -- Source buffer
    { name = 'path' },       -- Source path
    { name = 'luasnip' },    -- Source snippet
  },
})


local packer = require('packer')

packer.startup(function(use)
  use 'wbthomason/packer.nvim'           -- Plugin manager
  -- Begin Custom Plugin
  use 'windwp/nvim-autopairs'            -- 1
  use 'neovim/nvim-lspconfig'            -- 2
    -- Begin Autocompleting
    use 'hrsh7th/nvim-cmp'               -- Autocompletion plugin
    use 'hrsh7th/cmp-nvim-lsp'           -- LSP source for nvim-cmp
    use 'hrsh7th/cmp-buffer'             -- Buffer completions
    use 'hrsh7th/cmp-path'               -- Path completions
    use 'hrsh7th/cmp-cmdline'            -- Command line completions
    use 'L3MON4D3/LuaSnip'               -- Snippet engine
    use 'saadparwaiz1/cmp_luasnip'       -- Snippet completions
    use 'neovim/nvim-lspconfig'          -- LSP configurations
    -- End Autocompleting
    -- Begin File Explorer
    use 'nvim-tree/nvim-tree.lua'        -- Tree in nvim
    use 'nvim-tree/nvim-web-devicons'    -- Optional for icon
    -- End File Explorer
  -- Ending Custom Plugin
    if packer_bootstrap then
        require('packer').sync()
    end
end)

-- ====================================
--       Begin Activate Plugins
-- ====================================

-- 1. Mempermudah untuk menambahkan penutup
-- simbol <, ", ', {, [, ( secara otomatis
require('nvim-autopairs').setup{}

-- 2. Mempermudah konfigurasi dan pengaturan
-- Language Server Protocol (LSP) untuk
-- berbagai bahasa pemrograman.
local lspconfig = require('lspconfig')



-- ====================================
--        End Activate Plugins
-- ====================================

-- ====================================
--       Begin Advanced Plugins
-- ====================================
-- Begin Autocompletion
local cmp = require'cmp'

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body) -- For using LuaSnip
    end,
  },
  mapping = {
    ['<C-n>'] = cmp.mapping.select_next_item(), -- Navigasi ke item berikutnya
    ['<C-p>'] = cmp.mapping.select_prev_item(), -- Navigasi ke item sebelumnya
    ['<C-Space>'] = cmp.mapping.complete(),      -- Menampilkan menu autocompletion
    ['<C-e>'] = cmp.mapping.close(),             -- Menutup menu autocompletion
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Konfirmasi pemilihan
  },
  sources = {
    { name = 'nvim_lsp' },  -- Sumber LSP
    { name = 'buffer' },     -- Sumber buffer
    { name = 'path' },       -- Sumber path
    { name = 'luasnip' },    -- Sumber snippet
  },
})
-- End Autocompletion

-- Begin nvim Tree
require('nvim-tree').setup {
  sort_by = "name",
  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
        folder = true,
        file = true,
      },
    },
  },
  filters = {
    dotfiles = false,
    custom = {'.git'}
  },
  view = {
    width = 30,
    side = 'left',
  },
  actions = {
    open_file = {
      quit_on_open = true,
    },
  },
}
-- End nvim Tree

-- ====================================
--        End Advanced Plugins
-- ====================================


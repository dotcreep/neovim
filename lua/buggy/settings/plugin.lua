require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'                -- Plugin Manager
  ------------------------------------------------------------------------
  use 'windwp/nvim-autopairs'                 -- Auto pair symbols
  use 'nvim-tree/nvim-tree.lua'               -- File manager
  use 'nvim-tree/nvim-web-devicons'           -- Support icon on manager
  use 'lukas-reineke/indent-blankline.nvim'   -- Indent blankline
  use 'tpope/vim-fugitive'                    -- Git Intergration
  ------------------------------------------------------------------------
  --- Themes
  use { "catppuccin/nvim", as = "catppuccin" }
  use { "ellisonleao/gruvbox.nvim" }
  use 'Mofiqul/vscode.nvim'
  ------------------------------------------------------------------------
  --- Language Support
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  }
  ------------------------------------------------------------------------
  --- Autocompletions
  use 'hrsh7th/nvim-cmp'                      -- Autocompletion plugin
  use 'hrsh7th/cmp-nvim-lsp'                  -- LSP source for nvim-cmp
  use 'hrsh7th/cmp-buffer'                    -- Buffer completions
  use 'hrsh7th/cmp-path'                      -- Path completions
  use 'hrsh7th/cmp-cmdline'                   -- Command line completions
  use 'L3MON4D3/LuaSnip'                      -- Snippet engine
  use 'saadparwaiz1/cmp_luasnip'              -- Snippet completions
  use 'neovim/nvim-lspconfig'                 -- LSP configurations
  ------------------------------------------------------------------------
  --- Statusline
  use { 'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }
  ------------------------------------------------------------------------
  --- Search and Find for file, text, etc
  use { 'nvim-telescope/telescope.nvim', tag = '0.1.8',
    requires = { 'nvim-lua/plenary.nvim' }
  }
  ------------------------------------------------------------------------
  --- Git Intergration
  use { "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",         -- required
      "sindrets/diffview.nvim",        -- optional - Diff integrations
      -- Only one of these is needed, not both.
      "nvim-telescope/telescope.nvim", -- optional
      "ibhagwan/fzf-lua",              -- optional
    },
    config = true
  }

end)

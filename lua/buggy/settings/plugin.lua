-- local fn = vim.fn
-- local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
-- if fn.empty(fn.glob(install_path)) > 0 then
-- 	packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
-- end

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'                -- Plugin Manager
  ------------------------------------------------------------------------
  use 'windwp/nvim-autopairs'                 -- Auto pair symbols
  use 'nvim-tree/nvim-tree.lua'               -- File manager
  use 'nvim-tree/nvim-web-devicons'           -- Support icon on manager
  use 'lukas-reineke/indent-blankline.nvim'   -- Indent blankline
  use 'tpope/vim-fugitive'                    -- Git Intergration
  ------------------------------------------------------------------------
  --- Highlighting Syntax
  --- need install 'node' and 'build-essential' atau 'gcc' atau 'base-devel'
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require("nvim-treesitter.install").update { with_sync = true } end
  }
  ------------------------------------------------------------------------
  --- Themes
  use { 'catppuccin/nvim', as = 'catppuccin' }
  use 'ellisonleao/gruvbox.nvim'
  use 'Mofiqul/vscode.nvim'
  ------------------------------------------------------------------------
  --- Language Support
  use {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',
  }
  ------------------------------------------------------------------------
  --- Autocompletions
  use {'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp',                  -- LSP source for nvim-cmp
      'hrsh7th/cmp-buffer',                    -- Buffer completions
      'hrsh7th/cmp-path',                      -- Path completions
      'hrsh7th/cmp-cmdline',                   -- Command line completions
      'L3MON4D3/LuaSnip',                      -- Snippet engine
      'saadparwaiz1/cmp_luasnip'               -- Snippet completions
    }
  }
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
  -- if packer_bootstrap then require("packer").sync() end
end)

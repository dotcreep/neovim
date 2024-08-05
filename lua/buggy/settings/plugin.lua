require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'                -- Plugin Manager
  ------------------------------------------------------------------------
  use 'windwp/nvim-autopairs'                 -- Auto pair symbols
  use 'nvim-tree/nvim-tree.lua'               -- File manager
  use 'nvim-tree/nvim-web-devicons'           -- Support icon on manager
  ------------------------------------------------------------------------
  --- Themes
  use { "catppuccin/nvim", as = "catppuccin" }
  use { "ellisonleao/gruvbox.nvim" }
  use 'Mofiqul/vscode.nvim'
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
end)

local packer = require('packer')

packer.startup(function(use)
  use 'wbthomason/packer.nvim'      -- Plugin manager
  -- Begin Custom Plugin
  use 'windwp/nvim-autopairs'       -- 1
  use 'neovim/nvim-lspconfig'       -- 2
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

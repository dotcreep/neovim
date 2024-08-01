require("settings") -- Settings
require("mappings") -- Key mappings
require("plugins")  -- Plugins

-- Autocompile packer when save plugins
vim.cmd([[
augroup packer_user_config
  autocmd!
  autocmd BufWritePost lua/plugins.lua source <afile> | PackerCompile
augroup end
]])

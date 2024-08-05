local profile = require('profile')

profile.setup({
  profile = 'buggy', -- 'buggy' and 'dotcreep'
})

-- require("dotcreep.settings") -- Settings
-- require("dotcreep.mappings") -- Key mappings
-- require("dotcreep.plugins")  -- Plugins
-- 
-- -- Autocompile packer when save plugins
-- vim.cmd([[
-- augroup packer_user_config
--   autocmd!
--   autocmd BufWritePost lua/dotcreep/plugins.lua source <afile> | PackerCompile
-- augroup end
-- ]])
--
-- require("buggy.plugin")
-- require("buggy.settings.basic")
-- require("buggy.plugins.switcher")
-- require("buggy.maps.leaders")
-- require("buggy.maps.shortcuts")
-- local switcher = require('switcher')

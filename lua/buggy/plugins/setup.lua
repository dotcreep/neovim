local M = {}
local name = require('buggy.settings.namespace').namespace

M.setup = function(config)
  if config.autopairs then
    require(name .. '.plugins.autopairs')
  end
  if config.filemanager then
    require(name .. '.plugins.filemanager')
  end
  if config.autocompletion then
    require(name .. '.plugins.autocompletion')
  end
end

return M

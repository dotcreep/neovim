local M = {}
local name = require('buggy.settings.namespace').namespace

M.setup = function(config)
  if config.autopairs then
    require(name .. '.plugins.autopairs')
  end
  if config.filemanager then
    require(name .. '.plugins.filemanager')
  end
  if config.lsp_autocompletion then
    require(name .. '.plugins.lsp_autocompletion')
  end
  if config.indentblackline then
    require(name .. '.plugins.indentblackline')
  end
  if config.autosave then
    require(name .. '.plugins.autosave')
  end
end

return M

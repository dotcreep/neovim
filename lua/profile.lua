local M = {}

M.setup = function(config)
  if config.profile == 'dotcreep' then
    require("dotcreep.setup")
  elseif config.profile == 'buggy' then
    require("buggy.setup")
  end
end

return M

local M = {}

function M.openHelpBot()
  vim.cmd('split lua/help.md')
  vim.cmd('filetype detect')
end

function M.openHelpRight()
  vim.cmd('vsplit lua/help.md')
  vim.cmd('filetype detect')
end

return M

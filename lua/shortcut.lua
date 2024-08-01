local M = {}

function M.openHelpBot()
  vim.cmd('split lua/help.md')
  vim.cmd('filetype detect')
end

function M.openHelpRight()
  vim.cmd('vsplit lua/help.md')
  vim.cmd('filetype detect')
end

function M.openVerticalSplit()
    vim.cmd('vsplit')
    vim.cmd('NvimTreeToggle')
end

function M.openHorizontalSplit()
    vim.cmd('split')
    vim.cmd('NvimTreeToggle')
end

return M

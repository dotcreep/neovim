--------------------------------------------------------
--- Variable
local namespace = require('buggy.settings.namespace').namespace
local c = vim.cmd
local fin = vim.fn.input
local M = {}
--------------------------------------------------------
--- Begin Git
local function commit()
  local message = fin('Enter message: ')
  return message
end

function M.gitCommitPush()
  local message = commit()
  c('Gwrite')
  c('Gcommit -m "' .. message .. '"')
  c('Gpush')
end

function M.createBranch()
  local name = fin('New branch name: ')
  c('Git checkout -b ' .. name)
end

function M.deleteBranch()
  local name = fin('Delete branch name: ')
  c('Git branch -d ' .. name)
end

function M.switchBranch()
  local name = fin('Switch branch to: ')
  c('Git checkout ' .. name)
end

--- End Git

--- Begin Help Menu
function M.openHelpHorizontal()
  c('split lua/' .. namespace .. '/tutorial/help.md')
end

function M.openHelpVertical()
  c('vsplit lua/' .. namespace .. '/tutorial/help.md')
end
--- End Help Menu

return M

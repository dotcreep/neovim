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
  c('Git add .')
  c('Git commit -m "' .. message .. '"')
  c('Git push')
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
  c('split lua/' .. namespace .. '/docs/help.md')
end

function M.openHelpVertical()
  c('vsplit lua/' .. namespace .. '/docs/help.md')
end
--- End Help Menu

--- Open setup
function M.openSetup()
  c('split lua/' .. namespace .. '/setup.lua')
end

function M.openvSetup()
  c('vsplit lua/' .. namespace .. '/setup.lua')
end

--- End open setup

return M

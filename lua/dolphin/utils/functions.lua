local c = vim.cmd
local fin = vim.fn.input
local M = {}

--------------------------------------------------------

function M.notification()
  local notifications = vim.api.nvim_get_vvar("messages")
  for _, notification in ipairs(notifications) do
    vim.notify(notification, "info")
  end
end

--- Running Program
function M.Rundev(file)
  local ext = file:match("^.+(%..+)$")

  local cmd
  if ext == ".go" then
    cmd = "go run " .. file
  elseif ext == ".py" then
    cmd = "python " .. file
  elseif ext == ".js" then
    cmd = "node " .. file
  elseif ext == ".java" then
    cmd = "java " .. file
  elseif ext == ".sh" then
    cmd = "bash " .. file
  else
    print("Unsupported file type")
    return
  end

  c("!cd %:p:h && " .. cmd)
end

--- End Running Program

--- Open configuration nvim
local function findNVimConfig()
  local loc = {
    vim.fn.stdpath("config"),
    "~/.config/nvim",
    "~/.nvim",
    "~/AppData/Local/nvim", -- For windows
  }

  for _, path in ipairs(loc) do
    local exp_path = vim.fn.expand(path)
    if vim.fn.isdirectory(exp_path) == 1 then
      return exp_path
    end
  end
  return nil
end

function M.openConfig()
  local configPath = findNVimConfig()
  if configPath then
    local nvim_tree = require("nvim-tree.api")
    pcall(nvim_tree.tree.close)
    nvim_tree.tree.open(configPath)
    c("wincmd p")
  else
    print("Cannot find config folder")
  end
end

--- End open configuration nvi:w

function M.pythonPip(command)
  local cmd = string.format("!pip %s", command)
  c(cmd)
end

function M.OpenTerminal()
  c("split | terminal")
  c("resize 10")
end

function M.OpenTerminalVertical()
  c("vsplit | terminal")
end

return M

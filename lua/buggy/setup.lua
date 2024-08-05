local name = require("buggy.settings.namespace").namespace

require(name .. ".settings.plugin")
require(name .. ".settings.basic")
require(name .. ".maps.setup")

local plugin = require(name .. ".plugins.setup")
local themes = require(name .. ".themes.setup")

plugin.setup({
  autopairs = true,
  filemanager = true,
  autocompletion = true,
})

themes.setup({
  -- catppuccin or vscode or gruvbox
  themes = 'vscode',
})

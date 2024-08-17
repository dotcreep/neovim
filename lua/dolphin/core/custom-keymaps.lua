local expand = vim.fn.expand
local command = vim.api.nvim_create_user_command
local fun = require("dolphin.utils.functions")
local keymap = vim.keymap
--------------------------------------------------------
command("Setup", function()
  fun.openSetup()
end, { desc = "Open setup in horizontal" })

command("Vsetup", function()
  fun.openvSetup()
end, { desc = "Open setup in vertical" })

command("Rundev", function()
  fun.Rundev(expand("%"))
end, { desc = "Run program" })

command("OpenConfig", function()
  fun.openConfig()
end, { desc = "Open nvim config" })

command("Pip", function(opts)
  fun.pythonPip(opts.args)
end, { nargs = "+", desc = "Python pip" })

command("OpenTerminal", function()
  fun.OpenTerminal()
end, { desc = "Open Terminal" })

command("OpenTerminalVertical", function()
  fun.OpenTerminalVertical()
end, { desc = "Open Terminal" })

--------------------------------------------------------

keymap.set("n", "<leader>rr", ":Rundev<CR>", { desc = "Running program directly" })

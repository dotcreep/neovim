local expand = vim.fn.expand
local api = vim.api.nvim_create_user_command
local fun = require("chimera.utils.functions")
--------------------------------------------------------
--- Command
api("GitPush", function()
	fun.gitCommitPush()
end, { desc = "Git add, commit and push" })

api("Newbranch", function()
	fun.createBranch()
end, { desc = "Create new branch" })

api("Delbranch", function()
	fun.deleteBranch()
end, { desc = "Delete branch" })

api("Switchbranch", function()
	fun.switchBranch()
end, { desc = "Switch branch" })

api("Setup", function()
	fun.openSetup()
end, { desc = "Open setup in horizontal" })

api("Vsetup", function()
	fun.openvSetup()
end, { desc = "Open setup in vertical" })

api("Rundev", function()
	fun.Rundev(expand("%"))
end, { desc = "Run program" })

api("OpenConfig", function()
	fun.openConfig()
end, { desc = "Open nvim config" })

api("Pip", function(opts)
	fun.pythonPip(opts.args)
end, { nargs = "+", desc = "Python pip" })

api("OpenTerminal", function()
	fun.OpenTerminal()
end, { desc = "Open Terminal" })

api("OpenTerminalVertical", function()
	fun.OpenTerminalVertical()
end, { desc = "Open Terminal" })

--------------------------------------------------------

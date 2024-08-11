local expand = vim.fn.expand
local api = vim.api.nvim_create_user_command
local fun = require("chimera.utils.functions")
local map = vim.api.nvim_set_keymap
local o = { noremap = true, silent = true }
--------------------------------------------------------
--- Command
api("GitPush", function()
	fun.gitCommitPush()
end, { desc = "Git add, commit and push" })

api("Nbranch", function()
	fun.createBranch()
end, { desc = "Create new branch" })

api("Dbranch", function()
	fun.deleteBranch()
end, { desc = "Delete branch" })

api("Sbranch", function()
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
--- Begin Git Area
map("n", "<leader>gcp", ":GitPush<CR>", o)
map("n", "<leader>gb", ":Nbranch<CR>", o)
map("n", "<leader>gr", ":Dbranch()<CR>", o)
map("n", "<leader>gw", ":Sbranch()<CR>", o)
map("n", "<leader>gs", ":Gstatus<CR>", o)
map("n", "<leader>gd", ":Gdiffsplit<CR>", o)
map("n", "<leader>gc", ":Gcommit<CR>", o)
map("n", "<leader>gp", ":Gpush<CR>", o)
map("n", "<leader>gl", ":Gpull<CR>", o)
--- End Git Area

local expand = vim.fn.expand
local api = vim.api.nvim_create_user_command
local fun = require("chimera.utils.functions")
local map = vim.api.nvim_set_keymap
local o = { noremap = true, silent = true }
local keymap = vim.keymap
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
--- Begin Git Area
keymap.set("n", "<leader>gcp", ":GitPush<CR>", { desc = "Git push in one action" }, o)
keymap.set("n", "<leader>gb", ":Newbranch<CR>", { desc = "Create new branch" }, o)
keymap.set("n", "<leader>gr", ":Delbranch()<CR>", { desc = "Delete branch" }, o)
keymap.set("n", "<leader>gsw", ":Switchbranch()<CR>", { desc = "Switch branch" }, o)
keymap.set("n", "<leader>gs", ":Gstatus<CR>", { desc = "Git status" }, o)
keymap.set("n", "<leader>gd", ":Gdiffsplit<CR>", { desc = "Show different in split" }, o)
keymap.set("n", "<leader>gc", ":Gcommit<CR>", { desc = "Git commit" }, o)
keymap.set("n", "<leader>gp", ":Gpush<CR>", { desc = "Git push" }, o)
keymap.set("n", "<leader>gl", ":Gpull<CR>", { desc = "Git pull" }, o)
keymap.set("n", "<leader>gwr", ":Gwrite<CR>", { desc = "Git add / write" }, o)
--- End Git Area

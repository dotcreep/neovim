local expand = vim.fn.expand
local command = vim.api.nvim_create_user_command
local cmd = vim.cmd
local fun = require("dolphin.utils.functions")
local keymap = vim.keymap
--------------------------------------------------------
command("Setup", function()
	fun.openSetup()
end, { desc = "Open setup in horizontal" })

command("Vsetup", function()
	fun.openvSetup()
end, { desc = "Open setup in vertical" })

command("RunCode", function()
	local file = expand("%:t")
	local ext = file:match("^.+(%..+)$")
	local file_lang = '"' .. file .. '"'
	local run
	if ext == ".go" then
		run = "go run " .. file_lang
	elseif ext == ".py" then
		run = "python " .. file_lang
	elseif ext == ".js" then
		run = "node " .. file_lang
	elseif ext == ".java" then
		run = "java " .. file_lang
	elseif ext == ".sh" then
		run = "bash " .. file_lang
	else
		print("Unsupported file type")
		return
	end
	local dir = vim.fn.expand("%:p:h")
	cmd("split | terminal cd '" .. dir .. "' && " .. run)
	cmd("resize 10")
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

keymap.set("n", "<leader>rr", "<cmd>RunCode<CR>", { desc = "Running program directly" })

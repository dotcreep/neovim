return {
	"codota/tabnine-nvim",
	build = function()
		return vim.loop.os_uname().sysname == "Windows_NT" and "pwsh.exe -file .\\dl_binaries.ps1" or "./dl_binaries.sh"
	end,
	keys = {
		{ "n", "<leader>its", "<cmd>TabnineStatus<CR>", desc = "Status AI" },
		{ "n", "<leader>itd", "<cmd>TabnineDisable<CR>", desc = "Disable AI" },
		{ "n", "<leader>ite", "<cmd>TabnineEnable<CR>", desc = "Enable AI" },
		{ "n", "<leader>itt", "<cmd>TabnineToggle<CR>", desc = "Toggle AI" },
		{ "n", "<leader>itc", "<cmd>TabnineChat<CR>", desc = "Chat with AI" },
		{ "n", "<leader>itl", "<cmd>TabnineLoginWithAuthToken<CR>", desc = "Login AI with Auth Token" },
		{ "n", "<leader>itf", "<cmd>TabnineFix<CR>", desc = "Fix code with AI" },
		{ "n", "<leader>itT", "<cmd>TabnineTest<CR>", desc = "Generate tests for functionality" },
		{ "n", "<leader>itE", "<cmd>TabnineExplain<CR>", desc = "Explain functionality" },
	},
	config = function()
		require("tabnine").setup({
			disable_auto_comment = true,
			accept_keymap = "<Tab>",
			dismiss_keymap = "<C-]>",
			debounce_ms = 800,
			suggestion_color = { gui = "#808080", cterm = 244 },
			codelens_color = { gui = "#808080", cterm = 244 },
			codelens_enabled = true,
			exclude_filetypes = { "TelescopePrompt", "NvimTree" },
			log_file_path = nil, -- absolute path to Tabnine log file
			ignore_certificate_errors = false,
		})
	end,
}

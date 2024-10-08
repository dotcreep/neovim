return {
	"codota/tabnine-nvim",
	build = (function()
		return vim.uv.os_uname().sysname == "Windows_NT" and "pwsh.exe -file .\\dl_binaries.ps1" or "./dl_binaries.sh"
	end)(),
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
			log_file_path = nil,
			ignore_certificate_errors = false,
		})
		local keymap = vim.keymap
		keymap.set("n", "<leader>its", "<cmd>TabnineStatus<CR>", { desc = "Status AI" })
		keymap.set("n", "<leader>itd", "<cmd>TabnineDisable<CR>", { desc = "Disable AI" })
		keymap.set("n", "<leader>ite", "<cmd>TabnineEnable<CR>", { desc = "Enable AI" })
		keymap.set("n", "<leader>itt", "<cmd>TabnineToggle<CR>", { desc = "Toggle AI" })
		keymap.set("n", "<leader>itc", "<cmd>TabnineChat<CR>", { desc = "Chat with AI" })
		keymap.set("n", "<leader>itl", "<cmd>TabnineLoginWithAuthToken<CR>", { desc = "Login AI with Auth Token" })
		keymap.set("n", "<leader>itf", "<cmd>TabnineFix<CR>", { desc = "Fix code with AI" })
		keymap.set("n", "<leader>itT", "<cmd>TabnineTest<CR>", { desc = "Generate tests for functionality" })
		keymap.set("n", "<leader>itE", "<cmd>TabnineExplain<CR>", { desc = "Explain functionality" })
		keymap.set("n", "<leader>ith", "<cmd>TabnineHub<CR>", { desc = "Hub functionality" })
	end,
}

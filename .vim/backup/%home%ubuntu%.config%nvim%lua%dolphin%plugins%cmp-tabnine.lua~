return {
	"tzachar/cmp-tabnine",
	build = function()
		return vim.loop.os_uname().sysname == "Windows_NT" and "pwsh.exe -file .\\install.ps1" or "./install.sh"
	end,
	dependencies = "hrsh7th/nvim-cmp",
	opts = {
		max_lines = 1000,
		max_num_results = 3,
		sort = true,
	},
	config = function(_, opts)
		require("cmp_tabnine.config"):setup(opts)
	end,
}

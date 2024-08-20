return {
	"tzachar/cmp-tabnine",
	build = (function()
		if vim.loop.os_uname().sysname == "windows_nt" then
			return "pwsh.exe -file .\\install.ps1"
		else
			return "./install.sh"
		end
	end)(),
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

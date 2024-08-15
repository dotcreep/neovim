return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local file_symbols = {
			py = "", -- Python
			js = "", -- JavaScript / Node.js
			go = "󰟓", -- Golang
			lua = "", -- Lua
			c = "󰙱", -- C
			cpp = "󰙲", -- C++
			cs = "󰌛", -- C#
			css = "", -- CSS
			html = "", -- HTML
			rb = "", -- Ruby
			rs = "", -- Rust
			r = "", -- R
			md = "", -- Markdown
			sh = "󱆃", -- Bash
			ino = "", -- Arduino
			yml = "", -- YAML
			json = "", -- JSON
			php = "󰌟", -- PHP
			ps1 = "", -- PowerShell
			pp = "", -- Puppet
			sql = "", -- SQL
			tf = "", -- Terraform
			ts = "󰛦", -- TypeScript
			vue = "", -- Vue.js
			java = "", -- Java
			kt = "", -- Kotlin
			gradle = "", -- Gradle
			dart = "", -- Dart
			dockerfile = "", -- Docker
			helm = "󱃾", -- Helm
			angular = "󰚿", -- AngularJS
			azure = "", -- Azure Pipeline
			cmake = "", -- CMake
			vim = "", -- Vimscript
		}
		local function get_file_symbol(ext)
			return file_symbols[ext] or ""
		end
		require("lualine").setup({
			options = {
				icons_enabled = true,
				theme = "auto",
				section_separators = { left = "", right = "" },
				component_separators = { left = "", right = "" },
				disabled_filetypes = {
					statusline = {},
					winbar = {},
				},
				ignore_focus = {},
				always_divide_middle = true,
				globalstatus = false,
				refresh = {
					statusline = 1000,
					tabline = 1000,
					winbar = 1000,
				},
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff" },
				lualine_c = {
					{ "diagnostics" },
					{
						"filename",
						fmt = function(filename)
							local ext = vim.fn.expand("%:e")
							local symbol = get_file_symbol(ext)
							return symbol .. " " .. filename
						end,
					},
				},
				lualine_x = { "encoding", "fileformat", "filetype" },
				lualine_y = {
					function()
						local progress = "%3p%%"
						local location = "%l:%v"
						return progress .. " " .. location
					end,
				},
				lualine_z = {
					{
						'os.date("%H:%M")',
					},
				},
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {},
			winbar = {},
			inactive_winbar = {},
			extensions = {},
		})
	end,
}

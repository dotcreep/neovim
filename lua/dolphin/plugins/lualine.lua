return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local function progress_bar()
			local current_line = vim.fn.line(".")
			local total_lines = vim.fn.line("$")
			local chars = { "▁", "▂", "▃", "▄", "▅", "▆", "▇", "█" }
			local line_ratio = current_line / total_lines
			local index = math.ceil(line_ratio * #chars)
			return chars[index]
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
				always_divide_middle = false,
				globalstatus = true,
				refresh = {
					statusline = 1000,
					tabline = 1000,
					winbar = 1000,
				},
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = {
					"branch",
				},
				lualine_c = {
					{
						"diff",
						symbols = {
							added = " ",
							modified = "柳",
							removed = " ",
						},
						diff_color = {
							added = {
								fg = "#2da44e",
							},
							modified = {
								fg = "#e16f24",
							},
							removed = {
								fg = "#fa4549",
							},
						},
					},
					{
						"diagnostics",
						symbols = {
							error = " ", -- Ikon untuk kesalahan
							warn = " ", -- Ikon untuk peringatan
							info = " ", -- Ikon untuk informasi
							hint = " ", -- Ikon untuk petunjuk
						},
					},
					{
						"filename",
						fmt = function(filename)
							local ext = vim.fn.expand("%:e")
							local symbol = require("nvim-web-devicons").get_icon(ext, "", { default = true })
							return "%=" .. symbol .. " " .. filename
						end,
					},
				},
				lualine_x = { "encoding", "fileformat", "filetype" },
				lualine_y = {
					function()
						local location = "%l:%v"
						return progress_bar() .. " " .. location
					end,
				},
				lualine_z = {
					{
						function()
							return "" .. " " .. os.date("%H:%M")
						end,
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

return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		require("bufferline").setup({
			options = {
				groups = {
					items = {
						require("bufferline.groups").builtin.pinned:with({ icon = "" }),
					},
				},
				offsets = {
					{
						filetype = "NvimTree",
						text = "File Explorer",
						highlight = "Directory",
						text_align = "left",
					},
				},
				show_buffer_close_icons = true,
				show_close_icon = true,
				separator_style = "slant",
				-- diagnostics = "nvim_lsp",
				-- diagnostics_update_in_insert = false,
				-- custom_areas = {
				-- 	right = function()
				-- 		return {
				-- 			{
				-- 				text = "LSP: " .. vim.lsp.get_active_clients()[1].name,
				-- 				highlight = "BufferLineIndicatorSelected",
				-- 			},
				-- 		}
				-- 	end,
				-- },
			},
			-- highlights = {
			-- 	background = {
			-- 		fg = "#ffffff",
			-- 		bg = "#282c34",
			-- 	},
			-- 	buffer_visible = {
			-- 		fg = "#98c379",
			-- 		bg = "#282c34",
			-- 	},
			-- 	buffer_selected = {
			-- 		fg = "#61afef",
			-- 		bg = "#282c34",
			-- 		bold = true,
			-- 		italic = true,
			-- 	},
			-- 	indicator_selected = {
			-- 		fg = "#e06c75", -- Example color for LSP indicator
			-- 	},
			-- },
			vim.keymap.set(
				"n",
				"<leader>bp",
				":BufferLineTogglePin<CR>",
				{ noremap = true, silent = true, desc = "Pin Buffer" }
			),
		})
	end,
}

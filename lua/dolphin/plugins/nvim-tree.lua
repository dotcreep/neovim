return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("nvim-tree").setup({
			open_on_tab = true, -- Open in new tab
			git = {
				enable = true,
				ignore = false,
				timeout = 400,
			},
			view = {
				width = 30,
				side = "left",
				number = false,
				relativenumber = false,
				signcolumn = "yes",
			},
			actions = {
				open_file = {
					quit_on_open = false,
					window_picker = {
						enable = true,
					},
				},
			},
			filters = {
				dotfiles = true, -- hide the dotfiles
				custom = {},
				exclude = {
					".gitignore",
					".env",
					".bashrc",
					".zshrc",
					".editorconfig",
					".eslintignore",
					".prettierignore",
					".dockerignore",
					".config",
				},
			},
			diagnostics = {
				enable = true,
				icons = {
					hint = "",
					info = "",
					warning = "",
					error = "",
				},
			},
			renderer = {
				add_trailing = false, -- add '/' in the back of folder name
				group_empty = true, -- if folder empty will grouped in single line
				highlight_git = true,
				full_name = false,
				highlight_opened_files = "all", -- none, name, icon, all
				root_folder_modifier = ":~",
				indent_markers = {
					enable = true,
					icons = {
						corner = "└",
						edge = "│",
						item = "├",
						none = "  ",
					},
				},
				icons = {
					webdev_colors = true,
					git_placement = "before",
					padding = " ",
					symlink_arrow = " ➛ ",
					diagnostics_placement = "signcolumn",
					show = {
						file = true,
						folder = true,
						folder_arrow = true,
						git = true,
					},
					glyphs = {
						default = "",
						symlink = "",
						folder = {
							arrow_closed = "",
							arrow_open = "",
							default = "",
							open = "",
							empty = "󱧸",
							empty_open = "",
							symlink = "",
							symlink_open = "",
						},
						git = {
							unstaged = "✗",
							staged = "✓",
							unmerged = "",
							renamed = "➜",
							untracked = "★",
							deleted = "",
							ignored = "◌",
						},
					},
				},
				special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
			},
		})
		require("nvim-web-devicons").setup({
			override = {
				zsh = {
					icon = "",
					color = "#428850",
					cterm_color = "65",
					name = "Zsh",
				},
			},
			color_icons = true,
			default = true,
			strict = true,
			override_by_filename = {
				[".gitignore"] = {
					icon = "",
					color = "#f1502f",
					name = "Gitignore",
				},
			},
		})
		-- Keymaps
		local keymap = vim.keymap
		local o = { noremap = true, silent = true }
		keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Open file explorer" }, o)
		keymap.set("n", "<leader>tr", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh NvimTree" }, o)
		keymap.set("n", "<leader>tf", "<cmd>NvimTreeFindFile<CR>", { desc = "Find File in NvimTree" }, o)
	end,
}

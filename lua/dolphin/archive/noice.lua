return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		"echasnovski/mini.nvim",
		"MunifTanjim/nui.nvim",
		"hrsh7th/nvim-cmp",
		"rcarriga/nvim-notify",
	},
	enable = true,
	opts = {
		mini = true,
		cmdline = {
			enabled = true,
			view = "cmdline_popup",
			opts = {},
			format = {
				cmdline = { pattern = "^:", icon = "", lang = "vim" },
				search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
				search_up = { kind = "search", pattern = "^?", icon = " ", lang = "regex" },
				filter = { pattern = "^:%s*!", icon = "", lang = "bash" },
				input = {},
			},
		},
		message = {
			enabled = true,
			view = "notify",
			view_error = "notify",
			view_warn = "notify",
			view_history = "message",
		},
		popup_menu = {
			enabled = true,
			backend = "cmp",
			kind_icons = {},
		},
		redirect = {
			view = "popup",
			filter = { event = "msg_show" },
		},
		command = {
			history = {
				view = "split",
				opts = { enter = true, format = "details" },
				filter = {
					any = {
						{ event = "notify" },
						{ error = true },
						{ warning = true },
						{ event = "msg_show", kind = { "" } },
						{ event = "lsp", kind = "message" },
					},
				},
			},
			last = {
				view = "popup",
				opts = { enter = true, format = "details" },
				filter = {
					any = {
						{ event = "notify" },
						{ error = true },
						{ warning = true },
						{ event = "msg_show", kind = { "" } },
						{ event = "lsp", kind = "message" },
					},
				},
			},
			errors = {
				view = "popup",
				opts = { enter = true, format = "details" },
				filter = { error = true },
				filter_opts = { reverse = true },
			},
		},
		notify = {
			enable = true,
			animation = false,
			view = "notify",
		},
		lsp = {
			progress = {
				enabled = true,
				format = "lsp_progress",
				format_done = "lsp_progress_done",
				view = "mini",
				throttle = 1000 / 30,
			},
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
				["cmp.entry.get_documentation"] = true,
			},
			hover = {
				enabled = true,
				view = nil,
				opts = {},
			},
			signature = {
				enabled = true,
				auto_open = {
					enabled = true,
					trigger = true,
					luasnip = true,
					throttle = 50,
					severity = {
						min = vim.diagnostic.severity.HINT,
					},
				},
				view = nil,
				opts = {},
			},
			message = {
				enabled = true,
				view = "notify",
				opts = {},
			},
			documentation = {
				view = "hover",
				opts = {
					lang = "markdown",
					replace = true,
					render = "plain",
					format = {
						"{message}",
						win_options = {
							concealcursor = "n",
							conceallevel = 3,
						},
					},
				},
			},
		},
		markdown = {
			hover = {
				["|(%S-)|"] = vim.cmd.help,
				["%[.-%]%((%S-)%)"] = require("noice.util").open,
			},
			highlight = {
				["|%S-|"] = "@text.reference",
				["@%S+"] = "@parameter",
				["^%s*(Parameters:)"] = "@text.title",
				["^%s*(Return:)"] = "@text.title",
				["^%s*(See also:)"] = "@text.title",
				["{%S-}"] = "@parameter",
			},
		},
		health = {
			checker = true,
		},
		smart_move = {
			enabled = true,
			exclude_filetype = { "cmp-menu", "cmp_docs", "notify" },
		},
		present = {
			bottom_search = false,
			command_palette = false,
			long_message_to_split = false,
			inc_rename = false,
			lsp_doc_border = true,
		},
		throttle = 1000 / 30,
		view = {
			cmdline_popup = {
				position = {
					row = 5,
					col = "50%",
				},
				size = {
					width = 60,
					height = "auto",
				},
				border = {
					style = {
						top_left = "╭",
						top = "─",
						top_right = "╮",
						left = "│",
						right = "│",
						bottom_left = "╰",
						bottom = "─",
						bottom_right = "╯",
					},
				},
			},
			popup_menu = {
				relative = "editor",
				position = {
					row = 8,
					col = "50%",
				},
				size = {
					width = 60,
					height = "autp",
				},
				border = {
					style = {
						top_left = "╭",
						top = "─",
						top_right = "╮",
						left = "│",
						right = "│",
						bottom_left = "╰",
						bottom = "─",
						bottom_right = "╯",
					},
					padding = { 0, 1 },
				},
				win_options = {
					winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
				},
			},
		},
		routes = {
			filter = {
				event = "msg_show",
				kind = "search_count",
				any = {
					{ find = "%d+L, %d+B" },
					{ find = "; after #%d+" },
					{ find = "; before #%d+" },
				},
			},
			view = "mini",
			opts = { skip = true },
		},
	},
	config = function(_, opts)
		if vim.o.filetype == "lazy" then
			vim.cmd([[messages clear]])
		end
		require("noice").setup(opts)
		-- vim.notify = require("fidget").notify
		-- require("fidget").setup({})
		vim.notify = require("notify")
		require("notify").setup({
			background_color = "Normal",
			fpd = 30,
			level = 2,
			minimum_width = 50,
			render = "minimal",
			stages = "fade_in_slide_out",
			timeout = 3000,
		})
	end,
}

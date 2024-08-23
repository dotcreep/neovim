return {
	"j-hui/fidget.nvim",
	opts = {
		text = {
			spinner = "pipe", -- Animation shown when tasks are ongoing
			done = "✔", -- Character shown when all tasks are complete
			commenced = "Started", -- Message shown when task starts
			completed = "Completed", -- Message shown when task completes
		},

		-- Window options
		window = {
			relative = "win", -- Where to anchor the window (editor, win, cursor)
			blend = 0, -- &winblend for the window
			zindex = nil, -- Priority of the window
			border = "none", -- Border around the window (none, single, double, rounded, solid, shadow)
		},

		-- Formatting options
		fmt = {
			leftpad = true, -- Whether to left-pad the text in fidget's floating window
			stack_upwards = true, -- Whether new lines should be stacked upwards
			max_width = 0, -- Maximum width of the fidget box
			fidget = function(fidget_name, spinner)
				return string.format("%s %s", spinner, fidget_name)
			end,
		},

		-- Timer options
		timer = {
			spinner_rate = 125, -- Frame rate of spinner animation, in ms
			fidget_decay = 2000, -- How long to keep around empty fidget, in ms
			task_decay = 5000, -- How long to keep around completed task, in ms
		},

		-- Notification options
		notification = {
			window = {
				winblend = 0, -- &winblend for the window
				border = "none", -- Border around the window (none, single, double, rounded, solid, shadow)
			},
			view = {
				stack_upwards = true, -- Display notification items from bottom to top
				icon_separator = " ", -- Separator between group name and icon
				group_separator = "---", -- Separator between different notification groups
				group_separator_hl = "Comment", -- Highlight group for group separator
			},
			override_vim_notify = false, -- Override the default vim.notify function with Fidget's notification system
		},

		-- Progress options
		progress = {
			poll_rate = 0, -- How frequently to poll for progress messages (in ms, default: 0 = as fast as possible)
			suppress_on_insert = false, -- Suppress new messages while in insert mode
			ignore_done_already = false, -- Ignore new tasks that are already complete
			ignore_empty_message = false, -- Ignore new tasks that don't contain a message
			clear_on_detach = function(client_id)
				return vim.tbl_contains({ "tsserver", "eslint" }, vim.lsp.get_client_by_id(client_id).name)
			end,
		},

		-- Display options
		display = {
			done_style = "Constant", -- Highlight group for completed tasks
			progress_style = "Normal", -- Highlight group for progress updates
			group_style = "Title", -- Highlight group for group titles
			icon_style = "Question", -- Highlight group for task icons
			priority = 30, -- Priority of the fidget window
			parse_messages = { -- Define how to extract progress messages
				lsp = {
					pattern = "^(%d+)%%",
					groups = { "percentage" },
				},
				npm = {
					pattern = "(%d+)/(%d+)",
					groups = { "done", "total" },
				},
			},
		},

		-- LSP options
		sources = { -- Sources to configure
			["*"] = { -- Name of source
				ignore = false, -- Ignore notifications from this source
			},
		},
	},

	config = function()
		--	local fidget = require("fidget")
		--
		--	vim.keymap.set("n", "A", function()
		--		fidget.notify("This is from fidget.notify().")
		--	end)
		--
		--	vim.keymap.set("n", "B", function()
		--		fidget.notify("This is also from fidget.notify().", vim.log.levels.WARN)
		--	end)
		--
		--	vim.keymap.set("n", "C", function()
		--		fidget.notify("fidget.notify() supports annotations...", nil, { annote = "MY NOTE", key = "foobar" })
		--	end)
		--
		--	vim.keymap.set("n", "D", function()
		--		fidget.notify(nil, vim.log.levels.ERROR, { annote = "bottom text", key = "foobar" })
		--		fidget.notify("... and overwriting notifications.", vim.log.levels.WARN, { annote = "YOUR AD HERE" })
		--	end)
	end,
}

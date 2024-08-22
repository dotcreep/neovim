return {
	"Exafunction/codeium.vim",
	event = "BufEnter",
	config = function()
		local keymap = vim.keymap
		local fn = vim.fn
		keymap.set("i", "<Tab>", function()
			return fn["codeium#Accept"]()
		end, { expr = true, silent = true })
		keymap.set("i", "<C-S-k>", function()
			return fn["codeium#CycleCompletions"](1)
		end, { expr = true, silent = true })
		keymap.set("i", "<C-S-j>", function()
			return fn["codeium#CycleCompletions"](-1)
		end, { expr = true, silent = true })
		keymap.set("i", "<C-S-c>", function()
			return fn["codeium#Clear"]()
		end, { expr = true, silent = true })
	end,
}

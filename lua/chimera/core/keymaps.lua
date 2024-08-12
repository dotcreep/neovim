vim.g.mapleader = " "

local keymap = vim.keymap
local o = { noremap = true, silent = true }

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlight" })

keymap.set("n", "<leader>rt", ":source %<CR>", { desc = "Reload" })

-- Basic Key
keymap.set("n", "<C-a>", "ggVG", { desc = "Select all text" }, o)
keymap.set("n", "<C-s>", ":w<CR>", { desc = "Save file" }, o)

-- Tab Navigation
keymap.set("n", "<leader>tn", "<cmd>tabnew<CR>", { desc = "Open new tab" }, o)
keymap.set("n", "<leader>tc", "<cmd>BufferLineCyclePrev<CR><cmd>bd #<CR>", { desc = "Close current tab" }, o)
keymap.set("n", "<leader>tl", "<cmd>tabn<CR>", { desc = "Go to next tab" }, o)
keymap.set("n", "<leader>th", "<cmd>tabp<CR>", { desc = "Go to previous tab" }, o)
keymap.set("n", "<leader>tt", "<cmd>tabnew %<CR>", { desc = "Open in new tab" }, o)

keymap.set("n", "<C-PageUp>", "<cmd>BufferLineCyclePrev<CR>", { desc = "Switch to left tab" }, o)
keymap.set("n", "<C-PageDown>", "<cmd>BufferLineCycleNext<CR>", { desc = "Switch to right tab" }, o)

-- Window Management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertical" }, o)
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontal" }, o)
-- keymap.set('n', '<leader>se', '<C-w>=', { desc = 'Make split equal size' }, o)
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }, o)
keymap.set("n", "<C-h>", ":vertical resize +2<CR>", { desc = "Resize window" }, o)
keymap.set("n", "<C-l>", ":vertical resize -2<CR>", { desc = "Resize window" }, o)
keymap.set("n", "<C-k>", ":resize +2<CR>", { desc = "Resize window" }, o)
keymap.set("n", "<C-j>", ":resize -2<CR>", { desc = "Resize window" }, o)

-- Switch Window
keymap.set("n", "<C-A-Left>", "<C-w>h", { desc = "Switch window to left" }, o)
keymap.set("n", "<C-A-Right>", "<C-w>l", { desc = "Switch window to right" }, o)
keymap.set("n", "<C-A-Up>", "<C-w>k", { desc = "Switch winoow to above" }, o)
keymap.set("n", "<C-A-Down>", "<C-w>j", { desc = "Switch window to below" }, o)
keymap.set("n", "<C-A-h>", "<C-w>h", { desc = "Switch window to left" }, o)
keymap.set("n", "<C-A-l>", "<C-w>l", { desc = "Switch window to right" }, o)
keymap.set("n", "<C-A-k>", "<C-w>k", { desc = "Switch window to above" }, o)
keymap.set("n", "<C-A-j>", "<C-w>j", { desc = "Switch window to below" }, o)

-- File Explorer
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle File Explorer" }, o)

--- Resize Split Tab
keymap.set("n", "<C-h>", ":vertical resize +2<CR>", { desc = "Increase size vertical split window" }, o)
keymap.set("n", "<C-l>", ":vertical resize -2<CR>", { desc = "Decrease size vertical split window" }, o)
keymap.set("n", "<C-k>", ":resize +2<CR>", { desc = "Increase size horizontal split window" }, o)
keymap.set("n", "<C-j>", ":resize -2<CR>", { desc = "Decrease size horizontal split window" }, o)

--- Open Terminal
keymap.set("n", "<leader>tv", ":OpenTerminalVertical<CR>", { desc = "Open terminal in vertical" }, o)
keymap.set("n", "<leader>ts", ":OpenTerminal<CR>", { desc = "Open terminal in horizontal" }, o)
keymap.set("n", "<leader>te", ":ToggleTerm<CR>", { desc = "Open terminal" }, o)

------------------------------------------------------------------------

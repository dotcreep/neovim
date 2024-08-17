local keymap = vim.keymap

-- Basic Key
keymap.set("n", "<leader>nh", "<cmd>nohl<CR>", { desc = "Clear search highlight" })
keymap.set("n", "<leader>rt", "<cmd>source %<CR>", { desc = "Reload" })
keymap.set("n", "<C-a>", "ggVG", { desc = "Select all text" })
keymap.set("i", "<C-a>", "<Esc>ggVG", { desc = "Select all text" })
keymap.set("i", "<C-s>", "<Esc><cmd>w<CR>", { desc = "Save file" })
keymap.set("n", "<C-s>", "<cmd>w<CR>", { desc = "Save file" })
keymap.set("n", "<leader>cc", ":%s///g", { desc = "Replace text" })

-- Tab Navigation
keymap.set("n", "<leader>tt", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>tt", "<cmd>tabnew %<CR>", { desc = "Open in new tab" })

-- Window Management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertical" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontal" })
keymap.set('n', '<leader>se', '<C-w>=', { desc = 'Make split equal size' })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })
keymap.set("n", "<C-h>", "<cmd>vertical resize +2<CR>", { desc = "Resize window" })
keymap.set("n", "<C-l>", "<cmd>vertical resize -2<CR>", { desc = "Resize window" })
keymap.set("n", "<C-k>", "<cmd>resize +2<CR>", { desc = "Resize window" })
keymap.set("n", "<C-j>", "<cmd>resize -2<CR>", { desc = "Resize window" })

-- Switch Window
keymap.set("n", "<C-A-Left>", "<C-w>h", { desc = "Switch window to left" })
keymap.set("n", "<C-A-Right>", "<C-w>l", { desc = "Switch window to right" })
keymap.set("n", "<C-A-Up>", "<C-w>k", { desc = "Switch winoow to above" })
keymap.set("n", "<C-A-Down>", "<C-w>j", { desc = "Switch window to below" })
keymap.set("n", "<C-A-h>", "<C-w>h", { desc = "Switch window to left" })
keymap.set("n", "<C-A-l>", "<C-w>l", { desc = "Switch window to right" })
keymap.set("n", "<C-A-k>", "<C-w>k", { desc = "Switch window to above" })
keymap.set("n", "<C-A-j>", "<C-w>j", { desc = "Switch window to below" })

--- Resize Split Tab
keymap.set("n", "<C-h>", "<cmd>vertical resize +2<CR>", { desc = "Increase size vertical split window" })
keymap.set("n", "<C-l>", "<cmd>vertical resize -2<CR>", { desc = "Decrease size vertical split window" })
keymap.set("n", "<C-k>", "<cmd>resize +2<CR>", { desc = "Increase size horizontal split window" })
keymap.set("n", "<C-j>", "<cmd>resize -2<CR>", { desc = "Decrease size horizontal split window" })

--- Open Terminal
keymap.set("n", "<leader>tv", "<cmd>OpenTerminalVertical<CR>", { desc = "Open terminal in vertical" })
keymap.set("n", "<leader>ts", "<cmd>OpenTerminal<CR>", { desc = "Open terminal in horizontal" })
keymap.set("n", "<leader>te", "<cmd>ToggleTerm<CR>", { desc = "Open terminal" })

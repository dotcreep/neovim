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
keymap.set("n", "<leader>tc", "<cmd>tabclose<CR>", { desc = "Close current tab" }, o)
keymap.set("n", "<leader>tl", "<cmd>tabn<CR>", { desc = "Go to next tab" }, o)
keymap.set("n", "<leader>th", "<cmd>tabp<CR>", { desc = "Go to previous tab" }, o)
keymap.set("n", "<leader>tt", "<cmd>tabnew %<CR>", { desc = "Open in new tab" }, o)

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
keymap.set("n", "<C-A-Left>", "<C-w>h", o)
keymap.set("n", "<C-A-Right>", "<C-w>l", o)
keymap.set("n", "<C-A-Up>", "<C-w>k", o)
keymap.set("n", "<C-A-Down>", "<C-w>j", o)
keymap.set("n", "<C-A-h>", "<C-w>h", o)
keymap.set("n", "<C-A-l>", "<C-w>l", o)
keymap.set("n", "<C-A-k>", "<C-w>k", o)
keymap.set("n", "<C-A-j>", "<C-w>j", o)

-- File Explorer
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", o)

--- Resize Split Tab
keymap.set("n", "<C-h>", ":vertical resize +2<CR>", o)
keymap.set("n", "<C-l>", ":vertical resize -2<CR>", o)
keymap.set("n", "<C-k>", ":resize +2<CR>", o)
keymap.set("n", "<C-j>", ":resize -2<CR>", o)

------------------------------------------------------------------------
--- Third Party

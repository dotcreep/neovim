-- File Explorer
vim.api.nvim_set_keymap('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

-- Open File in split
vim.api.nvim_set_keymap('n', '<leader>sv', ':lua short.openVerticalSplit()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>sh', ':lua short.openHorizontalSplit()<CR>', { noremap = true, silent = true })

-- Open Help Documents
vim.api.nvim_set_keymap('n', '<leader>h', ':Helpright<CR>', { noremap = true, silent = true })

-- Tab Navigation
vim.api.nvim_set_keymap('n', '<leader>t', ':tabnew<CR>', { noremap = true, silent = true })


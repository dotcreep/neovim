-- File Explorer
vim.api.nvim_set_keymap('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

-- Open File in split
vim.api.nvim_set_keymap('n', '<leader>sv', ':lua short.openVerticalSplit()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>sh', ':lua short.openHorizontalSplit()<CR>', { noremap = true, silent = true })

-- Open Help Documents
vim.api.nvim_set_keymap('n', '<leader>h', ':Helpright<CR>', { noremap = true, silent = true })

-- Tab Navigation
vim.api.nvim_set_keymap('n', '<leader>t', ':tabnew<CR>', { noremap = true, silent = true })

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- Git Intergration
vim.api.nvim_set_keymap('n', '<leader>gs', ':Gstatus<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>gd', ':Gdiffsplit<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>gc', ':Gcommit<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>gp', ':Gpush<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>gl', ':Gpull<CR>', { noremap = true, silent = true })

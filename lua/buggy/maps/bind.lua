--------------------------------------------------------
--- Variable
local map = vim.api.nvim_set_keymap
local expand = vim.fn.expand
local set = vim.keymap.set
local opts = { noremap = true, silent = true }
local api = vim.api.nvim_create_user_command
local fun = require('buggy.maps.func')
--------------------------------------------------------
--- Command
api('GitPush', function()
  fun.gitCommitPush()
end, { desc = 'Git add, commit and push' })

api('Nbranch', function()
  fun.createBranch()
end, { desc = 'Create new branch' })

api('Dbranch', function()
  fun.deleteBranch()
end, { desc = 'Delete branch' })

api('Sbranch', function()
  fun.switchBranch()
end, { desc = 'Switch branch' })

api('Setup', function()
  fun.openSetup()
end, { desc = 'Open setup in horizontal' })

api('Vsetup', function()
  fun.openvSetup()
end, { desc = 'Open setup in vertical' })

api('Rundev', function()
  fun.Rundev(expand("%"))
end, { desc = 'Run program' })

api('OpenConfig', function()
  fun.openConfig()
end, { desc = 'Open nvim config' })
--------------------------------------------------------
--- KeyMaps
--- Begin Git Area
map('n', '<leader>gcp', ':GitPush<CR>', opts)
map('n', '<leader>gb', ':Nbranch<CR>', opts)
map('n', '<leader>gr', ':Dbranch()<CR>', opts)
map('n', '<leader>gw', ':Sbranch()<CR>', opts)
map('n', '<leader>gs', ':Gstatus<CR>', opts)
map('n', '<leader>gd', ':Gdiffsplit<CR>', opts)
map('n', '<leader>gc', ':Gcommit<CR>', opts)
map('n', '<leader>gp', ':Gpush<CR>', opts)
map('n', '<leader>gl', ':Gpull<CR>', opts)
--- End Git Area

--- File Explorer
map('n', '<leader>e', ':NvimTreeToggle<CR>', opts)

-- Open file setup
map('n', '<leader>sth', ':Setup<CR>', opts)
map('n', '<leader>stv', ':Vsetup<CR>', opts)

-- Open nvim config folder
map('n', '<leader>oc', ':OpenConfig<CR>', opts)

-- Running program
map('n', '<leader>rd', ':Rundev<CR>', opts)

--- Open file in split mode
-- map('n', '<leader>sv', ':lua short.openVerticalSplit()<CR>', opts)
-- map('n', '<leader>sh', ':lua short.openHorizontalSplit()<CR>', opts)

--- Tab navigation
map('n', '<leader>t', ':tabnew<CR>', opts)

--- Telescope
local builtin = require('telescope.builtin')

set('n', '<leader>ff', builtin.find_files, {})
set('n', '<leader>fg', builtin.live_grep, {})
set('n', '<leader>fb', builtin.buffers, {})
set('n', '<leader>fh', builtin.help_tags, {})
---

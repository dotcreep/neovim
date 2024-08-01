local help = require('shortcut')


-- Use ':S1' for install plugin
vim.api.nvim_create_user_command('S1', function()
  vim.cmd('PackerInstall')
end, {})

-- Use
vim.api.nvim_create_user_command('Helpbot', function()
  help.openHelpBot()
end, { desc = 'Open help.md in a vertical split'})

-- Use
vim.api.nvim_create_user_command('Helpright', function()
  help.openHelpRight()
end, { desc = 'Open help.md in a horizon split'})



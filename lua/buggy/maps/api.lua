vim.api.nvim_create_user_command('S1', function()
  vim.cmd('PackerInstall')
end, {})

vim.api.nvim_create_user_command('S0', function()
  vim.cmd('PackerSync')
end, {})

vim.api.nvim_create_user_command('Helpbot', function()
  short.openHelpBot()
end, { desc = 'Open help.md in a vertical split'})

vim.api.nvim_create_user_command('Helpright', function()
  short.openHelpRight()
end, { desc = 'Open help.md in a horizon split'})

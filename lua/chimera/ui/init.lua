local M = {}

M.setup = function(config)
  local specs = {}
  if config.colorscheme == 'gruvbox' then
    table.insert(specs, { import = 'chimera.ui.colorscheme.gruvbox' })
  elseif config.colorscheme == 'catppuccin' then
    table.insert(specs, { import = 'chimera.ui.colorscheme.catppuccin' })
  end

  if config.statusline == 'feline' then
    table.insert(specs, { import = 'chimera.ui.statusline.feline' })
  elseif config.statusline == 'lualine' then
    table.insert(specs, { import = 'chimera.ui.statusline.lualine' })
  end
  return specs
end

return M

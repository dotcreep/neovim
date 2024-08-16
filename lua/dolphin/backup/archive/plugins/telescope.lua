return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim'
  },
  config = function()
    local builtin = require('telescope.builtin')
    local keymap = vim.keymap
    keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Find files" })
    keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "Live grep for text" })
    keymap.set('n', '<leader>fb', builtin.buffers, { desc = "Live open buffer" })
    keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "Find help tags" })
  end
}

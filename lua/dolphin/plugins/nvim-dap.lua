return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
    -- DAP LIST IN BELOW
    "mfussenegger/nvim-dap-python", -- Python
    "leoluz/nvim-dap-go",           -- Golang
    "suketa/nvim-dap-ruby",         -- Ruby
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")
    dapui.setup()
    -- NOTE List of Languages
    -- Ansible                            -- python -m pip install ansibug
    require("dap-python").setup("python") -- python -m pip install debugpy
    require('dap-go').setup()             -- go install github.com/go-delve/delve/cmd/dlv@latest
    require("dap-ruby").setup()           -- Add debug to your Gemfile
    ------------------
    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end
    local keymap = vim.keymap
    keymap.set("n", "<leader>dt", dap.toggle_breakpoint, { desc = "Debug Toggle Breakpoint" })
    keymap.set("n", "<leader>ds", dap.continue, { desc = "Debug Start" })
    keymap.set("n", "<leader>dc", dapui.close, { desc = "Debug Close" })
  end
}

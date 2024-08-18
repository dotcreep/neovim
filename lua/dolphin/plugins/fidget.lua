return {
  "j-hui/fidget.nvim",
  opts = {
    -- Options related to LSP progress subsystem
    progress = {
      poll_rate = 0,                -- How and when to poll for progress messages
      suppress_on_insert = false,   -- Suppress new messages while in insert mode
      ignore_done_already = false,  -- Ignore new tasks that are already complete
      ignore_empty_message = false, -- Ignore new tasks that don't contain a message
      clear_on_detach =             -- Clear notification group when LSP server detaches
          function(client_id)
            local client = vim.lsp.get_client_by_id(client_id)
            return client and client.name or nil
          end,
      notification_group = -- How to get a progress message's notification group key
          function(msg) return msg.lsp_client.name end,
      ignore = {},         -- List of LSP servers to ignore

      -- Options related to Neovim's built-in LSP client
      lsp = {
        progress_ringbuf_size = 0, -- Configure the nvim's LSP progress ring buffer size
        log_handler = false,       -- Log `$/progress` handler invocations (for debugging)
      },
    },

    -- Options related to integrating with other plugins
    integration = {
      ["nvim-tree"] = {
        enable = true, -- Integrate with nvim-tree/nvim-tree.lua (if installed)
      },
      ["xcodebuild-nvim"] = {
        enable = true, -- Integrate with wojciech-kulik/xcodebuild.nvim (if installed)
      },
    },
    timer = {
      spinner_interval = 100,
      fidget_interval = 200,
    },
    text = {
      spinner = 'dots',
      done = '✔',
      commenced = 'Started',
      completed = 'Completed',
    },
    -- Options related to logging
    logger = {
      level = vim.log.levels.WARN, -- Minimum logging level
      max_size = 10000,            -- Maximum log file size, in KB
      float_precision = 0.01,      -- Limit the number of decimals displayed for floats
      path =                       -- Where Fidget writes its logs to
          string.format("%s/fidget.nvim.log", vim.fn.stdpath("cache")),
    },
  },
  config = function()
    local function open_log()
      local path = string.format("%s/fidget.nvim.log", vim.fn.stdpath("cache"))
      local log_path = path
      if vim.fn.filereadable(log_path) == 1 then
        vim.cmd("edit " .. log_path) -- Membuka file log di buffer baru
      else
        print("Log file does not exist: " .. log_path)
      end
    end
    vim.api.nvim_create_user_command('OpenFidgetLog', open_log, { desc = "Show history of notification" })
    vim.keymap.set("n", "<leader>no", "<cmd>OpenFidgetLog<CR>", { desc = "Show history of notification" })
    -- local fidget = require("fidget")

    -- vim.keymap.set("n", "A", function()
    --   fidget.notify("This is from fidget.notify().")
    -- end)

    -- vim.keymap.set("n", "B", function()
    --   fidget.notify("This is also from fidget.notify().", vim.log.levels.WARN)
    -- end)

    -- vim.keymap.set("n", "C", function()
    --   fidget.notify("fidget.notify() supports annotations...", nil, { annote = "MY NOTE", key = "foobar" })
    -- end)

    -- vim.keymap.set("n", "D", function()
    --   fidget.notify(nil, vim.log.levels.ERROR, { annote = "bottom text", key = "foobar" })
    --   fidget.notify("... and overwriting notifications.", vim.log.levels.WARN, { annote = "YOUR AD HERE" })
    -- end)
  end
}
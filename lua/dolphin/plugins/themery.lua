return {
  "zaldih/themery.nvim",
  config = function()
    require("themery").setup({
      themes = {
        -- {
        --   name = "",
        --   colorscheme = "",
        --   before = [[
        --     vim.opt.background = "dark"
        --   ]]
        -- },
        -- {
        --   name = "",
        --   colorscheme = "",
        --   before = [[
        --     vim.opt.background = "light"
        --   ]]
        -- },
        {
          name = "Gruvbox Dark",
          colorscheme = "gruvbox",
          before = [[
            vim.opt.background = "dark"
          ]],
        },
        {
          name = "Gruvbox Light",
          colorscheme = "gruvbox",
          before = [[
            vim.opt.background = "light"
          ]],
        },
        {
          name = "Catppuccin",
          colorscheme = "catppuccin",
          before = [[
            vim.opt.background = "dark"
          ]],
        },
        {
          name = "Catppuccin Mocha",
          colorscheme = "catppuccin-mocha",
          before = [[
            vim.opt.background = "dark"
          ]],
        },
        {
          name = "Catppuccin Macchiato",
          colorscheme = "catppuccin-macchiato",
          before = [[
            vim.opt.background = "dark"
          ]],
        },
        {
          name = "Catppuccin Frappe",
          colorscheme = "catppuccin-frappe",
          before = [[
            vim.opt.background = "dark"
          ]],
        },
        {
          name = "Catppuccin Latte",
          colorscheme = "catppuccin-latte",
          before = [[
            vim.opt.background = "light"
          ]],
        },
        {
          name = "OneDark",
          colorscheme = "onedark",
          before = [[
            vim.opt.background = "dark"
          ]],
        },
        {
          name = "Cyber Dream Dark",
          colorscheme = "cyberdream",
          before = [[
            vim.opt.background = "dark"
          ]],
        },
        {
          name = "Cyber Dream Light",
          colorscheme = "cyberdream",
          before = [[
            vim.opt.background = "light"
          ]],
        },
        {
          name = "Tokyonight",
          colorscheme = "tokyonight",
          before = [[
            vim.opt.background = "dark"
          ]],
        },
        {
          name = "Tokyonight Night",
          colorscheme = "tokyonight-night",
          before = [[
            vim.opt.background = "dark"
          ]],
        },
        {
          name = "Tokyonight Storm",
          colorscheme = "tokyonight-storm",
          before = [[
            vim.opt.background = "dark"
          ]],
        },
        {
          name = "Tokyonight Day",
          colorscheme = "tokyonight-day",
          before = [[
            vim.opt.background = "light"
          ]],
        },
        {
          name = "Tokyonight Moon",
          colorscheme = "tokyonight-moon",
          before = [[
            vim.opt.background = "dark"
          ]],
        },
        {
          name = "Kanagawa Wave",
          colorscheme = "kanagawa-wave",
          before = [[
            vim.opt.background = "light"
          ]],
        },
        {
          name = "Kanagawa Dragon",
          colorscheme = "kanagawa-dragon",
          before = [[
            vim.opt.background = "dark"
          ]],
        },
        {
          name = "Kanagawa Lotus",
          colorscheme = "kanagawa-lotus",
          before = [[
            vim.opt.background = "dark"
          ]],
        },
        {
          name = "Paper",
          colorscheme = "paper",
          before = [[
				    vim.opt.background = "light"
				  ]],
        },
        {
          name = "Everforest Night Soft",
          colorscheme = "everforest",
          before = [[
				    vim.opt.background = "dark"
            vim.g.everforest_background = "soft"
				  ]],
        },
        {
          name = "Everforest Soft",
          colorscheme = "everforest",
          before = [[
				    vim.opt.background = "light"
            vim.g.everforest_background = "soft"
				  ]],
        },
        {
          name = "Everforest Night Medium",
          colorscheme = "everforest",
          before = [[
				    vim.opt.background = "dark"
            vim.g.everforest_background = "medium"
				  ]],
        },
        {
          name = "Everforest Medium",
          colorscheme = "everforest",
          before = [[
				    vim.opt.background = "light"
            vim.g.everforest_background = "medium"
				  ]],
        },
        {
          name = "Everforest Night Hard",
          colorscheme = "everforest",
          before = [[
				    vim.opt.background = "dark"
            vim.g.everforest_background = "hard"
				  ]],
        },
        {
          name = "Everforest Hard",
          colorscheme = "everforest",
          before = [[
				    vim.opt.background = "light"
            vim.g.everforest_background = "hard"
				  ]],
        },
        {
          name = "Nightfox",
          colorscheme = "nightfox",
          before = [[
				    vim.opt.background = "dark"
				  ]]
        },
        {
          name = "Dayfox",
          colorscheme = "dayfox",
          before = [[
				    vim.opt.background = "light"
				  ]]
        },
        {
          name = "Duskfox",
          colorscheme = "duskfox",
          before = [[
				    vim.opt.background = "dark"
				  ]]
        },
        {
          name = "Dawnfox",
          colorscheme = "dawnfox",
          before = [[
				    vim.opt.background = "light"
				  ]]
        },
        {
          name = "Nordfox",
          colorscheme = "nordfox",
          before = [[
				    vim.opt.background = "dark"
				  ]]
        },
        {
          name = "Terafox",
          colorscheme = "terafox",
          before = [[
				    vim.opt.background = "dark"
				  ]]
        },
        {
          name = "Carbonfox",
          colorscheme = "carbonfox",
          before = [[
				    vim.opt.background = "dark"
				  ]]
        },
        {
          name = "Melange Light",
          colorscheme = "melange",
          before = [[
				    vim.opt.background = "light"
				  ]]
        },
        {
          name = "Melange Dark",
          colorscheme = "melange",
          before = [[
				    vim.opt.background = "dark"
				  ]]
        },
        {
          name = "Sonokai",
          colorscheme = "sonokai",
          before = [[
            vim.g.sonokai_style = "default"
				    vim.opt.background = "dark"
				  ]]
        },
        {
          name = "Sonokai Atlantis",
          colorscheme = "sonokai",
          before = [[
            vim.g.sonokai_style = "atlantis"
				    vim.opt.background = "dark"
				  ]]
        },
        {
          name = "Sonokai Andromeda",
          colorscheme = "sonokai",
          before = [[
            vim.g.sonokai_style = "andromeda"
				    vim.opt.background = "dark"
				  ]]
        },
        {
          name = "Sonokai Shusia",
          colorscheme = "sonokai",
          before = [[
            vim.g.sonokai_style = "shusia"
				    vim.opt.background = "dark"
				  ]]
        },
        {
          name = "Sonokai Maia",
          colorscheme = "sonokai",
          before = [[
            vim.g.sonokai_style = "maia"
				    vim.opt.background = "dark"
				  ]]
        },
        {
          name = "Sonokai Espresso",
          colorscheme = "sonokai",
          before = [[
            vim.g.sonokai_style = "espresso"
				    vim.opt.background = "dark"
				  ]]
        },
      },
      livePreview = true,
    })
    local keymap = vim.keymap
    keymap.set("n", "<leader>uc", "<cmd>Themery<CR>", { desc = "Preview and change themes" })
  end,
}

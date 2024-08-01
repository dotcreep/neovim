-- Number line
vim.o.number = true             -- Show number line
vim.o.relativenumber = true     -- Show relative number line

-- Indent
vim.o.expandtab = true          -- Use space instead of tab (true)
vim.o.shiftwidth = 2            -- Indent when using '>'
vim.o.tabstop = 2               -- Tab using 2 indent
vim.o.smartindent = true        -- Smart auto indent
vim.o.autoindent = true         -- Apply indentation before line

-- Highlight Line
vim.o.cursorline = true         -- Activated highlight line

-- Column Colors
vim.o.signcolumn = 'yes'        -- Always show sign column
vim.o.colorcolumn = '80'        -- Pinning column 80 (limited line)
vim.o.termguicolors = true      -- Activated true color

-- Search
vim.o.ignorecase = true         -- Ignore case when searching
vim.o.smartcase = true          -- Searcing case-sensitive if using capital
vim.o.incsearch = true          -- Highlight matching searches while typing
vim.o.hlsearch = true           -- Highlighting all result of searching

-- Navigation
vim.o.wrap = false              -- Disable line wrapping
vim.o.scrolloff = 8             -- Minimum line distance from top/bot of screen
vim.o.sidescrolloff = 8         -- Minimum line distance from sides of screen
vim.o.splitbelow = true         -- Horizontal split below active window
vim.o.splitright = true         -- Vertival split to the right of active window

-- Buffer and Window
vim.o.hidden = true             -- Allow unsaved buffers to remain open

-- Tab and Status Bar
vim.o.showtabline = 2           -- Always show bar tab
vim.o.laststatus = 2            -- Always show status bar
vim.o.cmdheight = 1             -- Height line command

-- Improving
vim.o.updatetime = 300          -- Waiting update time in ms
vim.o.timeoutlen = 500          -- Waiting time to wait for sequence mapping

-- File and Backup
vim.o.swapfile = false          -- Does not using swap file
vim.o.backup = false            -- Does not create backup file
vim.o.undofile = true           -- Activated saving undo

-- Clipboard
vim.o.clipboard = 'unnamedplus' -- Use system clipboard

-- Mouse
vim.o.mouse = 'a'               -- Activate mouse to using in all mode

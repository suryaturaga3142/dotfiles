-- ~/.config/nvim/lua/core/prefs.lua

local opt = vim.opt

-- UI & Visuals
opt.number = true          -- Show line numbers
opt.cursorline = true      -- Highlight current line
opt.scrolloff = 5          -- Keep 5 lines context when scrolling
opt.splitbelow = true      -- New horizontal splits go down
opt.splitright = true      -- New vertical splits go right
opt.termguicolors = true   -- Enable true color support

-- Search Behavior
opt.incsearch = true       -- Highlight as you type
opt.hlsearch = true        -- Keep matches highlighted
opt.ignorecase = true      -- Ignore case...
opt.smartcase = true       -- ...unless capital letter used

-- Indentation & Formatting
opt.tabstop = 4            -- Visual width of tab
opt.shiftwidth = 4         -- Indent width
opt.softtabstop = 4        -- Edit as if tabs are spaces
opt.expandtab = true       -- Tabs -> Spaces
opt.autoindent = true      -- Copy indent from previous line

-- Clipboard
opt.clipboard = "unnamedplus"

-- Backups kept out of the way
local backup_dir = vim.fn.expand("~/.vim_backup_files")
if vim.fn.isdirectory(backup_dir) == 0 then
    vim.fn.mkdir(backup_dir, "p")
end
opt.backupdir = backup_dir
opt.backup = true
opt.writebackup = true

-- Remember Cursor Position
vim.api.nvim_create_autocmd("BufReadPost", {
    pattern = "*",
    callback = function()
        local line = vim.fn.line("'\"")
        if line >= 1 and line <= vim.fn.line("$") and vim.bo.filetype ~= "commit" then
            vim.cmd('normal! g`"')
        end
    end,
})


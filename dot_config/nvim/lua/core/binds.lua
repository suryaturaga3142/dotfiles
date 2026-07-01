-- ~/.config/nvim/lua/core/binds.lua

-- Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Alias for clean syntax
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Pane Management (Ctrl unstable indep and needed for tmux)
-- Move focus
map("n", "<leader>l", "<C-w>l", opts)
map("n", "<leader>k", "<C-w>k", opts)
map("n", "<leader>j", "<C-w>j", opts)
map("n", "<leader>h", "<C-w>h", opts)
-- Move Pane
map("n", "<leader>L", "<C-w>L", opts)
map("n", "<leader>K", "<C-w>K", opts)
map("n", "<leader>J", "<C-w>J", opts)
map("n", "<leader>H", "<C-w>H", opts)
-- Complex rearrangement
map("n", "<leader>r", "<C-w>r", opts)
map("n", "<leader>R", "<C-w>R", opts)
map("n", "<leader>x", "<C-w>x", opts)

-- Resizing Splits
map("n", "<C-Left>",  ":vertical resize -3<CR>", opts)
map("n", "<C-Right>", ":vertical resize +3<CR>", opts)
map("n", "<C-Up>",    ":resize +3<CR>", opts)
map("n", "<C-Down>",  ":resize -3<CR>", opts)

-- Split shortcuts (Space + | or _ or =)
map("n", "<leader>|", "<C-w>|", opts)
map("n", "<leader>_", "<C-w>_", opts)
map("n", "<leader>=", "<C-w>=", opts)

-- Tab Management
map("n", "<leader>q", ":tabnew<CR>", opts)
map("n", "<leader>,", ":tabprevious<CR>", opts)
map("n", "<leader>.", ":tabnext<CR>", opts)
map("n", "<leader><", ":tabmove -1<CR>", opts)
map("n", "<leader>>", ":tabmove +1<CR>", opts)
-- Specific tab
for i = 1, 9 do
    map("n", "<leader>" .. i, i .. "gt", opts)
end
map("n", "<leader>!", ":tabmove 1<CR>", opts)
map("n", "<leader>@", ":tabmove 2<CR>", opts)
map("n", "<leader>#", ":tabmove 3<CR>", opts)
map("n", "<leader>$", ":tabmove 4<CR>", opts)
map("n", "<leader>%", ":tabmove 5<CR>", opts)
map("n", "<leader>^", ":tabmove 6<CR>", opts)
map("n", "<leader>&", ":tabmove 7<CR>", opts)
map("n", "<leader>*", ":tabmove 8<CR>", opts)
map("n", "<leader>(", ":tabmove 9<CR>", opts)

-- Utilities
map("n", "<leader><leader>", ":noh<CR>", opts)


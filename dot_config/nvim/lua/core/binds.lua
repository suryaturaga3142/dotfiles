-- ~/.config/nvim/lua/core/binds.lua

-- Keybinds unified with Hyprland (see ~/.config/hypr/land/binds.lua)
-- Hyprland uses SUPER as its modifier, here <leader> (Space) is the analogous.

-- <C-hjkl> is left to vim-tmux-navigator for focus; <C-S-hjkl> is intentionally
-- avoided (clashes with <C-l> redraw and terminal emulators).

-- Grouping convention (see plugin files):
--   <leader>f...  Telescope / finders    (telescope.lua, todo.lua, lsp finders)
--   <leader>l...  LSP actions            (lsp.lua, buffer-local)
--   <leader>a...  AI / Claude Code       (claude.lua)
--   Insert <C-*>  completion / AI accept (blink.cmp, copilot.vim)

-- Leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Normal mode mapping
local function nmap(lhs, rhs, desc)
    vim.keymap.set("n", lhs, rhs, { noremap = true, silent = true, desc = desc })
end

-- Insert mode mapping
local function imap(lhs, rhs, desc)
    vim.keymap.set("i", lhs, rhs, { noremap = true, silent = true, desc = desc })
end

-- General
nmap("<leader>q", "<cmd>tabnew<CR>", "New tab")
nmap("<leader>c", "<C-w>c", "Close window")
nmap("<leader>z", "<C-w>_<C-w>|", "Maximize (zoom) window")

-- Explorers
--   <leader>w -> nvim-tree  (explorer.lua)
--   <leader>s -> blink tree (blink.lua)

-- Windows
nmap("<leader>H", "<C-w>H", "Move window left")
nmap("<leader>J", "<C-w>J", "Move window down")
nmap("<leader>K", "<C-w>K", "Move window up")
nmap("<leader>L", "<C-w>L", "Move window right")

-- Splits
nmap("<leader>|", "<C-w>v", "Split vertical")
nmap("<leader>\\", "<C-w>v", "Split vertical") -- I'm lazy to press shift
nmap("<leader>-", "<C-w>s", "Split horizontal")
nmap("<leader>=", "<C-w>=", "Balance splits")
nmap("<C-Left>",  "<cmd>vertical resize -3<CR>", "Shrink width")
nmap("<C-Right>", "<cmd>vertical resize +3<CR>", "Grow width")
nmap("<C-Up>",    "<cmd>resize +3<CR>", "Grow height")
nmap("<C-Down>",  "<cmd>resize -3<CR>", "Shrink height")

-- Tabs
nmap("<leader>,", "<cmd>tabprevious<CR>", "Prev tab")
nmap("<leader>.", "<cmd>tabnext<CR>",     "Next tab")
nmap("<leader><", "<cmd>tabmove -1<CR>",  "Move tab left")
nmap("<leader>>", "<cmd>tabmove +1<CR>",  "Move tab right")

for i = 1, 9 do
    nmap("<leader>" .. i, i .. "gt", "Go to tab " .. i)
end
nmap("<leader>0", "<cmd>tablast<CR>", "Go to last tab")

local shifted = { "!", "@", "#", "$", "%", "^", "&", "*", "(" }
for i, sym in ipairs(shifted) do
    nmap("<leader>" .. sym, "<cmd>tabmove " .. i .. "<CR>", "Move tab to pos " .. i)
end

-- Misc
nmap("<leader><leader>", "<cmd>noh<CR>", "Clear search highlight")
nmap("<C-f>", "<cmd>Telescope live_grep<CR>", "Live grep (rg)")
imap("<C-f>", "<cmd>Telescope live_grep<CR>", "Live grep (rg)")


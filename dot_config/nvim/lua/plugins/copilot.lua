-- ~/.config/nvim/lua/plugins/copilot.lua
--
-- Use this way more than claude, student account allows more easy use

return {
    "github/copilot.vim",
    lazy = false,
    config = function()
        vim.g.copilot_no_tab_map = true
        vim.g.copilot_assume_mapped = true

        local map = vim.keymap.set
        local opts = { expr = true, silent = true, replace_keycodes = false }

        map("i", "<C-m>", 'copilot#Accept("<CR>")', opts)
        map("i", "<C-n>", "<Plug>(copilot-dismiss)", { silent = true } )
        map("i", "<M-]>", "<Plug>(copilot-next)", { silent = true } )
        map("i", "<M-[>", "<Plug>(copilot-previous)", { silent = true } )
    end,
}


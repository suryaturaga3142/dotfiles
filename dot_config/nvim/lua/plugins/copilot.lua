-- ~/.config/nvim/lua/plugins/copilot.lua

return {
    "github/copilot.vim",
    lazy = false,
    config = function()
        vim.g.copilot_no_tab_map = true
        vim.g.copilot_assume_mapped = true

        local map = vim.keymap.set
        local opts = { expr = true, silent = true, replace_keycodes = false }

        map("i", "<C-j>", 'copilot#Accept("<CR>")', opts)
        map("i", "<M-]>", "<Plug>(copilot-next)", opts)
        map("i", "<M-[>", "<Plug>(copilot-previous)", opts)
    end,
}


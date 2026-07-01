-- ~/.config/nvim/lua/plugins/telescope.lua

return {
    "nvim-telescope/telescope.nvim",
    dependencies = { 
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
    },
    keys = {
        { "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find Files" },
        { "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "Find Buffers" },
        { "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Live Grep (Rg)" },
    },
    config = function()
        local telescope = require("telescope")
        
        telescope.setup({
            defaults = {
                file_ignore_patterns = { ".git/", "node_modules/" },
                layout_config = {
                    horizontal = {
                        prompt_position = "top",
                        preview_width = 0.55,
                    },
                },
                sorting_strategy = "ascending",
            },
        })
    end,
}


-- ~/.config/nvim/lua/plugins/explorer.lua

return {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
        -- Nvim-tree toggle
        { "<leader>w", "<cmd>NvimTreeToggle<CR>", desc = "File explorer (nvim-tree)" },
    },
    config = function()
        -- Prevent conflicts
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1

        require("nvim-tree").setup({
            view = {
                width = 30,
                side = "left",
                number = false,
                relativenumber = false,
            },
            renderer = {
                group_empty = true,
                icons = {
                    show = {
                        git = true,
                        file = true,
                        folder = true,
                        folder_arrow = true,
                    },
                },
            },
            actions = {
                open_file = {
                    quit_on_open = true, 
                },
            },
            filters = {
                dotfiles = false,
                custom = { "^.git$" }, -- Hide .git folder
            },
        })
    end,
}


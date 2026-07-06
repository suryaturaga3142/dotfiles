-- ~/.config/nvim/lua/plugins/telescope.lua

return {
    "nvim-telescope/telescope.nvim",
    dependencies = { 
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
    },
    -- Finder group: <leader>f...
    -- Attach only when an LSP is present
    keys = {
        { "<leader>ff", "<cmd>Telescope find_files<CR>",                desc = "Find files" },
        { "<leader>fg", "<cmd>Telescope live_grep<CR>",                 desc = "Live grep (rg)" },
        { "<leader>fG", "<cmd>Telescope git_status<CR>",                desc = "Git Status" },
        { "<leader>fb", "<cmd>Telescope buffers<CR>",                   desc = "Find buffers" },
        { "<leader>fo", "<cmd>Telescope oldfiles<CR>",                  desc = "Recent files" },
        { "<leader>fw", "<cmd>Telescope grep_string<CR>",               desc = "Grep word under cursor" },
        { "<leader>fe", "<cmd>Telescope diagnostics<CR>",               desc = "Diagnostics" },
        { "<leader>fh", "<cmd>Telescope help_tags<CR>",                 desc = "Help tags" },
        { "<leader>fk", "<cmd>Telescope keymaps<CR>",                   desc = "Keymaps" },
        { "<leader>fc", "<cmd>Telescope commands<CR>",                  desc = "Commands" },
        { "<leader>fR", "<cmd>Telescope resume<CR>",                    desc = "Resume last picker" },
        { "<leader>f/", "<cmd>Telescope current_buffer_fuzzy_find<CR>", desc = "Search in buffer" },
    },
    config = function()
        -- TODO: Make telescope file opening drop into existing file if open
        -- Refer to tab drop. Should go somewhere in the setup
        local telescope = require("telescope")
        
        telescope.setup({
            defaults = {
                file_ignore_patterns = { ".git/", "node_modules/" },
                layout_config = {
                    horizontal = {
                        prompt_position = "top",
                        preview_width = 0.55,
                        width = 0.9
                    },
                },
                sorting_strategy = "ascending",
            },
        })

        -- Activate the compiled fzf matcher (built via the fzf-native dependency)
        pcall(telescope.load_extension, "fzf")
    end,
}


-- ~/.config/nvim/lua/plugins/todo.lua

return {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = { "BufReadPost", "BufNewFile" },
    keys = {
        { "<leader>ft", "<cmd>TodoTelescope<CR>", desc = "Find Todos (Telescope)" },
    },
    config = function()
        require("todo-comments").setup({
            signs = true,
            
            colors = {
                bug_col  = { "#d32f2f" },
                crit_col = { "#fc4040" },
                fix_col  = { "#f57c00" },
                opt_col  = { "#ffeb3b" },
                todo_col = { "#1976d2" },
                hack_col = { "#7b1fa2" },
                xxx_col  = { "#924efc" },
                note_col = { "#388e3c" },
                rev_col  = { "#03a9f4" },
            },

            keywords = {
                BUG = { icon = " ", color = "bug_col" },
                CRITICAL = { icon = "󰀪 ", color = "crit_col" },
                FIXME = { icon = " ", color = "fix_col", alt = { "FIX", "FIXIT" } },
                OPTIMIZE = { icon = "󱐋 ", color = "opt_col", alt = { "PERF", "SPEED" } },
                TODO = { icon = " ", color = "todo_col" },
                HACK = { icon = " ", color = "hack_col" },
                XXX = { icon = " ", color = "xxx_col" },
                NOTE = { icon = "󰎚 ", color = "note_col", alt = { "INFO" } },
                REVIEW = { icon = " ", color = "rev_col" },
            },
            
            highlight = {
                multiline = false, -- Only highlight the specific line
                keyword = "bg",    -- "fg", "bg", "wide", "wide_bg", "wide_fg" or empty.
                after = "fg",      -- "fg" or "bg" or empty
                pattern = [[.*<(KEYWORDS)\s*:]], -- Highlights up to the colon
            },
        })
    end,
}


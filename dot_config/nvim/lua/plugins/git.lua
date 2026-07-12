-- ~/.config/nvim/lua/plugins/git.lua

return {
    -- Diffview for viewing git diffs and history
    {
        "sindrets/diffview.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        cmd = { 
            "DiffviewOpen", 
            "DiffviewClose", 
            "DiffviewToggleFiles", 
            "DiffviewFocusFiles", 
            "DiffviewFileHistory" 
        },
        keys = {
            { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Open Git Diffview" },
            { "<leader>gh", "<cmd>DiffviewFileHistory %<cr>", desc = "Current File History" },
            { "<leader>gc", "<cmd>DiffviewClose<cr>", desc = "Close Git Diffview" },
        },
        opts = {
            view = {
                -- Defaults to 3-way horizontal split for merge conflicts
                merge_tool = {
                    layout = "diff3_horizontal",
                    disable_diagnostics = true, -- Disables LSP noise while resolving conflicts
                },
            },
        },
    },

    -- Gitsigns for inline git diff signs and hunk actions
    {
        "lewis6991/gitsigns.nvim",
        event = { "BufReadPre", "BufNewFile" },
        opts = {
            signs = {
                add          = { text = '┃' },
                change       = { text = '┃' },
                delete       = { text = '_' },
                topdelete    = { text = '‾' },
                changedelete = { text = '~' },
                untracked    = { text = '┆' },
            },
            on_attach = function(bufnr)
                local gs = package.loaded.gitsigns

                local function map(mode, l, r, opts)
                    opts = opts or {}
                    opts.buffer = bufnr
                    vim.keymap.set(mode, l, r, opts)
                end

                -- Jump between changed hunks inline
                map('n', ']c', function()
                    if vim.wo.diff then return ']c' end
                    vim.schedule(function() gs.next_hunk() end)
                    return '<Ignore>'
                end, {expr=true, desc="Next Hunk"})

                map('n', '[c', function()
                    if vim.wo.diff then return '[c' end
                    vim.schedule(function() gs.prev_hunk() end)
                    return '<Ignore>'
                end, {expr=true, desc="Prev Hunk"})

                -- Inline Diff Toggles
                map('n', '<leader>td', gs.toggle_deleted, {desc="Toggle inline deleted lines"})
                map('n', '<leader>tw', gs.toggle_word_diff, {desc="Toggle inline word diff"})
                map('n', '<leader>tb', gs.toggle_current_line_blame, {desc="Toggle inline blame"})

                -- Preview the current hunk inline as a floating window
                map('n', '<leader>h', gs.preview_hunk, {desc="Preview Hunk"})

                -- Defaults to choose current (left) vs incoming (right)
                -- <leader>co - choose ours
                -- <leader>ct - choose theirs
            end
        }
    }
}


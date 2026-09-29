-- ~/.config/nvim/lua/plugins/snacks.lua

return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,

    opts = {
        bigfile = { enabled = true },  -- Protects against editor freezes on large files
        image = { enabled = true },    -- Preview images
        explorer = { 
            enabled = true,
            replace_netrw = true,
            sources = { files = { cmd = "rg" } },
        },
        gh = {},        -- Enables full GitHub CLI functionality
        git = {},       -- Enables git utilities
        gitbrowse = {}, -- Enables browser jumping
        lazygit = {},   -- Enables floating lazygit integration
        notifier = { enabled = true }, -- Cleaner LSP/build notifications
        picker = {
            enabled = true,
            formatters = {
                file = {
                    filename_first = true, -- Easier to read deeply nested paths
                }
            },
        },
        scratch = { enabled = true },  -- Persistent scratchpads
        terminal = { enabled = true }, -- Floating terminal
        words = { enabled = true },    -- Auto-shows LSP references
    },
    keys = {
        -- Explorer
        { "<leader>w", function() Snacks.explorer() end, desc = "File Explorer (Snacks)" },

        -- Finders: <leader>f...
        { "<leader>ff", function() Snacks.picker.files({ hidden = true }) end, desc = "Find files" },
        { "<leader>fg", function() Snacks.picker.grep() end, desc = "Live grep (rg)" },
        { "<leader>fb", function() Snacks.picker.buffers() end, desc = "Find buffers" },
        { "<leader>fo", function() Snacks.picker.recent() end, desc = "Recent files" },
        { "<leader>fw", function() Snacks.picker.grep_word() end, desc = "Grep word under cursor", mode = { "n", "x" } },

        { "<leader>fe", function() Snacks.picker.diagnostics() end, desc = "Diagnostics" },
        { "<leader>fh", function() Snacks.picker.help() end, desc = "Help tags" },
        { "<leader>fk", function() Snacks.picker.keymaps() end, desc = "Keymaps" },
        { "<leader>fc", function() Snacks.picker.commands() end, desc = "Commands" },

        { "<leader>fR", function() Snacks.picker.resume() end, desc = "Resume last picker" },
        { "<leader>f/", function() Snacks.picker.lines() end, desc = "Search in buffer" },
        { "<leader>fu", function() Snacks.picker.undo() end, desc = "Undo History" },

        -- Git & GitHub Extensions
        { "<leader>gs", function() Snacks.picker.git_status() end, desc = "Git Status" },
        { "<leader>gl", function() Snacks.picker.git_log() end, desc = "Git Log" },
        { "<leader>gb", function() Snacks.git.blame_line() end, desc = "Git Line Blame (Floating)" },
        { "<leader>gp", function() Snacks.picker.gh_pr() end, desc = "GitHub Pull Requests" },
        { "<leader>gi", function() Snacks.picker.gh_issue() end, desc = "GitHub Issues" },
        { "<leader>go", function() Snacks.gitbrowse() end, desc = "Open in Browser", mode = { "n", "v" } },
        { "<leader>gz", function() Snacks.lazygit() end, desc = "Lazygit" },

        { "]]", function() Snacks.words.jump(vim.v.count1) end, desc = "Next Reference", mode = { "n", "t" } },
        { "[[", function() Snacks.words.jump(-vim.v.count1) end, desc = "Prev Reference", mode = { "n", "t" } },
        
        { "<leader>s", function() Snacks.scratch() end, desc = "Toggle Scratch Buffer" },
        { "<leader>S", function() Snacks.terminal() end, desc = "Toggle Terminal" },
        
        { "<leader>n", function() Snacks.notifier.show_history() end, desc = "Notification History" },
        { "<leader>un", function() Snacks.notifier.hide() end, desc = "Dismiss All Notifications" },
    },
}


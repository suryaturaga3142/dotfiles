-- ~/.config/nvim/lua/plugins/claude.lua

return {
    "coder/claudecode.nvim",
    dependencies = { "folke/snacks.nvim" },
    config = true,
    -- `cmd` lets lazy.nvim create command stubs that load the plugin on first use,
    -- so `:ClaudeCode` and friends work on a fresh start. Without it, a keys-only
    -- spec defers loading until a <leader>a* mapping is pressed and the commands
    -- would not exist yet.
    cmd = {
        "ClaudeCode",
        "ClaudeCodeFocus",
        "ClaudeCodeSelectModel",
        "ClaudeCodeAdd",
        "ClaudeCodeSend",
        "ClaudeCodeTreeAdd",
        "ClaudeCodeStatus",
        "ClaudeCodeStart",
        "ClaudeCodeStop",
        "ClaudeCodeOpen",
        "ClaudeCodeClose",
        "ClaudeCodeDiffAccept",
        "ClaudeCodeDiffDeny",
        "ClaudeCodeCloseAllDiffs",
    },
    keys = {
        { "<leader>a", nil, desc = "AI/Claude Code" },
        { "<leader>ac", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude" },
        { "<leader>af", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude" },
        { "<leader>ar", "<cmd>ClaudeCode --resume<cr>", desc = "Resume Claude" },
        { "<leader>aC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude" },
        { "<leader>am", "<cmd>ClaudeCodeSelectModel<cr>", desc = "Select Claude model" },
        { "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>", desc = "Add current buffer" },
        { "<leader>as", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send to Claude" },
        {
            "<leader>as",
            "<cmd>ClaudeCodeTreeAdd<cr>",
            desc = "Add file",
            ft = { "NvimTree", "neo-tree", "oil", "minifiles", "netrw", "snacks_picker_list" },
        },
        -- Diff management
        { "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
        { "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Deny diff" },
        { "<leader>ax", "<cmd>ClaudeCodeCloseAllDiffs<cr>", desc = "Close All Pending Diffs" },
        { "<C-,>",      "<cmd>ClaudeCodeFocus<cr>", desc = "Toggle Claude Float", mode = { "n", "x", "t" } },
    },

    opts = {
        -- Automatically lock working directory to the git repository root
        git_repo_cwd = true,
        -- Ensure the plugin respects local PATH binary
        terminal_cmd = "claude", 
        -- When true, sending text/context automatically pulls focus to the AI terminal
        focus_after_send = true,
        track_selection = true,

        terminal = {
            -- Let Snacks.nvim open Claude in a floating window
            provider = "snacks",
            auto_close = true,
            auto_insert = true, -- Auto-enter insert mode when focusing the terminal

            snacks_win_opts = {
                position = "float",
                width = 0.85,
                height = 0.85,
                border = "rounded",
                backdrop = 60,
                keys = {
                    -- Pressing Ctrl+, or Esc inside the terminal hides the float without killing the job
                    claude_hide = { "<C-,>", function(self) self:hide() end, mode = "t", desc = "Hide Claude" },
                },
            },
        },

        -- Diff & File Modification Settings
        diff_opts = {
            -- May change to unified
            layout = "vertical", 
            open_in_new_tab = false,
            keep_terminal_focus = false, -- Move cursor directly into the diff buffer
            auto_resize_terminal = true,
        },
    }
}


-- ~/.config/nvim/lua/plugins/blink.lua

return {
    {
        -- Small useful stuff
        'saghen/blink.nvim',
        build = 'cargo build --release', -- for delimiters
        keys = {
            -- chartoggle
            {
                '<C-;>',
                function()
                    require('blink.chartoggle').toggle_char_eol(';')
                end,
                mode = { 'n', 'v' },
                desc = 'Toggle ; at eol',
            },
            {
                ',',
                function()
                    require('blink.chartoggle').toggle_char_eol(',')
                end,
                mode = { 'n', 'v' },
                desc = 'Toggle , at eol',
            },

            -- tree
            { '<C-e>', '<cmd>BlinkTree reveal<cr>', desc = 'Reveal current file in tree' },
            { '<leader>E', '<cmd>BlinkTree toggle<cr>', desc = 'Reveal current file in tree' },
            { '<leader>e', '<cmd>BlinkTree toggle-focus<cr>', desc = 'Toggle file tree focus' },
        },
        -- all modules handle lazy loading internally
        lazy = false,
        opts = {
            chartoggle = { enabled = true },
            tree = { enabled = true }
        }
    }, 

    {
        -- Autocomplete
        'saghen/blink.cmp',
        dependencies = {
            'saghen/blink.lib',
            'rafamadriz/friendly-snippets',
        },
        build = function()
            -- build the fuzzy matcher, optionally add a timeout to `pwait(timeout_ms)`
            -- you can use `gb` in `:Lazy` to rebuild the plugin as needed
            require('blink.cmp').build():pwait()
        end,

        ---@module 'blink.cmp'
        ---@type blink.cmp.Config
        opts = {
            -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
            -- 'super-tab' for mappings similar to vscode (tab to accept)
            -- 'enter' for enter to accept
            -- 'none' for no mappings
            --
            -- All presets have the following mappings:
            -- C-space: Open menu or open docs if already open
            -- C-n/C-p or Up/Down: Select next/previous item
            -- C-e: Hide menu
            -- C-k: Toggle signature help (if signature.enabled = true)
            --
            -- See :h blink-cmp-config-keymap for defining your own keymap
            keymap = { preset = 'default' },

            -- (Default) Only show the documentation popup when manually triggered
            completion = { documentation = { auto_show = false } },

            -- (Default) list of enabled providers defined so that you can extend it
            -- elsewhere in your config, without redefining it, due to `opts_extend`
            sources = { default = { 'lsp', 'path', 'snippets', 'buffer' } },

            -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
            -- You may use a lua implementation instead by using `implementation = "lua"`
            -- See the fuzzy documentation for more information
            fuzzy = { implementation = "rust" }
        },
    }
}

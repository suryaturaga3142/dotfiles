-- ~/.config/nvim/lua/plugins/ui.lua

return {
    -- Gruvbox
    -- High priority so theme loads before other stuff
    {
        "ellisonleao/gruvbox.nvim",
        priority = 1000,
        config = function()
            vim.opt.background = "dark"
            vim.cmd("colorscheme gruvbox")
            vim.cmd("highlight Normal guibg=NONE ctermbg=NONE")
            vim.cmd("highlight NormalNC guibg=NONE ctermbg=NONE")
        end,
    },
    
    -- Statusline
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("lualine").setup({
                options = {
                    theme = "gruvbox-material",
                    globalstatus = true,
                    component_separators = { left = '\\', right = '/' },
                    section_separators = { left = '', right = '' }
                    -- component_separators = '',
                    -- section_separators = { left = '', right = '' },
                },
                sections = {
                    -- lualine_a = { { 'mode', separator = { left = '' }, right_padding = 2 } },
                    lualine_a = {'mode'},
                    lualine_b = {'branch', 'diff', 'filename'},
                    lualine_c = {'diagnostics'},
                    lualine_x = {'encoding', 'fileformat', 'filesize'},
                    lualine_y = {'filetype', {
                        'lsp_status',
                        icon = '',
                        symbols = {
                            spinner = { '⠋', '⠙', '⠹', '⠸', '⠼', '⠴', '⠦', '⠧', '⠇', '⠏' },
                            done = '✓',
                            separator = ' '
                        },
                        ignore_lsp = {
                            'null-ls',
                        },
                        show_name = false }
                    },
                    -- lualine_z = {'progress', { 'location', separator = { right = '' }, left_padding = 2 } },
                    lualine_z = {'progress', 'location'}
                },
            })
        end,
    },
}


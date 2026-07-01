-- ~/.config/nvim/lua/plugins/lsp.lua

return {

    -- For YAML and JSON
    {
        "b0o/SchemaStore.nvim",
        lazy = true,
    },

    -- Mason: The Package Manager for LSPs, formatters, and linters
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    
    -- Mason-LSPConfig: Bridges Mason with the LSP engine
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { 
                    "asm_lsp",      -- Assembly
                    "basedpyright", -- Python
                    "bashls",       -- Bash
                    "clangd",       -- C / C++
                    "jsonls",       -- JSON
                    "lua_ls",       -- Lua
                    "matlab_ls",    -- MATLAB
                    "perlnavigator",-- Perl
                    "ruff",         -- Python
                    "tclsp",        -- Tcl
                    "verible",      -- SystemVerilog
                    "yamlls",       -- YAML
                },
            })
        end,
    },
    
    -- LSP Configuration
    {
        "neovim/nvim-lspconfig",
        config = function()
            local servers = {
                asm_lsp = {},
                basedpyright = {
                    settings = {
                        basedpyright = {
                            analysis = {
                                typeCheckingMode = "standard",
                            }
                        }
                    }
                },
                bashls = {},
                clangd = {
                    cmd = { "clangd", "--background-index", "--offset-encoding=utf-16" }
                },
                jsonls = {},
                lua_ls = {
                    settings = {
                        Lua = {
                            diagnostics = {
                                globals = { "vim" },
                                disable = { "trailing-space", "empty-block" }
                            },
                            workspace = { checkThirdParty = false },
                        }
                    }
                },
                matlab_ls = {},
                perlnavigator = {},
                ruff = {},
                tclsp = {},
                verible = {},
                yamlls = {
                    settings = {
                        yaml = {
                            schemaStore = {
                                enable = false, -- Disable the builtin to use the plugin's richer store
                                url = "",
                            },
                            schemas = require("schemastore").yaml.schemas(),
                        }
                    }
                },
            }

            for server, custom_config in pairs(servers) do
                vim.lsp.config(server, custom_config)
                vim.lsp.enable(server)
            end
            
            -- Global mappings for LSP features
            local map = vim.keymap.set
            
            vim.api.nvim_create_autocmd('LspAttach', {
                group = vim.api.nvim_create_augroup('UserLspConfig', {}),
                callback = function(ev)
                    local opts = { buffer = ev.buf, silent = true }
                    
                    opts.desc = "Go to Definition"
                    map('n', 'gd', vim.lsp.buf.definition, opts)
                    
                    opts.desc = "Hover Documentation"
                    map('n', 'K', vim.lsp.buf.hover, opts)
                    
                    opts.desc = "Code Action"
                    map('n', '<leader>ca', vim.lsp.buf.code_action, opts)
                    
                    opts.desc = "Rename Variable"
                    map('n', '<leader>rn', vim.lsp.buf.rename, opts)

                    opts.desc = "Previous Diagnostic"
                    map('n', '[d', vim.diagnostic.goto_prev, opts)

                    opts.desc = "Next Diagnostic"
                    map('n', ']d', vim.diagnostic.goto_next, opts)

                    opts.desc = "Find References"
                    map('n', 'gr', require("telescope.builtin").lsp_references, opts)
                end,
            })
        end,
    }
}


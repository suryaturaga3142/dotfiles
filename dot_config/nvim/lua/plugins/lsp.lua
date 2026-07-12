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
        end
    },
    
    -- Mason-LSPConfig: Bridges Mason with the LSP engine
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { 
                    "asm_lsp",      -- Assembly
                    "autotools_ls", -- Makefiles
                    "basedpyright", -- Python
                    "bashls",       -- Bash
                    "clangd",       -- C / C++
                    -- "dts_lsp",      -- DeviceTree -- May need this someday for Zephyr RTOS
                    "ginko_ls",     -- DeviceTree
                    "jsonls",       -- JSON
                    "lua_ls",       -- Lua
                    "matlab_ls",    -- MATLAB
                    "neocmake",     -- CMake
                    "perlnavigator",-- Perl
                    "qmlls",        -- QML
                    "ruff",         -- Python
                    "tclsp",        -- Tcl
                    "texlab",       -- LaTeX
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
                autotools_ls = {},
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
                -- dts_lsp = {},
                ginko_ls = {},
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
                neocmake = {},
                perlnavigator = {},
                qmlls = {},
                ruff = {},
                tclsp = {},
                texlab = {
                    settings = {
                        {
                            texlab = {
                                bibtexFormatter = "texlab",
                                build = {
                                    -- Important: Needs to match my custom Makefile
                                    args = {
                                        "-xelatex",
                                        "-interaction=nonstopmode",
                                        "-file-line-error",
                                        "-synctex=1",
                                        "-outdir=build",
                                        "%f"
                                    },
                                    executable = "latexmk",
                                    outputDirectory = "build",
                                    forwardSearchAfter = false,
                                    onSave = false
                                },
                                chktex = {
                                    onEdit = false,
                                    onOpenAndSave = false
                                },
                                diagnosticsDelay = 300,
                                formatterLineLength = 80,
                                forwardSearch = {
                                    args = {}
                                },
                                latexFormatter = "latexindent",
                                latexindent = {
                                    modifyLineBreaks = false
                                }
                            }
                        }
                    }
                },
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
            
            -- Buffer-local mappings, applied only when an LSP attaches.
            --   Simple usage on E / K / [p ]p
            --   Goto navigation on g...
            --   Actions grouped under <leader>l...
            --   Telescope-backed finders on <leader>f...
            vim.api.nvim_create_autocmd('LspAttach', {
                group = vim.api.nvim_create_augroup('UserLspConfig', {}),
                callback = function(ev)
                    local builtin = require("telescope.builtin")
                    local function lmap(lhs, rhs, desc)
                        vim.keymap.set('n', lhs, rhs, { buffer = ev.buf, silent = true, desc = desc })
                    end

                    -- Navigation
                    lmap('E', vim.diagnostic.open_float, "Hover diagnostics")
                    lmap('K', vim.lsp.buf.hover, "Hover documentation")
                    lmap('[p', function() vim.diagnostic.jump({ count = -1, float = true }) end, "Previous diagnostic")
                    lmap(']p', function() vim.diagnostic.jump({ count = 1, float = true }) end, "Next diagnostic")
                    
                    -- Gotos
                    lmap('gd', vim.lsp.buf.definition, "Go to definition")
                    lmap('gD', vim.lsp.buf.declaration, "Go to declaration")
                    lmap('gi', vim.lsp.buf.implementation, "Go to implementation")
                    lmap('gT', vim.lsp.buf.type_definition, "Go to type definition")

                    -- LSP action group: <leader>l...
                    lmap('<leader>la', vim.lsp.buf.code_action, "Code action")
                    lmap('<leader>lr', vim.lsp.buf.rename, "Rename symbol")
                    lmap('<leader>ls', vim.lsp.buf.signature_help, "Signature help")
                    lmap('<leader>lf', function() vim.lsp.buf.format({ async = true }) end, "Format buffer")

                    -- LSP-backed Telescope finders: <leader>f...
                    lmap('<leader>fr', builtin.lsp_references, "Find references")
                    lmap('<leader>fs', builtin.lsp_document_symbols, "Document symbols")
                    lmap('<leader>fS', builtin.lsp_dynamic_workspace_symbols, "Workspace symbols")
                    lmap('<leader>fi', builtin.lsp_implementations, "Find implementations")
                end,
            })
        end,
    }
}


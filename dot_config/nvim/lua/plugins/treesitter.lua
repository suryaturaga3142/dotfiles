-- ~/.config/nvim/lua/plugins/treesitter.lua

return {
    "romus204/tree-sitter-manager.nvim",
    config = function()
        require("tree-sitter-manager").setup({
            auto_install = true, 
            highlight = true,    
            nerdfont = true,
            ensure_installed = {
                "bash", 
                "c", 
                "cpp", 
                "json",
                "lua", 
                "python", 
                "tcl", 
                "systemverilog", 
                "yaml", 
            },
        })
    end,
}


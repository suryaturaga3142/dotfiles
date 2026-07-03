-- ~/.config/nvim/lua/user/filetypes.lua

-- File extensions and types
vim.filetype.add({
    extension = {
        v = 'verilog',
        vh = 'systemverilog',
        sv = 'systemverilog',
        svh = 'systemverilog',
    },
})

vim.filetype.add({
    extension = {
        ['do'] = 'tcl',
    },
})

-- Custom configs for specific filetypes
vim.api.nvim_create_autocmd("FileType", {
    pattern = "do",
    callback = function(args)
        vim.diagnostic.enable(false, { bufnr = args.buf })
    end,
})


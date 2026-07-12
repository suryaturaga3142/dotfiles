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
vim.filetype.add({
    extension = {
        mk = 'make',
    },
    filename = {
        ['Makefile'] = 'make',
    },
})

-- Custom configs for specific filetypes
vim.api.nvim_create_autocmd("FileType", {
    pattern = "do",
    callback = function(args)
        vim.diagnostic.enable(false, { bufnr = args.buf })
    end,
})
vim.api.nvim_create_autocmd("FileType", {
    pattern = "make",
    callback = function()
        vim.opt_local.expandtab = false
        vim.opt_local.shiftwidth = 8
        vim.opt_local.tabstop = 8
    end,
})


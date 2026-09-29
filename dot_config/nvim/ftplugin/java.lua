-- ~/.config/nvim/ftplugin/java.lua

local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
-- Route workspace data to /tmp
local workspace_dir = '/tmp/' .. vim.env.USER .. '/jdtls-workspace/' .. project_name

local jdtls_bin = vim.fn.expand('~/.local/share/jdtls/bin/jdtls')

local config = {
    cmd = {
        jdtls_bin,
        '-data', workspace_dir,
    },
    root_dir = vim.fs.root(0, { 'gradlew', '.git', 'mvnw' }),
    settings = {
        java = {}
    },
    init_options = {
        bundles = {}
    },
}

require('jdtls').start_or_attach(config)


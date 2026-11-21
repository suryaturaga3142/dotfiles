-- ~/.config/nvim/ftplugin/java.lua

local jdk25 = vim.fn.expand("~/.sdkman/candidates/java/25-tem")
local jdk11 = vim.fn.expand("~/.sdkman/candidates/java/11.0.32-tem")

local root_dir = vim.fs.root(0, { 'MicroC.g4', 'gradlew', 'mvnw', 'pom.xml', 'build.gradle', 'Makefile', '.git' })
    or vim.fn.getcwd()

local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
-- Route workspace data to /tmp
local workspace_dir = '/tmp/' .. vim.env.USER .. '/jdtls-workspace/' .. project_name

local jdtls_bin = vim.fn.expand('~/.local/share/nvim/mason/packages/jdtls/bin/jdtls')

local config = {
    cmd = {
        jdtls_bin,
        '-data', workspace_dir,
    },
    root_dir = root_dir,

    handlers = {
        ['language/status'] = function(_, result)
            if result.type == 'ServiceReady' then
                vim.notify("jdtls: ServiceReady", vim.log.levels.INFO)
            end
        end,
    },

    settings = {
        java = {
            signatureHelp = { enabled = true },
            configuration = {
                runtimes = {
                    { name = "JavaSE-11", path = jdk11, default = true },
                    { name = "JavaSE-25", path = jdk25 },
                },
            },
        },
    },

    init_options = {
        bundles = {}
    },
}

require('jdtls').start_or_attach(config)


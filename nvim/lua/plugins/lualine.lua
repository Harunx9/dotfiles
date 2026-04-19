local lua_line = require 'lualine'
local lsp_progress = require 'lsp-progress'
local job_indicator = require('easy-dotnet.ui-modules.jobs').lualine

lsp_progress.setup()

lua_line.setup({
    sections = {
        lualine_a = { 'mode', job_indicator },
        lualine_c = {
            function()
                return require('lsp-progress').progress()
            end,
        }
    }
})

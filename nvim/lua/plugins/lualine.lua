local lua_line = require 'lualine'
local lsp_progress = require 'lsp-progress'
local easy_dotnet = require('easy-dotnet')

lsp_progress.setup()

lua_line.setup({
    sections = {
        lualine_a = {
            'mode',
            easy_dotnet.lualine.jobs,
            {
                easy_dotnet.lualine.run_status,
                color    = easy_dotnet.lualine.run_status_color,
                on_click = easy_dotnet.lualine.run_status_click,
            },
        },
        lualine_c = {
            function()
                return require('lsp-progress').progress()
            end,
        },
        lualine_x = { easy_dotnet.lualine.active_projects }
    }
})

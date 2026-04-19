local dotnet = require 'easy-dotnet'

dotnet.setup({
    picker = "telescope",
    background_scanning = true,
    notifications = {
        handler = function(start_event)
            local spinner = require("easy-dotnet.ui-modules.spinner").new()
            spinner:start_spinner(start_event.job.name)
            return function(finished_event)
                spinner:stop_spinner(finished_event.result.msg, finished_event.result.level)
            end
        end,
    },
})

if next(dotnet.try_get_selected_solution()) ~= nil then
    vim.keymap.set("n", "<C-r>", function()
        dotnet.project_view()
    end)
    vim.keymap.set("n", "<F33>", function()
        dotnet.run()
    end)
end

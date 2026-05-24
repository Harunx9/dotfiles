local dotnet = require 'easy-dotnet'

dotnet.setup({
    picker = "telescope",
    background_scanning = true,
    notifications = {
        handler = false
    },
})

if next(dotnet.try_get_selected_solution()) ~= nil then
    vim.keymap.set("n", "<C-r>", function()
        dotnet.project_view()
    end)
    vim.keymap.set("n", "<F33>", function()
        dotnet.debug()
    end)
end

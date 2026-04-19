local tree = require('nvim-tree')
local api = require("nvim-tree.api")

tree.setup({
    sort = {
        sorter = "case_sensitive",
    },
    view = {
        width = 30,
    },
    renderer = {
        group_empty = true,
    },
    on_attach = function(bufnr)
        local function opts(desc)
            return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
        end

        local ok, api_attach = pcall(require, "nvim-tree.api")
        assert(ok, "api module is not found")

        api_attach.config.mappings.default_on_attach(bufnr)

        vim.keymap.set('n', 'A', function()
            local node = api_attach.tree.get_node_under_cursor()
            local path = node.type == "directory" and node.absolute_path or vim.fs.dirname(node.absolute_path)
            require("easy-dotnet").create_new_item(path)
        end, opts('Create file from dotnet template'))
    end
})

api.events.subscribe(api.events.Event.TreeOpen, function()
    local tree_winid = api.tree.winid()

    if tree_winid ~= nil then
        vim.api.nvim_set_option_value('statusline', '%t', { win = tree_winid })
    end
end)

vim.api.nvim_create_autocmd({ "QuitPre" }, {
    callback = function() vim.cmd("NvimTreeClose") end,
})

vim.keymap.set("n", "<C-n>", function()
    api.tree.toggle({
        path = "<args>",
        find_file = false,
        update_root = true,
        focus = true,
    })
end, { noremap = true })

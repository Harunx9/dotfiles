vim.api.nvim_create_user_command('Packupdate',
    function()
        vim.pack.update()
    end,
    {})

vim.api.nvim_create_user_command('Packclean', function()
    local unused = vim.iter(vim.pack.get())
        :filter(function(x) return not x.active end)
        :map(function(x) return x.spec.name end)
        :totable()

    vim.pack.del(unused)
end, {})

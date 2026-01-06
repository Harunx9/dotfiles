vim.api.nvim_create_user_command('Packupd',
    function()
        vim.pack.update()
    end,
    {})

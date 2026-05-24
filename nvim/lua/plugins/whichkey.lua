vim.keymap.set("n", "<leader>?", function()
    require("which-key").show({ global = true })
end, { noremap = true })

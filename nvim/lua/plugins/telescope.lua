vim.pack.add {
    'https://github.com/nvim-lua/plenary.nvim',
    'https://github.com/nvim-telescope/telescope.nvim' }

local telescope = require 'telescope'

telescope.setup({
    pickers = {
        find_files = {
            find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
        },
        buffers = {
            sort_lastused = true,
            mappings = {
                i = {
                    ["<C-d>"] = require("telescope.actions").delete_buffer,
                },
                n = {
                    ["<C-d>"] = require("telescope.actions").delete_buffer,
                },
            },
        },
    },
})

vim.keymap.set("n", "<C-p>", "<cmd>lua require('telescope.builtin').find_files()<cr>", { noremap = true })
vim.keymap.set("n", "<leader>b", "<cmd>lua require('telescope.builtin').buffers()<cr>", { noremap = true })
vim.keymap.set("n", "<leader>s", "<cmd>lua require('telescope.builtin').lsp_workspace_symbols()<cr>", { noremap = true })
vim.keymap.set("n", "<leader>d", "<cmd>lua require('telescope.builtin').diagnostics()<cr>", { noremap = true })
vim.keymap.set("n", "<leader>o", ":TodoTelescope<cr>", { noremap = true })

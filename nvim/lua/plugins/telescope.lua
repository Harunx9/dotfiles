local telescope = require 'telescope'

telescope.setup({
    defaults = {
        layout_strategy = "flex",
        layout_config = {
            width = 0.95,
            height = 0.85,
            preview_cutoff = 120,
            flex = {
                flip_columns = 120,
            },
            horizontal = {
                preview_width = 0.55,
            },
            vertical = {
                preview_height = 0.5,
            },
        },
    },
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

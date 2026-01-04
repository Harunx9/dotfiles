vim.pack.add {
    'https://github.com/nvim-tree/nvim-web-devicons',
    'https://github.com/stevearc/oil.nvim' }

local oil = require 'oil'

oil.setup()

vim.keymap.set("n", "<C-n>", "<CMD>Oil --float<CR>", { noremap = true })

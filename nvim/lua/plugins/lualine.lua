vim.pack.add { 'https://github.com/nvim-lualine/lualine.nvim', 'https://github.com/linrongbin16/lsp-progress.nvim' }

local lua_line = require 'lualine'
local lsp_progress = require 'lsp-progress'

lsp_progress.setup()

lua_line.setup({
    sections = {
        lualine_c = {
            function()
                return require('lsp-progress').progress()
            end
        }
    }
})

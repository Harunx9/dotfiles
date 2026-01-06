vim.pack.add { 'https://github.com/nvim-treesitter/nvim-treesitter' }

local ts = require 'nvim-treesitter'

ts.setup({
    ensure_installed = { "lua", "odin", "cpp", "query", "rust" },
    auto_install = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
})

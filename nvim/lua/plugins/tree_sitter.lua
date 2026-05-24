local ts = require 'nvim-treesitter'

ts.setup({
    ensure_installed = { "lua", "odin", "cpp", "query", "rust", "c_sharp", "python" },
    auto_install = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
})

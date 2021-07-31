require("base")
require("plugins")
require("keymap")

-- THEME SETUP
vim.g.gruvbox_flat_style = "hard"
vim.cmd([[colorscheme gruvbox-flat]])

--NvimTree
vim.g.nvim_tree_git_hl = true
vim.g.nvim_tree_quit_on_open = true
vim.g.nvim_tree_lsp_diagnostics = true
vim.g.nvim_tree_update_cwd = true

--DASHBOARD
vim.g.dashboard_default_executive = "telescope"

--BlankLine
vim.g.indent_blankline_buftype_exclude = { "terminal", "dashboard", "NvimTree" }
vim.g.indent_blankline_bufname_exclude = { "terminal", "dashboard", "NvimTree" }

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

--DASHBOARD
vim.g.dashboard_default_executive = "telescope"

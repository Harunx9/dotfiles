if vim.fn.has("code") == 0 then
	require("base")
	require("plugins")
end
require("keymap")

if vim.fn.has("code") == 0 then
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
	require("onedark").load()
end

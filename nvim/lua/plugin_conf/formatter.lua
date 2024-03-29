require("formatter").setup({
	logging = false,
	filetype = {
		javascript = {
			function()
				return {
					exe = "prettier",
					args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0), "--single-quote" },
					stdin = true,
				}
			end,
		},
		lua = {
			function()
				return {
					exe = "stylua",
					args = { vim.api.nvim_buf_get_name(0) },
					stdin = false,
				}
			end,
		},
	},
})

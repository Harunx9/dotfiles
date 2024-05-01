require("telescope").setup({
	pickers = {
		-- Your special builtin config goes in here
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

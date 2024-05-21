require("telescope").setup({
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

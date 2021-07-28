local status_line = require("galaxyline")
local status_line_section = status_line.section
local theme = require("gruvbox.config")
local colors = require("gruvbox.colors").setup(theme)
status_line.short_line_list = { "NvimTree", "vista", "dbui" }

status_line_section.left[1] = {
	ViMode = {
		provider = function()
			local colors_map = {
				n = colors.blue,
				i = colors.red,
				v = colors.yellow,
				ic = colors.red,
				ix = colors.red,
				V = colors.yellow,
				c = colors.yellow2,
				[""] = colors.yellow,
				multi = colors.fg,
				ni = colors.blue,
				no = colors.blue,
				t = colors.green,
				R = colors.aqua,
				Rv = colors.aqua,
				["__"] = colors.purple,
			}
			local alias = {
				n = "<N>",
				i = "<I>",
				v = "<V>",
				ic = "<I>",
				ix = "<I>",
				V = "<VL>",
				c = "<C>",
				[""] = "<VB>",
				multi = "<M>",
				ni = "<N>",
				no = "<N>",
				t = "<T>",
				R = "<R>",
				Rv = "<R>",
				["__"] = "<->",
			}
			vim.api.nvim_command("hi GalaxyViMode guibg=" .. colors_map[vim.fn.mode()])
			return alias[vim.fn.mode()]
		end,
		highlight = { colors.black, colors.fg, "bold" },
	},
}

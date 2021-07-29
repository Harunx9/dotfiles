local status_line = require("galaxyline")
local status_line_section = status_line.section
local theme = require("gruvbox.config")
local colors = require("gruvbox.colors").setup(theme)
local condition = require("galaxyline.condition")
status_line.short_line_list = { "NvimTree", "vista", "dbui", "packer" }

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

status_line_section.left[1] = {
	Separator = {
		provider = function()
			vim.api.nvim_command("hi GalaxyViMode guibg=" .. colors_map[vim.fn.mode()])
			return " "
		end,
		separator = " ",
	},
}

status_line_section.left[2] = {
	ViMode = {
		provider = function()
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
			return " " .. alias[vim.fn.mode()] .. " "
		end,
		highlight = { colors.bg, colors.fg, "bold" },
		separator = " ",
	},
}

status_line_section.left[3] = {
	GitIcon = {
		provider = function()
			return ""
		end,
		condition = condition.check_git_workspace,
		separator = " ",
		highlight = { colors.fg, colors.bg, "bold" },
	},
}

status_line_section.left[4] = {
	GitBranch = {
		provider = "GitBranch",
		separator = " ",
		condition = condition.check_git_workspace,
		highlight = { colors.fg, colors.bg, "bold" },
	},
}

status_line_section.left[5] = {
	Separator2 = {
		provider = function() end,
		condition = condition.buffer_not_empty,
		highlight = { colors.bg, colors.purple, "bold" },
		separator = " ",
		separator_highlight = { colors.purple, colors.purple },
	},
}

status_line_section.left[6] = {
	FileIcon = {
		provider = "FileIcon",
		highlight = { colors.bg, colors.purple, "bold" },
		separator = " ",
		separator_highlight = { colors.purple, colors.purple },
		condition = condition.buffer_not_empty,
	},
}

status_line_section.left[7] = {
	FileName = {
		provider = "FileName",
		highlight = { colors.bg, colors.purple, "bold" },
		separator = " ",
		condition = condition.buffer_not_empty,
	},
}

status_line_section.mid[1] = {
	LspServer = {
		provider = "GetLspClient",
		icon = " Lsp:",
		highlight = { colors.fg, colors.bg, "bold" },
	},
}

status_line_section.right[1] = {
	ErrorSep= {
		provider = function() end,
		highlight = { colors.bg, colors.red , "bold"},
		separator = " ",
		separator_highlight = { colors.bg, colors.red },
	},
}

status_line_section.right[2] = {
	LSPErrors = {
		provider = "DiagnosticError",
		icon = "  ",
		highlight = { colors.bg, colors.red },
	},
}

status_line_section.right[3] = {
	WarnSep= {
		provider = function() end,
		highlight = { colors.bg, colors.yellow, "bold"},
		separator = " ",
		separator_highlight = { colors.bg, colors.yellow },
	},
}

status_line_section.right[4] = {

	LSPWarn = {
		provider = "DiagnosticWarn",
		icon = "  ",
		highlight = { colors.bg, colors.yellow },
	},
}

status_line_section.right[5] = {
	HintSep= {
		provider = function() end,
		highlight = { colors.bg, colors.blue, "bold"},
		separator = " ",
		separator_highlight = { colors.bg, colors.blue},
	},
}

status_line_section.right[6] = {

	LSPHint = {
		provider = "DiagnosticHint",
		icon = "  ",
		highlight = { colors.bg, colors.blue },
	},
}

status_line_section.right[7] = {
	InfoSep= {
		provider = function() end,
		highlight = { colors.bg, colors.green, "bold"},
		separator = " ",
		separator_highlight = { colors.bg, colors.green},
	},
}

status_line_section.right[8] = {
	LSPInfo = {
		provider = "DiagnosticInfo",
		icon = "  ",
		highlight = { colors.bg, colors.green },
	},
}

status_line_section.right[9] = {
	Encoding = {
		provider = "FileEncode",
		condition = condition.hide_in_width,
		separator = " ",
		highlight = { colors.fg, colors.bg },
	},
}

status_line_section.right[10] = {
	LineColumn = {
		provider = "LineColumn",
		separator = " ",
		highlight = { colors.fg, colors.bg },
	},
}

status_line_section.right[11] = {
	LinePercent = {
		provider = "LinePercent",
		separator = " ",
		highlight = { colors.fg, colors.bg },
	},
}

status_line_section.short_line_left[1] = {
	BufferType = {
		provider = "FileTypeName",
		separator = " ",
		separator_highlight = { "NONE", colors.black },
		highlight = { colors.bg, colors.blue, "bold" },
	},
}

status_line_section.short_line_left[2] = {
	SFileName = {
		provider = "SFileName",
		condition = condition.buffer_not_empty,
		highlight = { colors.fg, colors.bg, "bold" },
	},
}

status_line_section.short_line_right[1] = {
	BufferIcon = {
		provider = "BufferIcon",
		highlight = { colors.fg, colors.bg },
	},
}

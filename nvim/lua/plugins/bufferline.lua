local line = require("cokeline")

line.setup({
    default_hl = {
        fg = function(buffer)
            local hlgroups = require("cokeline.hlgroups")
            return buffer.is_focused and hlgroups.get_hl_attr("ColorColumn", "bg")
                or hlgroups.get_hl_attr("Normal", "fg")
        end,

        bg = function(buffer)
            local hlgroups = require("cokeline.hlgroups")
            return buffer.is_focused and hlgroups.get_hl_attr("Normal", "fg")
                or hlgroups.get_hl_attr("ColorColumn", "bg")
        end,

        sp = nil,
        bold = nil,
        italic = nil,
        underline = nil,
        undercurl = nil,
        strikethrough = nil,
    },
})

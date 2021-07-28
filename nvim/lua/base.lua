local global = vim.g
local options = vim.o

global.mapleader = ","

options.swapfile = false
options.laststatus = 2
options.number = true
options.relativenumber = true
options.tabstop = 4
options.softtabstop = 4
options.shiftwidth = 4
options.hidden = true
options.colorcolumn = "120"
options.mouse = "nv"
options.path = options.path .. "**"
options.clipboard = options.clipboard .. "unnamedplus"
options.backup = false
options.writebackup = false
options.wb = false
options.showmode = false
options.cursorline = true
options.incsearch = true
options.splitright = true
options.splitbelow = true
options.expandtab = true
options.guifont = "JetBrainsMono Nerd Font Mono:24"
options.completeopt = "menuone,noselect"

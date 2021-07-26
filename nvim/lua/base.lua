local global = vim.g
local options = vim.o
local map = vim.api.nvim_set_keymap

global.mapleader = ","
map("", "<leader>w:", ":w<CR>", { noremap = false })
map("", "<C-w>", ":bd<CR>", { noremap = false })
map("", "<leader>bn", ":bn<CR>", { noremap = false })
map("", "<leader>bp", ":bp<CR>", { noremap = false })

map("n", "<C-j>", "<C-w><C-j>", { noremap = true })
map("n", "<C-k>", "<C-w><C-k>", { noremap = true })
map("n", "<C-l>", "<C-w><C-l>", { noremap = true })
map("n", "<C-h>", "<C-w><C-h>", { noremap = true })

options.swapfile = true
options.dir = '/tmp'
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

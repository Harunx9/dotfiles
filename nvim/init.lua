
local g = vim.g
local o = vim.o
local map = vim.api.nvim_set_keymap

g.mapleader = ","

map("", "<C-w>", ":bd<CR>", { noremap = false })
map("", "<leader>bn", ":bn<CR>", { noremap = false })
map("", "<leader>bp", ":bp<CR>", { noremap = false })


map("n", "<C-j>", "<C-w><C-j>", { noremap = true })
map("n", "<C-k>", "<C-w><C-k>", { noremap = true })
map("n", "<C-l>", "<C-w><C-l>", { noremap = true })
map("n", "<C-h>", "<C-w><C-h>", { noremap = true })

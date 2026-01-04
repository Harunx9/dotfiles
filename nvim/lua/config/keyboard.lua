vim.keymap.set("", "<leader>w:", ":w<CR>", { noremap = false })
vim.keymap.set("", "<C-w>", ":Bdelete<CR>", { noremap = false })
vim.keymap.set("", "<leader>bn", ":bn<CR>", { noremap = false })
vim.keymap.set("", "<leader>bp", ":bp<CR>", { noremap = false })

vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { noremap = true })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { noremap = true })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { noremap = true })
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { noremap = true })


vim.keymap.set("t", "<esc>", "<C-\\><C-N>", { noremap = true })
vim.keymap.set("n", "<leader>t", ":terminal<CR>", { noremap = true })

vim.keymap.set("t", "<C-h>", "<C-\\><C-N><C-w>h", { noremap = true })
vim.keymap.set("t", "<C-j>", "<C-\\><C-N><C-w>j", { noremap = true })
vim.keymap.set("t", "<C-k>", "<C-\\><C-N><C-w>k", { noremap = true })
vim.keymap.set("t", "<C-l>", "<C-\\><C-N><C-w>l", { noremap = true })

vim.keymap.set("n", "[b", ":BufferLineCyclePrev<CR>", { noremap = true })
vim.keymap.set("n", "]b", ":BufferLineCycleNext<CR>", { noremap = true })
vim.keymap.set("n", "[p", ":BufferLinePick<CR>", { noremap = true })
vim.keymap.set("n", "]c", ":BufferLinePickClose<CR>", { noremap = true })

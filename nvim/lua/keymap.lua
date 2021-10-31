local map = vim.api.nvim_set_keymap

map("", "<leader>w:", ":w<CR>", { noremap = false })
map("", "<C-w>", ":Bdelete<CR>", { noremap = false })
map("", "<leader>bn", ":bn<CR>", { noremap = false })
map("", "<leader>bp", ":bp<CR>", { noremap = false })

map("n", "<C-j>", "<C-w><C-j>", { noremap = true })
map("n", "<C-k>", "<C-w><C-k>", { noremap = true })
map("n", "<C-l>", "<C-w><C-l>", { noremap = true })
map("n", "<C-h>", "<C-w><C-h>", { noremap = true })

map("n", "<C-n>", ":NvimTreeToggle<CR>", { noremap = true })
map("n", "<leader>rf", ":NvimTreeRefresh<CR>", { noremap = true })
map("n", "<leader>n", ":NvimTreeFindFile<CR>", { noremap = true })

map("n", "<C-p>", "<cmd>lua require('telescope.builtin').find_files()<cr>", { noremap = true })
map("n", "<leader>b", "<cmd>lua require('telescope.builtin').buffers()<cr>", { noremap = true })
map("n", "<leader>s", "<cmd>lua require('telescope.builtin').lsp_workspace_symbols()<cr>", { noremap = true })
map("n", "<leader>d", "<cmd>lua require('telescope.builtin').lsp_workspace_diagnostics()<cr>", { noremap = true })
map("n", "<leader>o", ":TodoTelescope<cr>", { noremap = true })

map("t", "<esc>", "<C-\\><C-N>", { noremap = true })
map("n", "<leader>t", ":terminal<CR>", { noremap = true })

map("t", "<C-h>", "<C-\\><C-N><C-w>h", { noremap = true })
map("t", "<C-j>", "<C-\\><C-N><C-w>j", { noremap = true })
map("t", "<C-k>", "<C-\\><C-N><C-w>k", { noremap = true })
map("t", "<C-l>", "<C-\\><C-N><C-w>l", { noremap = true })

local map = vim.api.nvim_set_keymap

map("", "<leader>w:", ":w<CR>", { noremap = false })
map("", "<C-w>", ":bd<CR>", { noremap = false })
map("", "<leader>bn", ":bn<CR>", { noremap = false })
map("", "<leader>bp", ":bp<CR>", { noremap = false })

map("n", "<C-j>", "<C-w><C-j>", { noremap = true })
map("n", "<C-k>", "<C-w><C-k>", { noremap = true })
map("n", "<C-l>", "<C-w><C-l>", { noremap = true })
map("n", "<C-h>", "<C-w><C-h>", { noremap = true })

map('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true })
map('n', '<leader>r', ':NvimTreeRefresh<CR>', { noremap = true })
map('n', '<leader>n', ':NvimTreeFindFile<CR>', { noremap = true })

map('n', '<C-p>', '<cmd>lua require(\'telescope.builtin\').find_files()<cr>', { noremap = true })
map('n', '<space>b', '<cmd>lua require(\'telescope.builtin\').buffers()<cr>', { noremap = true })
map('n', '<space>s', '<cmd>lua require(\'telescope.builtin\').lsp_workspace_symbols()<cr>', { noremap = true })
map('n', '<space>d', '<cmd>lua require(\'telescope.builtin\').lsp_workspace_diagnostics()<cr>', { noremap = true })

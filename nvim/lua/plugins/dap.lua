vim.pack.add { 'https://github.com/mfussenegger/nvim-dap', 'https://github.com/nvim-neotest/nvim-nio', 'https://github.com/rcarriga/nvim-dap-ui' }

local dap = require('dap')
local dap_ui = require('dapui')

dap_ui.setup()

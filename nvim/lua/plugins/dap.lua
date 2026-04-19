local dap = require('dap')
local dap_ui = require('dapui')

dap_ui.setup({
    layouts = {
        {
            elements = {
                { id = "easy-dotnet_cpu", size = 0.5 },
                { id = "easy-dotnet_mem", size = 0.5 },
            },
            size = 35,
            position = "right",
        },
    },
})

vim.fn.sign_define('DapBreakpoint', { text = '🔴', texthl = '', linehl = '', numhl = '' })
vim.keymap.set("n", "q", function()
    dap.terminate()
    dap.clear_breakpoints()
end, { desc = "Terminate and clear breakpoints" })

vim.keymap.set("n", "<F9>", dap.continue, { desc = "Start/continue debugging" })
vim.keymap.set("n", "<F8>", dap.step_over, { desc = "Step over" })
vim.keymap.set("n", "<F7>", dap.step_into, { desc = "Step into" })
vim.keymap.set("n", "<F5>", dap.step_out, { desc = "Step out" })
vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, { desc = "Toggle breakpoint" })
vim.keymap.set("n", "<leader>dC", dap.run_to_cursor, { desc = "Run to cursor" })
vim.keymap.set("n", "<leader>dr", dap.repl.toggle, { desc = "Toggle DAP REPL" })
vim.keymap.set("n", "<leader>dj", dap.down, { desc = "Go down stack frame" })
vim.keymap.set("n", "<leader>dk", dap.up, { desc = "Go up stack frame" })

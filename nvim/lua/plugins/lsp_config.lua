vim.pack.add {
    'https://github.com/neovim/nvim-lspconfig',
    'https://github.com/onsails/lspkind.nvim',
    'https://github.com/mason-org/mason.nvim',
    'https://github.com/mason-org/mason-lspconfig.nvim', }

local mason = require("mason")
local mason_lsp = require("mason-lspconfig")
local lsp_kind = require("lspkind")

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    virtual_text = true,
    signs = true,
})

lsp_kind.init({
    mode = "symbol_text",
    preset = "default",
    symbol_map = {
        Text = "",
        Method = "ƒ",
        Function = "",
        Constructor = "",
        Variable = "",
        Class = "",
        Property = "",
        Unit = "",
        Enum = "了",
        Color = "",
        File = "",
        Folder = "",
        EnumMember = "",
        Constant = "",
        Struct = "",
    },
})

local source_mapping = {
    buffer = "[Buffer]",
    nvim_lsp = "[LSP]",
    nvim_lua = "[Lua]",
    cmp_tabnine = "[TN]",
    path = "[Path]",
}

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

mason.setup()
mason_lsp.setup()

vim.api.nvim_create_autocmd("LspAttach",
    {
        callback = function(ev)
            local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))
            if client:supports_method('textDocument/completion') then
                vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
            end
        end
    })


vim.api.nvim_create_autocmd("BufWritePre", {
    callback = function()
        local mode = vim.api.nvim_get_mode().mode
        local filetype = vim.bo.filetype
        if vim.bo.modified == true and mode == 'n' and filetype ~= "oil" then
            vim.cmd('lua vim.lsp.buf.format()')
        else
        end
    end
})

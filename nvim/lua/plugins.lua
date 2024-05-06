local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    "TimUntersberger/neogit",

    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup()
        end,
    },

    {
        "nvim-treesitter/nvim-treesitter",
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = { "lua", "odin", "cpp", "query" },
                auto_install = true,
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
            })
        end
    },

    {
        "glepnir/lspsaga.nvim",
        branch = "main",
        config = function()
            require("lspsaga").setup({
                ui = {
                    -- Currently, only the round theme exists
                    theme = "round",
                    -- This option only works in Neovim 0.9
                    title = true,
                    -- Border type can be single, double, rounded, solid, shadow.
                    border = "solid",
                    winblend = 0,
                    expand = "",
                    collapse = "",
                    preview = " ",
                    code_action = "󰌶",
                    diagnostic = "",
                    hover = " ",
                    kind = {},
                },
            })
        end,
        dependencies = {
            { "nvim-tree/nvim-web-devicons" },
            { "nvim-treesitter/nvim-treesitter" },
        },
    },

    "j-hui/fidget.nvim",

    "jubnzv/virtual-types.nvim",

    {
        'stevearc/oil.nvim',
        opts = {},
        -- Optional dependencies
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },

    "hrsh7th/nvim-cmp",

    "hrsh7th/cmp-nvim-lua",

    {
        "neovim/nvim-lspconfig",
        dependencies = {
            { "hrsh7th/cmp-nvim-lsp" },
            { "hrsh7th/cmp-buffer" },
            {
                "williamboman/mason.nvim",
            },
            { "williamboman/mason-lspconfig.nvim" },
        },
        config = function()
            require("plugin_conf.lsp")
        end,
    },

    {
        "akinsho/bufferline.nvim",
        dependencies = {
            {
                "kyazdani42/nvim-web-devicons",
            },
        },
        config = function()
            require("bufferline").setup({
                options = {
                    indicator = { icon = "▎", style = "icon" },
                    diagnostics = "nvim_lsp",
                    modified_icon = "●",
                    close_command = "bdelete %d",
                    right_mouse_command = "bdelete! %d",
                    separator_style = "slant",
                    left_trunc_marker = "",
                    right_trunc_marker = "",
                    offsets = { { filetype = "nvimtree", text = "explorer", text_align = "center" } },
                    show_tab_indicators = true,
                    show_close_icon = false,
                },
            })
        end,
    },

    {
        "mhartington/formatter.nvim",
        config = function()
            require("plugin_conf.formatter")
        end,
    },

    {
        "nvim-telescope/telescope.nvim",
        config = function()
            require("plugin_conf.telescope")
        end,
        dependencies = {
            {
                "nvim-lua/popup.nvim",
            },
            {
                "nvim-lua/plenary.nvim",
            },
        },
    },

    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "kyazdani42/nvim-web-devicons",
            opt = true,
        },
        config = function()
            require("lualine").setup({})
        end,
    },

    {
        "onsails/lspkind-nvim",
    },

    "lukas-reineke/indent-blankline.nvim",

    "wakatime/vim-wakatime",

    "L3MON4D3/LuaSnip",

    {
        "glepnir/dashboard-nvim",
        event = "VimEnter",
        config = function()
            require("dashboard").setup({})
        end,
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },

    "famiu/bufdelete.nvim",

    {
        "kristijanhusak/orgmode.nvim",
        dependencies = {
            { "akinsho/org-bullets.nvim" },
        },
        config = function()
            require("orgmode").setup_ts_grammar()
            require("org-bullets").setup({
                symbols = { "◉", "○", "✸", "✿" },
            })

            require("orgmode").setup({})
        end,
    },

    {
        "folke/todo-comments.nvim",
        dependencies = "nvim-lua/plenary.nvim",
        config = function()
            require("todo-comments").setup({
                search = {
                    command = "ag",
                    args = {
                        "--nogroup",
                        "--nocolor",
                        "--column",
                    },
                },
            })
        end,
    },

    {
        "terrortylor/nvim-comment",
        config = function()
            require("nvim_comment").setup()
        end,
    },
    {
        'navarasu/onedark.nvim',
        config = function()
            require('onedark').setup {
                style = 'darker'
            }
            require('onedark').load()
        end
    },
    "github/copilot.vim"
})

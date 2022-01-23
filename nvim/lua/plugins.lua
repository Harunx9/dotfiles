return (require("packer")).startup(function()
	use({
		"npxbr/glow.nvim",
		run = ":GlowInstall",
	})
	use({
		"TimUntersberger/neogit",
	})
	use("wbthomason/packer.nvim")
	use({
		"tami5/lspsaga.nvim",
		config = function()
			require("lspsaga").setup({})
		end,
	})
	use({
		"navarasu/onedark.nvim",
		config = function()
			require("onedark").setup({
				style = "darker",
			})
		end,
	})
	use("jubnzv/virtual-types.nvim")
	use({
		"kyazdani42/nvim-tree.lua",
		requires = {
			{ "kyazdani42/nvim-web-devicons" },
		},
		config = function()
			require("nvim-tree").setup({
				diagnostics = {
					enable = true,
					icons = {
						hint = "",
						info = "",
						warning = "",
						error = "",
					},
				},
				update_cwd = true,
			})
		end,
	})
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		config = function()
			(require("nvim-treesitter.configs")).setup({
				ensure_installed = "maintained",
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				},
			})
		end,
	})
	use({
		"neovim/nvim-lspconfig",
		requires = {
			{
				"williamboman/nvim-lsp-installer",
			},
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/nvim-cmp" },
		},
		config = function()
			require("plugin_conf.lsp")
		end,
	})
	use({
		"akinsho/bufferline.nvim",
		requires = {
			{
				"kyazdani42/nvim-web-devicons",
			},
		},
		config = function()
			require("bufferline").setup({
				diagnostics = "nvim_lsp",
				options = {
					indicator_icon = " ",
					buffer_close_icon = "",
					modified_icon = "●",
					close_icon = "",
					close_command = "Bdelete %d",
					right_mouse_command = "Bdelete! %d",
					left_trunc_marker = "",
					right_trunc_marker = "",
					offsets = { { filetype = "NvimTree", text = "EXPLORER", text_align = "center" } },
					show_tab_indicators = true,
					show_close_icon = false,
				},
				highlights = {
					fill = {
						guifg = { attribute = "fg", highlight = "Normal" },
						guibg = { attribute = "bg", highlight = "StatusLineNC" },
					},
					background = {
						guifg = { attribute = "fg", highlight = "Normal" },
						guibg = { attribute = "bg", highlight = "StatusLine" },
					},
					buffer_visible = {
						gui = "",
						guifg = { attribute = "fg", highlight = "Normal" },
						guibg = { attribute = "bg", highlight = "Normal" },
					},
					buffer_selected = {
						gui = "",
						guifg = { attribute = "fg", highlight = "Normal" },
						guibg = { attribute = "bg", highlight = "Normal" },
					},
					separator = {
						guifg = { attribute = "bg", highlight = "Normal" },
						guibg = { attribute = "bg", highlight = "StatusLine" },
					},
					separator_selected = {
						guifg = { attribute = "fg", highlight = "Special" },
						guibg = { attribute = "bg", highlight = "Normal" },
					},
					separator_visible = {
						guifg = { attribute = "fg", highlight = "Normal" },
						guibg = { attribute = "bg", highlight = "StatusLineNC" },
					},
					close_button = {
						guifg = { attribute = "fg", highlight = "Normal" },
						guibg = { attribute = "bg", highlight = "StatusLine" },
					},
					close_button_selected = {
						guifg = { attribute = "fg", highlight = "normal" },
						guibg = { attribute = "bg", highlight = "normal" },
					},
					close_button_visible = {
						guifg = { attribute = "fg", highlight = "normal" },
						guibg = { attribute = "bg", highlight = "normal" },
					},
				},
			})
		end,
	})
	use({
		"mhartington/formatter.nvim",
		config = function()
			require("plugin_conf.formatter")
		end,
	})
	use({
		"nvim-telescope/telescope.nvim",
		config = function()
			require("plugin_conf.telescope")
		end,
		requires = {
			{
				"nvim-lua/popup.nvim",
			},
			{
				"nvim-lua/plenary.nvim",
			},
		},
	})
	use({
		"nvim-lualine/lualine.nvim",
		requires = {
			"kyazdani42/nvim-web-devicons",
			opt = true,
		},
		config = function()
			require("lualine").setup({
				options = {
					theme = "onedark",
				},
			})
		end,
	})
	use({
		"onsails/lspkind-nvim",
	})
	use("lukas-reineke/indent-blankline.nvim")
	use({
		"wakatime/vim-wakatime",
	})
	use({
		"L3MON4D3/LuaSnip",
	})
	use({
		"glepnir/dashboard-nvim",
	})
	use({
		"akinsho/dependency-assist.nvim",
		config = function()
			(require("dependency_assist")).setup({})
		end,
	})
	use("famiu/bufdelete.nvim")
	use({
		"kristijanhusak/orgmode.nvim",
		requires = {
			{ "akinsho/org-bullets.nvim" },
		},
		config = function()
			local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
			parser_config.org = {
				install_info = {
					url = "https://github.com/milisims/tree-sitter-org",
					revision = "main",
					files = { "src/parser.c", "src/scanner.cc" },
				},
				filetype = "org",
			}
			require("nvim-treesitter.configs").setup({
				-- If TS highlights are not enabled at all, or disabled via `disable` prop, highlighting will fallback to default Vim syntax highlighting
				highlight = {
					enable = true,
					disable = { "org" }, -- Remove this to use TS highlighter for some of the highlights (Experimental)
					additional_vim_regex_highlighting = { "org" }, -- Required since TS highlighter doesn't support all syntax features (conceal)
				},
				ensure_installed = { "org" }, -- Or run :TSUpdate org
			})
			require("org-bullets").setup({
				symbols = { "◉", "○", "✸", "✿" },
			})

			require("orgmode").setup({})
		end,
	})
	use({
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
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
	})
	use({
		"terrortylor/nvim-comment",
		config = function()
			require("nvim_comment").setup()
		end,
	})
end)

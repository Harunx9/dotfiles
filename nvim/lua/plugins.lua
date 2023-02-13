return (require("packer")).startup(function()
	use("wbthomason/packer.nvim")
	use("kaiuri/nvim-juliana")
	use({
		"npxbr/glow.nvim",
		run = ":GlowInstall",
	})
	use({
		"TimUntersberger/neogit",
	})
	use({
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	})
	use({
		"glepnir/lspsaga.nvim",
		branch = "main",
		config = function()
			require("lspsaga").setup({})
		end,
		requires = {
			{ "nvim-tree/nvim-web-devicons" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
	})
	use({
		"j-hui/fidget.nvim",
		config = function()
			require("fidget").setup({})
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
	use({ "p00f/nvim-ts-rainbow" })
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		config = function()
			(require("nvim-treesitter.configs")).setup({
				hilight = {
					enable = true,
				},
				rainbow = {
					enable = true,
					extended_mode = true,
				},
			})
		end,
	})
	use({ "hrsh7th/nvim-cmp" })
	use({ "hrsh7th/cmp-nvim-lua" })
	use({ "tzachar/cmp-tabnine", run = "./install.sh", requires = "hrsh7th/nvim-cmp" })
	use({
		"neovim/nvim-lspconfig",
		requires = {
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
				options = {
					indicator = { icon = "▎", style = "icon" },
					diagnostics = "nvim_lsp",
					buffer_close_icon = "",
					modified_icon = "●",
					close_icon = "",
					close_command = "bdelete %d",
					right_mouse_command = "bdelete! %d",
					left_trunc_marker = "",
					right_trunc_marker = "",
					offsets = { { filetype = "nvimtree", text = "explorer", text_align = "center" } },
					show_tab_indicators = true,
					show_close_icon = false,
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
			require("lualine").setup({})
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
		event = "VimEnter",
		config = function()
			require("dashboard").setup({})
		end,
		requires = { "nvim-tree/nvim-web-devicons" },
	})
	use("famiu/bufdelete.nvim")
	use({
		"kristijanhusak/orgmode.nvim",
		requires = {
			{ "akinsho/org-bullets.nvim" },
		},
		config = function()
			require("orgmode").setup_ts_grammar()
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

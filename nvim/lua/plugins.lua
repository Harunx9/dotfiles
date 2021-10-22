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
		"projekt0n/github-nvim-theme",
		config = function()
			require("github-theme").setup({
				theme_style = "dark",
				comment_style = "italic",
				keyword_style = "italic",
				function_style = "italic",
				variable_style = "NONE",
			})
		end,
	})
	use({
		"kyazdani42/nvim-tree.lua",
		requires = "kyazdani42/nvim-web-devicons",
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
			"williamboman/nvim-lsp-installer",
			opt = true,
		},
		config = function()
			require("plugin_conf.lsp")
		end,
	})
	use({
		"hrsh7th/nvim-compe",
		config = function()
			require("plugin_conf.comple")
		end,
	})
	use({
		"weilbith/nvim-code-action-menu",
		cmd = "CodeActionMenu",
	})
	use({
		"akinsho/bufferline.nvim",
		requires = {
			"kyazdani42/nvim-web-devicons",
			opt = true,
		},
		config = function()
			(require("bufferline")).setup()
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
		"hoob3rt/lualine.nvim",
		requires = {
			"kyazdani42/nvim-web-devicons",
			opt = true,
		},
		config = function()
			(require("lualine")).setup({
				options = {
					theme = "onedark",
				},
				sections = {

					lualine_c = {
						"filename",
						{
							"diagnostics",
							-- table of diagnostic sources, available sources:
							-- nvim_lsp, coc, ale, vim_lsp
							sources = { "nvim_lsp" },
							-- displays diagnostics from defined severity
							sections = { "error", "warn", "info", "hint" },
							-- all colors are in format #rrggbb
							symbols = { error = "", warn = "", info = "", hint = "" },
						},
					},
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
		config = function()
			require("orgmode").setup({})
		end,
	})
end)

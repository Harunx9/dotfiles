return require("packer").startup(function()
	use({ "npxbr/glow.nvim", run = ":GlowInstall" })
	use({ "TimUntersberger/neogit" })
	use("wbthomason/packer.nvim")
	use("navarasu/onedark.nvim")
	use({
		"kyazdani42/nvim-tree.lua",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("nvim-tree").setup({})
		end,
	})
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
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
		requires = { "kabouzeid/nvim-lspinstall", opt = true },
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
		requires = "kyazdani42/nvim-web-devicons",
		config = require("bufferline").setup(),
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
		requires = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } },
	})
	use({
		"hoob3rt/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
		config = require("lualine").setup({
			options = {
				theme = "onedark",
			},
		}),
	})
	use({ "onsails/lspkind-nvim" })
	use("lukas-reineke/indent-blankline.nvim")
	use({ "wakatime/vim-wakatime" })
	use({ "L3MON4D3/LuaSnip" })
	use({ "glepnir/dashboard-nvim" })
	use({
		"akinsho/dependency-assist.nvim",
		config = function()
			require("dependency_assist").setup({})
		end,
	})
	use("famiu/bufdelete.nvim")
end)

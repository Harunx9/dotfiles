return require("packer").startup(function()
	use({ "TimUntersberger/neogit" })
	use("wbthomason/packer.nvim")
	use("eddyekofo94/gruvbox-flat.nvim")
	use("kyazdani42/nvim-tree.lua")
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
	use("glepnir/lspsaga.nvim")
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
		"glepnir/galaxyline.nvim",
		branch = "main",
		config = function()
			require("plugin_conf.galaxyline")
		end,
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})
	use({ "onsails/lspkind-nvim" })
	use("lukas-reineke/indent-blankline.nvim")
	use({ "wakatime/vim-wakatime" })
	use({ "L3MON4D3/LuaSnip" })
	use({ "glepnir/dashboard-nvim" })
end)

return require("packer").startup(function()
	use("wbthomason/packer.nvim")
	use("eddyekofo94/gruvbox-flat.nvim")
	use("kyazdani42/nvim-tree.lua")
	use({ "nvim-treesitter/nvim-treesitter", cmd = { "TSUpdate" } })
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
end)

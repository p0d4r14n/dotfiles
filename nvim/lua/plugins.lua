local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

local function get_config(name)
  return string.format("require('config/%s')", name)
end

if fn.empty(fn.glob(install_path)) > 0 then
  	packer_bootstrap = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer...")
	vim.api.nvim_command("packadd packer.nvim")
end

local packer = require("packer")

packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float()
		end
	},
})

packer.startup(function(use)
	use({ "wbthomason/packer.nvim" })
	use({ "neovim/nvim-lspconfig", config = get_config("lsp") })
	use({ "L3MON4D3/LuaSnip" })
	use({ "saadparwaiz1/cmp_luasnip" })
	use({
		"hrsh7th/nvim-cmp",
		requires = {
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
		},
		config = get_config("cmp"),
	})
	use({
	  "nvim-telescope/telescope.nvim",
	  requires = { { "nvim-lua/plenary.nvim" } },
	  config = get_config("telescope"),
	})
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use({ "nvim-telescope/telescope-file-browser.nvim" })
	use({ "kyazdani42/nvim-web-devicons" })
	use({
		"nvim-treesitter/nvim-treesitter",
		config = get_config("treesitter"),
	})
	use({
		"catppuccin/nvim",
		as = "catppuccin",
		config = get_config("catppuccin"),
	})
	if packer_bootstrap then
		packer.sync()
	end
end)

local fn = vim.fn

-- Automaticall install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer, close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save this file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	autoremove = true,
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install plugins here
return packer.startup(function(use)
	use("wbthomason/packer.nvim") -- So packer auto updates
	use("nvim-lua/popup.nvim")
	use("nvim-lua/plenary.nvim")

	use("tpope/vim-commentary") -- Commenting with gcc & gc
	use("ap/vim-css-color")
	use("ryanoasis/vim-devicons")
	use("nvim-lualine/lualine.nvim")
	use("rcarriga/nvim-notify")
	use("glepnir/dashboard-nvim")
	use("kyazdani42/nvim-tree.lua")
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use("p00f/nvim-ts-rainbow")
	use("andweeb/presence.nvim")
	use("windwp/nvim-autopairs")
	use("folke/which-key.nvim")
	use("akinsho/toggleterm.nvim")
	use("nvim-telescope/telescope.nvim")
	use("norcalli/nvim-colorizer.lua")
	use("sunjon/shade.nvim")
	use("jghauser/mkdir.nvim")
	use("github/copilot.vim")
	use({
		"zbirenbaum/copilot.lua",
		event = { "VimEnter" },
		config = function()
			vim.defer_fn(function()
				require("copilot").setup()
			end, 100)
		end,
	})
	use("windwp/nvim-ts-autotag")
	use("mhartington/formatter.nvim")

	-- Themes
	use("yashguptaz/calvera-dark.nvim")
	use("tiagovla/tokyodark.nvim")
	use("shaunsingh/moonlight.nvim")
	use("bluz71/vim-moonfly-colors")
	use("rafamadriz/neon")
	use("marko-cerovac/material.nvim")
	use("tomasiser/vim-code-dark")
	use("bluz71/vim-nightfly-guicolors")
	use("glepnir/zephyr-nvim")

	-- LSP
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")

	-- CMP
	use("neovim/nvim-lspconfig")
	use("onsails/lspkind.nvim")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-nvim-lsp")
	use({ "zbirenbaum/copilot-cmp", module = "copilot_cmp" })

	-- Snippets
	use("l3mon4d3/LuaSnip")
	use("saadparwaiz1/cmp_luasnip")

	-- Keep this at the bottom, below all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)

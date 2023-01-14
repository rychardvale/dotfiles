local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	vim.fn.execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
end

vim.cmd([[ packadd packer.nvim ]])
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]
return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")
	use("nvim-lua/plenary.nvim")
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use({
		"nvim-treesitter/nvim-treesitter-context",
		config = function()
			require("treesitter-context").setup()
		end,
	})
	use("nvim-telescope/telescope.nvim")
	use("nvim-telescope/telescope-project.nvim")
	use({ "nvim-telescope/telescope-file-browser.nvim" })
	use("NvChad/nvim-colorizer.lua")

	use({
		"j-hui/fidget.nvim",
		config = function()
			require("fidget").setup()
		end,
	})

	use("neovim/nvim-lspconfig")
	use("onsails/lspkind.nvim")
	use({
		"folke/trouble.nvim",
		config = function()
			require("trouble").setup()
		end,
	})

	use("kyazdani42/nvim-web-devicons")

	-- status line
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})
	use({
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	})
	use("williamboman/mason-lspconfig.nvim")

	use({
		"iamcco/markdown-preview.nvim",
		run = "cd app && npm install",
		setup = function() end,
		ft = { "markdown" },
	})

	--cmp
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-nvim-lua")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-cmdline")

	-- debugers
	use("mfussenegger/nvim-dap")
	use("rcarriga/nvim-dap-ui")
	use("jayp0521/mason-nvim-dap.nvim")

	--snippets
	use("L3MON4D3/LuaSnip")
	use("saadparwaiz1/cmp_luasnip")

	use("jose-elias-alvarez/null-ls.nvim")
	use("windwp/nvim-ts-autotag")
	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup()
		end,
	})
	use({
		"akinsho/bufferline.nvim",
		requires = "kyazdani42/nvim-web-devicons",
	})
	use("ahmedkhalf/project.nvim")
	use("glepnir/lspsaga.nvim")

	use("numToStr/Comment.nvim")
	use("JoosepAlviste/nvim-ts-context-commentstring")
	use({
		"lewis6991/gitsigns.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		config = function()
			require("gitsigns").setup()
		end,
	})
	use("tpope/vim-fugitive")
	use("ThePrimeagen/git-worktree.nvim")

	use("stevearc/oil.nvim")
	use({ "kevinhwang91/nvim-ufo", requires = "kevinhwang91/promise-async" })

	-- Themmes
	use("navarasu/onedark.nvim")
	use("folke/tokyonight.nvim")
	use({ "catppuccin/nvim", as = "catppuccin" })
	use({ "ellisonleao/gruvbox.nvim" })

	-- use("eandrju/cellular-automaton.nvim")
	use("RRethy/vim-illuminate")
end)

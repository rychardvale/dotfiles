local lazypath = vim.fn.stdpath('data') .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
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
	"nvim-lua/plenary.nvim",
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		config = function()
			require("treesitter-context").setup()
		end,
	},

	"nvim-telescope/telescope.nvim",
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
	},

	{
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v1.x',
		dependencies = {
			-- LSP Support
			{ 'neovim/nvim-lspconfig' },
			{
				'williamboman/mason.nvim',
				build = function()
					pcall(vim.cmd, 'MasonUpdate')
				end,
			},
			{ 'williamboman/mason-lspconfig.nvim' },

			-- Autocompletion
			{ 'hrsh7th/nvim-cmp' }, -- Required
			{ 'hrsh7th/cmp-nvim-lsp' }, -- Required
			{ "hrsh7th/cmp-cmdline" },
			{ 'hrsh7th/cmp-buffer' }, -- Optional
			{ 'hrsh7th/cmp-path' }, -- Optional
			{ 'saadparwaiz1/cmp_luasnip' }, -- Optional
			{ 'hrsh7th/cmp-nvim-lua' }, -- Optional

			-- Snippets
			{ 'L3MON4D3/LuaSnip' },    -- Required
			{ 'rafamadriz/friendly-snippets' }, -- Optional
		}
	},

	"NvChad/nvim-colorizer.lua",

	{
		"folke/trouble.nvim",
		dependencies = { "kyazdani42/nvim-web-devicons" },
		config = function()
			require("trouble").setup()
		end,
	},

	{
		"sindrets/diffview.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	{
		"j-hui/fidget.nvim",
		config = function()
			require("fidget").setup()
		end,
	},

	"kyazdani42/nvim-web-devicons",

	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "kyazdani42/nvim-web-devicons" },
	},
	{
		"iamcco/markdown-preview.nvim",
		build = "cd app && npm install",
		ft = { "markdown" },
	},


	"jose-elias-alvarez/null-ls.nvim",
	"windwp/nvim-ts-autotag",
	{
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup()
		end,
	},
	{
		"akinsho/bufferline.nvim",
		dependencies = { "kyazdani42/nvim-web-devicons" },
	},
	"numToStr/Comment.nvim",
	"JoosepAlviste/nvim-ts-context-commentstring",
	{
		"lewis6991/gitsigns.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("gitsigns").setup()
		end,
	},
	"tpope/vim-fugitive",
	"ThePrimeagen/git-worktree.nvim",
	"stevearc/oil.nvim",

	-- Themmes
	"folke/tokyonight.nvim",
	{ "ellisonleao/gruvbox.nvim" },
	"sainnhe/gruvbox-material",
})

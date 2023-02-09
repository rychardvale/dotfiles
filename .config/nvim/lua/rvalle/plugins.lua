local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
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
	{ "nvim-telescope/telescope-file-browser.nvim" },
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
		-- build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build"
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
		"j-hui/fidget.nvim",
		config = function()
			require("fidget").setup()
		end,
	},

	"neovim/nvim-lspconfig",
	"onsails/lspkind.nvim",
	"kyazdani42/nvim-web-devicons",

	-- status line
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "kyazdani42/nvim-web-devicons" },
	},
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	"williamboman/mason-lspconfig.nvim",
	{
		"iamcco/markdown-preview.nvim",
		build = "cd app && npm install",
		ft = { "markdown" },
	},

	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-nvim-lua",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-cmdline",

	-- debugers
	--[[ use("mfussenegger/nvim-dap")
	use("rcarriga/nvim-dap-ui")
	use("jayp0521/mason-nvim-dap.nvim") ]]

	--snippets
	"L3MON4D3/LuaSnip",
	"saadparwaiz1/cmp_luasnip",

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
	"glepnir/lspsaga.nvim",
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
	"ThePrimeagen/harpoon",
	"stevearc/oil.nvim",

	-- Themmes
	"navarasu/onedark.nvim",
	"folke/tokyonight.nvim",
	{ "catppuccin/nvim", as = "catppuccin" },
	{ "ellisonleao/gruvbox.nvim" },
	"RRethy/vim-illuminate",
})

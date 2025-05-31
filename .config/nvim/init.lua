vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.termguicolors = true

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	"tpope/vim-fugitive",
	"tpope/vim-rhubarb",
	"tpope/vim-sleuth",

	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "williamboman/mason.nvim", config = true },
			"williamboman/mason-lspconfig.nvim",

			{ "j-hui/fidget.nvim", opts = {} },

			"folke/neodev.nvim",
		},
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			{
				"L3MON4D3/LuaSnip",
				build = (function()
					if vim.fn.has("win32") == 1 then
						return
					end
					return "make install_jsregexp"
				end)(),
			},
			"saadparwaiz1/cmp_luasnip",

			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",

			"rafamadriz/friendly-snippets",
		},
	},

	{
		"nvim-lualine/lualine.nvim",
		opts = {
			options = {
				icons_enabled = true,
				theme = "auto",
				component_separators = "|",
				section_separators = "",
				sections = {
					lualine_a = {
						{
							"filename",
							path = 4,
						},
					},
					lualine_b = {
						{
							"filename",
							path = 4,
						},
					},
					lualine_c = {
						{
							"filename",
							path = 4,
						},
					},
				},
			},
		},
	},

	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
				cond = function()
					return vim.fn.executable("make") == 1
				end,
			},
		},
	},

	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
		build = ":TSUpdate",
	},

	{ import = "custom.plugins" },
}, {})

require("telescope").setup({
	defaults = {
		mappings = {},
	},
})

pcall(require("telescope").load_extension, "fzf")
pcall(require("telescope").load_extension, "git-worktree")

vim.keymap.set("n", "<leader>/", function()
	require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
		winblend = 0,
		previewer = false,
	}))
end, { desc = "[/] Fuzzily search in current buffer" })

require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"c",
		"cpp",
		"go",
		"lua",
		"python",
		"rust",
		"tsx",
		"javascript",
		"typescript",
		"vimdoc",
		"vim",
		"bash",
		"markdown",
	},
	disable = { "yaml", "yml" },
	auto_install = false,
	sync_install = false,
	ignore_install = {},
	modules = {},
	highlight = { enable = true, disable = { "yaml", "yml" } },
	indent = { enable = true, disable = { "yaml", "yml" } },
})
require("custom.options")
require("custom.remaps")
require("custom.cmp")
require("custom.lsp")

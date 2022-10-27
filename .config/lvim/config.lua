local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
	{
		command = "prettier",
		args = {
			"--print-width=80",
			"--trailling-comma=es5",
			"--single-quote=false",
			"--tab-width=2",
			"--use-tabs=true",
		},
		fileTypes = { "typescript", "typescriptreact", "javascript" },
	},
	{
		command = "stylua",
		fileTypes = { "lua" },
	},
	{
		command = "gofmt",
		fileTypes = { "go" },
	},
})

-- vim opts
vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = false
vim.opt.ignorecase = true
vim.opt.clipboard = "unnamedplus"
vim.o.smarttab = false
vim.opt.smarttab = false

lvim.colorscheme = "catppuccin"
vim.g.catppuccin_flavour = "mocha"
lvim.leader = "space"
lvim.transparent_window = false
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<leader>f"] = false
lvim.keys.normal_mode["<leader>ff"] = require("lvim.core.telescope.custom-finders").find_project_files
lvim.keys.normal_mode["<leader>fg"] = require("telescope.builtin").live_grep
lvim.keys.normal_mode["<leader>fs"] = require("telescope.builtin").grep_string
lvim.keys.normal_mode["<leader>a"] = require("harpoon.mark").add_file
lvim.keys.normal_mode["<C-e>"] = require("harpoon.ui").toggle_quick_menu
lvim.keys.normal_mode["<C-1>"] = "<cmd>lua require('harpoon.ui').nav_file(1)<CR>"
lvim.keys.normal_mode["<C-2>"] = "<cmd>lua require('harpoon.ui').nav_file(2)<CR>"
lvim.keys.normal_mode["<C-3>"] = "<cmd>lua require('harpoon.ui').nav_file(3)<CR>"
lvim.keys.normal_mode["<C-4>"] = "<cmd>lua require('harpoon.ui').nav_file(4)<CR>"
lvim.keys.normal_mode["K"] = "<cmd>lua vim.lsp.buf.hover()<CR>"

lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.notify.opts = {
	fps = 120,
	timeout = 1500,
	stages = "fade",
	max_width = 10,
}
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false
lvim.builtin.treesitter.ensure_installed = {
	"bash",
	"c",
	"javascript",
	"json",
	"lua",
	"python",
	"typescript",
	"tsx",
	"css",
	"rust",
	"java",
	"yaml",
	"prisma",
}
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true
lvim.builtin.project.patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", ".mod" }
lvim.builtin.lualine.style = "default"

lvim.plugins = {
	{
		"ThePrimeagen/harpoon",
	},
	{
		"navarasu/onedark.nvim",
		config = function()
			require("onedark").setup({
				style = "deep",
			})
			require("onedark").load()
		end,
	},
	{
		"catppuccin/nvim",
		config = function()
			vim.g.catppuccin_flavour = "mocha"
		end,
	},
	{
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	},
	{
		"rmagatti/goto-preview",
		config = function()
			require("goto-preview").setup({
				width = 120, -- Width of the floating window
				height = 25, -- Height of the floating window
				default_mappings = false, -- Bind default mappings
				debug = false, -- Print debug information
				opacity = nil, -- 0-100 opacity level of the floating window where 100 is fully transparent.
				post_open_hook = nil, -- A function taking two arguments, a buffer and a window to be ran as a hook.
				-- You can use "default_mappings = true" setup option
				-- Or explicitly set keybindings
				-- vim.cmd("nnoremap gpd <cmd>lua require('goto-preview').goto_preview_definition()<CR>")
				-- vim.cmd("nnoremap gpi <cmd>lua require('goto-preview').goto_preview_implementation()<CR>")
				-- vim.cmd("nnoremap gP <cmd>lua require('goto-preview').close_all_win()<CR>")
			})
		end,
	},
	{
		"tpope/vim-fugitive",
		cmd = {
			"G",
			"Git",
			"Gdiffsplit",
			"Gread",
			"Gwrite",
			"Ggrep",
			"GMove",
			"GDelete",
			"GBrowse",
			"GRemove",
			"GRename",
			"Glgrep",
			"Gedit",
		},
		ft = { "fugitive" },
	},
	{
		"andweeb/presence.nvim",
		config = function()
			require("presence"):setup({
				-- General options
				auto_update = true, -- Update activity based on autocmd events (if `false`, map or manually execute `:lua package.loaded.presence:update()`)
				neovim_image_text = "The One True Text Editor", -- Text displayed when hovered over the Neovim image
				main_image = "neovim", -- Main image display (either "neovim" or "file")
				client_id = "793271441293967371", -- Use your own Discord application client id (not recommended)
				log_level = nil, -- Log messages at or above this level (one of the following: "debug", "info", "warn", "error")
				debounce_timeout = 10, -- Number of seconds to debounce events (or calls to `:lua package.loaded.presence:update(<filename>, true)`)
				enable_line_number = false, -- Displays the current line number instead of the current project
				blacklist = {}, -- A list of strings or Lua patterns that disable Rich Presence if the current file name, path, or workspace matches
				file_assets = {}, -- Custom file asset definitions keyed by file names and extensions (see default config at `lua/presence/file_assets.lua` for reference)
				buttons = false,

				-- Rich Presence text options
				editing_text = "Editing file",
				file_explorer_text = "Browsing ", -- Format string rendered when browsing a file explorer (either string or function(file_explorer_name: string): string)
				git_commit_text = "Committing changes", -- Format string rendered when committing changes in git (either string or function(filename: string): string)
				plugin_manager_text = "Editing file", -- Format string rendered when managing plugins (either string or function(plugin_manager_name: string): string)
				reading_text = "Reading %s", -- Format string rendered when a read-only or unmodifiable file is loaded in the buffer (either string or function(filename: string): string),
				workspace_text = "Working on Project", -- Format string rendered when in a git repository (either string or function(project_name: string|nil, filename: string): string)
				line_number_text = "Line %s out of %s", -- Format string rendered when `enable_line_number` is set to true (either string or function(line_number: number, line_count: number): string)
			})
		end,
	},
}

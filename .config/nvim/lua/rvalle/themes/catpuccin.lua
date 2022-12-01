local ok_cat, cat = pcall(require, "catppuccin")
if not ok_cat then
	return
end

vim.g.catppuccin_flavour = "macchiato"
cat.setup({
	transparent_background = false,
	term_colors = false,
	compile = {
		enabled = false,
		path = vim.fn.stdpath("cache") .. "/catppuccin",
	},
	styles = {
		comments = { "italic" },
		conditionals = { "italic" },
		loops = {},
		functions = {},
		keywords = {},
		strings = {},
		variables = {},
		numbers = {},
		booleans = {},
		properties = {},
		types = {},
		operators = {},
	},
	integrations = {
		telescope = true,
		nvimtree = true,
		cmp = true,
		treesitter = true,
	},
	color_overrides = {},
	custom_highlights = {
		CursorLine = { bg = "NONE", fg = "NONE" },
		TelescopeNormal = {
			bg = "NONE",
			fg = "NONE",
		},
		TelescopeBorder = {
			bg = "NONE",
			fg = "NONE",
		},
		TelescopePromptTitle = {
			bg = "NONE",
		},
		TelescopePreviewTitle = {
			bg = "NONE",
			fg = "NONE",
		},
		TelescopeResultsTitle = {
			bg = "NONE",
			fg = "NONE",
		},
	},
})

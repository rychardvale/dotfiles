local ok, lualine = pcall(require, "lualine")
if not ok then
	return
end

local colors = require("tokyonight.colors").setup()

local bubbles_theme = {
	normal = {
		a = { fg = colors.blue1, bg = colors.none },
		b = { fg = colors.green, bg = colors.none },
		c = { fg = colors.fg, bg = colors.none },
	},

	insert = { a = { fg = colors.yellow, bg = colors.none } },
	visual = { a = { fg = colors.magenta, bg = colors.none } },
	replace = { a = { fg = colors.magenta, bg = colors.none } },

	inactive = {
		a = { fg = colors.fg, bg = colors.none },
		b = { fg = colors.fg, bg = colors.none },
		c = { fg = colors.fg, bg = colors.none },
	},
}

lualine.setup({
	options = {
		theme = bubbles_theme,
	},
})

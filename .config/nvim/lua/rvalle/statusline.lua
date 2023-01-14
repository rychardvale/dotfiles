local ok, lualine = pcall(require, "lualine")
if not ok then
	return
end

local colors = require("tokyonight.colors").setup()

local tokyo_theme = {
	normal = {
		a = { fg = colors.blue1, bg = colors.bg_dark },
		b = { fg = colors.green, bg = colors.bg_dark },
		c = { fg = colors.fg, bg = colors.bg_dark },
	},

	insert = { a = { fg = colors.yellow, bg = colors.bg_dark } },
	visual = { a = { fg = colors.magenta, bg = colors.bg_dark } },
	replace = { a = { fg = colors.magenta, bg = colors.bg_dark } },

	inactive = {
		a = { fg = colors.fg, bg = colors.bg_dark },
		b = { fg = colors.fg, bg = colors.bg_dark },
		c = { fg = colors.fg, bg = colors.bg_dark },
	},
}

lualine.setup({
	options = {
		theme = tokyo_theme,
		component_separators = "|",
		-- section_separators = { left = "", right = "" },
	},
})

local ok_tokyooooo, tokyo = pcall(require, "tokyonight")
if not ok_tokyooooo then
	return
end

tokyo.setup({
	style = "moon",
	terminal_colors = true,
	transparent = true,
	on_highlights = function(hl, c)
		local green = "#ABE9B3"
		local pink = "#F28FAD"

		-- Telescope shit
		hl.TelescopeNormal = {
			bg = c.bg_dark,
			fg = c.fg_dark,
		}
		hl.TelescopeBorder = {
			bg = c.bg_dark,
			fg = c.bg_dark,
		}
		hl.TelescopePromptTitle = {
			bg = pink,
			fg = c.bg_dark,
		}
		hl.TelescopePreviewTitle = {
			bg = green,
			fg = c.bg_dark,
		}
		hl.TelescopeResultsTitle = {
			bg = green,
			fg = c.bg_dark,
		}

		-- Cursor line black
		hl.CursorLine = {
			bg = c.bg_dark,
		}
	end,
})

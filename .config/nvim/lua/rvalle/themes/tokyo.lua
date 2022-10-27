local ok_tokyooooo, tokyo = pcall(require, "tokyonight")
if not ok_tokyooooo then
	return
end

tokyo.setup({
	style = "night",
	terminal_colors = true,
	on_highlights = function(hl, c)
		local green = "#ABE9B3"
		local pink = "#F28FAD"
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
		}
		hl.TelescopePreviewTitle = {
			bg = green,
			fg = c.bg_dark,
		}
		hl.TelescopeResultsTitle = {
			bg = green,
			fg = c.bg_dark,
		}
	end,
})

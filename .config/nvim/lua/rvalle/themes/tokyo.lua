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

		-- Lsp Sga stuff
		hl.LspSagaAutoPreview = {
			fg = c.bg_dark,
			bg = c.bg_dark,
		}

		hl.LspSagaHoverBorder = {
			bg = c.bg_dark,
			fg = c.bg_dark,
		}

		hl.FloatBorder = {
			bg = c.bg_dark,
		}

		-- Finder
		hl.LspSagaLspFinderBorder = {
			fg = c.bg_dark,
			bg = c.bg_dark,
		}
		hl.LspSagaFinderSelection = {
			fg = c.blue1,
			bg = c.bg_dark,
		}
		hl.FinderPreviewSearch = {
			bg = c.bg_dark,
		}
		hl.FinderParam = {
			fg = c.blue1,
			bg = c.bg_dark,
		}
		hl.FinderSpinnerTitle = {
			bg = c.bg_dark,
			fg = pink,
		}
		hl.FinderSpinner = {
			bg = c.bg_dark,
			fg = c.blue1,
		}
		hl.FinderSpinnerBorder = {
			bg = c.bg_dark,
			fg = c.bg_dark,
		}
	end,
})

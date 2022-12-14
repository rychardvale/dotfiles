local ok_tokyooooo, tokyo = pcall(require, "tokyonight")
if not ok_tokyooooo then
	return
end
--[[ local M = {}
M.default = {
  none = "NONE",
  bg_dark = "#1f2335",
  bg = "#24283b",
  bg_highlight = "#292e42",
  terminal_black = "#414868",
  fg = "#c0caf5",
  fg_dark = "#a9b1d6",
  fg_gutter = "#3b4261",
  dark3 = "#545c7e",
  comment = "#565f89",
  dark5 = "#737aa2",
  blue0 = "#3d59a1",
  blue = "#7aa2f7",
  cyan = "#7dcfff",
  blue1 = "#2ac3de",
  blue2 = "#0db9d7",
  blue5 = "#89ddff",
  blue6 = "#b4f9f8",
  blue7 = "#394b70",
  magenta = "#bb9af7",
  magenta2 = "#ff007c",
  purple = "#9d7cd8",
  orange = "#ff9e64",
  yellow = "#e0af68",
  green = "#9ece6a",
  green1 = "#73daca",
  green2 = "#41a6b5",
  teal = "#1abc9c",
  red = "#f7768e",
  red1 = "#db4b4b",
  git = { change = "#6183bb", add = "#449dab", delete = "#914c54" },
  gitSigns = {
    add = "#266d6a",
    change = "#536c9e",
    delete = "#b2555b",
  },
} ]]
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

		hl.CursorLine = {
			bg = c.bg_dark
		}
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
			-- fg = c.magenta2,
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

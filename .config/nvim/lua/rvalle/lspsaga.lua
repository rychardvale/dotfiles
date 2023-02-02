local ok, saga = pcall(require, "lspsaga")
if not ok then
	vim.notify("Saga not loaded")
	return
end

local nnoremap = require("rvalle.keymap").nnoremap

local c = require("tokyonight.colors").setup()
saga.setup({
	ui = {
		theme = "round",
		border = "none",
		code_action = "",
		diagnostic = "",
		colors = {
			normal_bg = c.bg_dark,
			title_bg = c.bg_dark,
			red = "#F28FAD",
			magenta = c.magenta,
			orange = c.orange,
			yellow = c.yellow,
			green = c.green,
			cyan = c.cyan,
			blue = c.blue,
			purple = c.purple,
			white = c.fg,
			black = c.black,
		},
	},
})

nnoremap("gd", "<cmd>Lspsaga lsp_finder<CR>")
nnoremap("gp", "<cmd>Lspsaga peek_definition<CR>")

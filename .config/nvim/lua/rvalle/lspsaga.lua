local ok, saga = pcall(require, "lspsaga")
if not ok then
	vim.notify("Saga not loaded")
	return
end

local Keymap = require("rvalle.keymap")
local nnoremap = Keymap.nnoremap

local c = require("tokyonight.colors").setup()
saga.setup({
	ui = {
		theme = "round",
		border = "none",
		code_action = "",
		diagnostic = "",
		colors = {
			normal_bg = c.bg,
			title_bg = "#ABE9B3",
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

nnoremap("<C-j>", "<cmd>Lspsaga diagnostic_jump_next<CR>")
nnoremap("<C-k>", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
nnoremap("K", "<cmd>Lspsaga hover_doc<CR>")
nnoremap("<leader>lr", "<cmd>Lspsaga rename<CR>")
nnoremap("<leader>la", "<cmd>Lspsaga code_action<CR>")
nnoremap("gd", "<cmd>Lspsaga lsp_finder<CR>")
nnoremap("gp", "<cmd>Lspsaga peek_definition<CR>")

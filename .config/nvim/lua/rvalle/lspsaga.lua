local ok, saga = pcall(require, "lspsaga")
if not ok then
	vim.notify("Saga not loaded")
	return
end

local Keymap = require("rvalle.keymap")
local nnoremap = Keymap.nnoremap

saga.init_lsp_saga({
	border_style = "rounded",
    code_action_lightbulb = {
        enable = false
    },
	server_filetype_map = {},
})

nnoremap("<C-j>", "<cmd>Lspsaga diagnostic_jump_next<CR>")
nnoremap("K", "<cmd>Lspsaga hover_doc<CR>")
nnoremap("<leader>lr", "<cmd>Lspsaga rename<CR>")
nnoremap("<leader>la", "<cmd>Lspsaga code_action<CR>")
nnoremap("gd", "<cmd>Lspsaga lsp_finder<CR>")
nnoremap("gp", "<cmd>Lspsaga peek_definition<CR>")

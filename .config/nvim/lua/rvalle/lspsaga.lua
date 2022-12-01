local ok, saga = pcall(require, "lspsaga")
if not ok then
	vim.notify("Saga not loaded")
	return
end

local Keymap = require("rvalle.keymap")
local nnoremap = Keymap.nnoremap

saga.init_lsp_saga({
    code_action_lightbulb = {
        enable = false
    },
	server_filetype_map = {},
})

nnoremap("<C-k>", "<cmd>Lspsaga diagnostic_jump_next<CR>q'")
nnoremap("<C-j>", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
nnoremap("K", "<cmd>Lspsaga hover_doc<CR>")
nnoremap("<leader>lr", "<cmd>Lspsaga rename<CR>")
nnoremap("gd", "<cmd>Lspsaga lsp_finder<CR>")
nnoremap("gp", "<cmd>Lspsaga peek_definition<CR>")

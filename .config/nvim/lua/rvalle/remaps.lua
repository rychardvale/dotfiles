local Remap = require("rvalle.keymap")
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local inoremap = Remap.inoremap

vim.g.mapleader = " "

nnoremap("<C-s>", ":w<CR>") --let me save baby
inoremap("<M-j>", "<ESC>:m .+1<CR>==gi") -- move line down
inoremap("<M-k>", "<ESC>:m .-2<CR>==gi") -- move line up
vnoremap("<M-j>", ":m '>+1<CR>gv=gv") -- move down but visual
vnoremap("<M-k>", ":m '<-2<CR>gv=gv") -- move up but visual
nnoremap("<M-j>", ":m .+1<CR>==") -- move line down
nnoremap("<M-k>", ":m .-2<CR>==") -- move line up
nnoremap("<leader>h", ":nohlsearch<CR>") -- removes highlight
nnoremap("<C-u>", "<C-u>zz")
nnoremap("<C-d>", "<C-d>zz")
nnoremap("n", "nzz")
nnoremap("N", "Nzz")
nnoremap("<leader>fml", ":CellularAutomaton make_it_rain<CR>")

-- debugger
nnoremap("<F5>", ":lua require'dap'.toggle_breakpoint()<CR>")
nnoremap("<F8>", ":lua require'dap'.continue()<CR>")
nnoremap("<F9>", ":lua require'dap'.step_into()<CR>")
nnoremap("<F10>", ":lua require'dap'.step_over()<CR>")
nnoremap("<F11>", ":lua require'dap'.step_out()<CR>")
nnoremap("<leader>db", ":lua require'dapui'.toggle()<CR>")

-- buffer stuff
nnoremap("<leader>c", function() -- closes current buffer
	local bufnr = vim.api.nvim_get_current_buf()
	if bufnr == 0 then
		return
	end
	vim.cmd(string.format("%s %d", "bdelete!", bufnr))
end) -- closes buffer
nnoremap("<leader>bj", ":BufferLinePick<CR>") -- pick buffer
nnoremap("<leader>b[", ":BufferLineCloseLeft<CR>")
nnoremap("<leader>b]", ":BufferLineCloseRight<CR>")
nnoremap("<leader>bl", ":BufferLineMoveNext<CR>")
nnoremap("<leader>bh", ":BufferLineMovePrev<CR>")

-- Telescope
nnoremap("<leader>se", ":Telescope find_files<CR>")
nnoremap("<leader>lg", ":Telescope live_grep<CR>")
nnoremap("<leader>sr", ":Telescope oldfiles<CR>")
nnoremap("<leader>R", ":Telescope lsp_references<CR>")
nnoremap("<leader>P", ":Telescope projects<CR>")
nnoremap("<leader>D", ":Telescope diagnostics<CR>")
nnoremap("<leader>sd", ":Telescope lsp_document_symbols<CR>")
nnoremap("<leader>e", ":Telescope file_browser path=%:p:h<CR>")
nnoremap("<leader>pv", ":Oil --float<CR>")
nnoremap("<leader>gl", ":lua require('telescope').extensions.git_worktree.git_worktrees()<CR>")

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
nnoremap("<leader>pv", ":Oil --float<CR>")
nnoremap("<leader>D", ":TroubleToggle<CR>")

-- let me be
inoremap("<C-c>", "<ESC>")

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

-- Telescope
nnoremap("<leader>se", ":Telescope find_files<CR>")
nnoremap("<leader>lg", ":Telescope live_grep<CR>")
nnoremap("<leader>sr", ":Telescope oldfiles<CR>")
nnoremap("<leader>R", ":Telescope lsp_references<CR>")
nnoremap("<leader>P", ":Telescope projects<CR>")
nnoremap("<leader>fb", ":Telescope buffers<CR>")
nnoremap("<leader>fs", ":Telescope lsp_document_symbols<CR>")
nnoremap("<leader>gl", ":lua require('telescope').extensions.git_worktree.git_worktrees()<CR>")

nnoremap("<leader>ff", function()
	vim.lsp.buf.format({ async = true })
end)
vnoremap("<leader>ff", function()
	vim.lsp.buf.format({ async = true })
end)

inoremap("<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
nnoremap("<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
nnoremap("<leader>lr", function()
	vim.lsp.buf.rename()
end)
nnoremap("<leader>la", function()
	vim.lsp.buf.code_action()
end)
nnoremap("K", function()
	vim.lsp.buf.hover()
end)
nnoremap("gdd", "<cmd>lua vim.lsp.buf.definition()<CR>")
nnoremap("gds", ":vsplit<CR>:lua vim.lsp.buf.definition()<CR>")
nnoremap("<C-[>", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
nnoremap("<C-]>", "<cmd>lua vim.diagnostic.goto_next()<CR>")

-- git
nnoremap("<leader>hs", ":Gitsigns stage_hunk<CR>")
nnoremap("<leader>hr", ":Gitsigns reset_hunk<CR>")
nnoremap("<leader>hd", ":Gitsigns diffthis<CR>")

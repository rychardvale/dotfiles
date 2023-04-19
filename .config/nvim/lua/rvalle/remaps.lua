vim.g.mapleader = " "

vim.keymap.set("n", "<C-s>", ":w<CR>")
vim.keymap.set("i", "<M-j>", "<ESC>:m .+1<CR>==gi")  -- move line down
vim.keymap.set("i", "<M-k>", "<ESC>:m .-2<CR>==gi")  -- move line up
vim.keymap.set("v", "<M-j>", ":m '>+1<CR>gv=gv")     -- move down but visual
vim.keymap.set("v", "<M-k>", ":m '<-2<CR>gv=gv")     -- move up but visual
vim.keymap.set("n", "<M-j>", ":m .+1<CR>==")         -- move line down
vim.keymap.set("n", "<M-k>", ":m .-2<CR>==")         -- move line up
vim.keymap.set("n", "<leader>hh", ":nohlsearch<CR>") -- removes highlight
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")
vim.keymap.set("n", "<leader>pv", ":Oil --float<CR>")
vim.keymap.set("n", "<leader>D", ":TroubleToggle<CR>")

-- let me be
vim.keymap.set("i", "<C-c>", "<ESC>")

-- debugger
vim.keymap.set("n", "<F5>", ":lua require'dap'.toggle_breakpoint()<CR>")
vim.keymap.set("n", "<F8>", ":lua require'dap'.continue()<CR>")
vim.keymap.set("n", "<F9>", ":lua require'dap'.step_into()<CR>")
vim.keymap.set("n", "<F10>", ":lua require'dap'.step_over()<CR>")
vim.keymap.set("n", "<F11>", ":lua require'dap'.step_out()<CR>")
vim.keymap.set("n", "<leader>db", ":lua require'dapui'.toggle()<CR>")

-- buffer stuff
vim.keymap.set("n", "<leader>c", function() -- closes current buffer
	local bufnr = vim.api.nvim_get_current_buf()
	if bufnr == 0 then
		return
	end
	vim.cmd(string.format("%s %d", "bdelete!", bufnr))
end) -- closes buffer

-- Telescope
vim.keymap.set("n", "<leader>se", ":Telescope find_files<CR>")
vim.keymap.set("n", "<leader>lg", ":Telescope live_grep<CR>")
vim.keymap.set("n", "<leader>sr", ":Telescope oldfiles<CR>")
vim.keymap.set("n", "<leader>gl", ":lua require('telescope').extensions.git_worktree.git_worktrees()<CR>")

-- git
vim.keymap.set("n", "<leader>hs", ":Gitsigns stage_hunk<CR>")
vim.keymap.set("n", "<leader>hr", ":Gitsigns reset_hunk<CR>")
vim.keymap.set("n", "<leader>hd", ":Gitsigns diffthis<CR>")

-- harpoon
vim.keymap.set("n", "<leader>a", function()
	require('harpoon.mark').add_file()
end)
vim.keymap.set("n", "<C-e>", function()
	require('harpoon.ui').toggle_quick_menu()
end)
vim.keymap.set("n", "<C-g>", function()
	require('harpoon.ui').nav_file(1)
end)
vim.keymap.set("n", "<C-h>", function()
	require('harpoon.ui').nav_file(2)
end)
vim.keymap.set("n", "<C-j>", function()
	require('harpoon.ui').nav_file(3)
end)
vim.keymap.set("n", "<C-l>", function()
	require('harpoon.ui').nav_file(4)
end)

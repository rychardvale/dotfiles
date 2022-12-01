local Remap = require("rvalle.keymap")
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local inoremap = Remap.inoremap

vim.g.mapleader = " "

-- Utils
nnoremap("<C-s>", ":w<CR>")
nnoremap("<M-j>", ":m .+1<CR>==") -- move line down
inoremap("<M-j>", "<ESC>:m .+1<CR>==gi") -- move line down
inoremap("<M-k>", "<ESC>:m .-2<CR>==gi") -- move line up
vnoremap("<M-j>", ":m '>+1<CR>gv=gv")
vnoremap("<M-k>", ":m '<-2<CR>gv=gv")
nnoremap("<M-k>", ":m .-2<CR>==") -- move line up
nnoremap("<leader>h", ":nohlsearch<CR>") -- removes highlight
nnoremap("<C-u>", "<C-u>zz")
nnoremap("<C-d>", "<C-d>zz")
nnoremap("n", "nzz")
nnoremap("N", "Nzz")

nnoremap("<leader>pv", ":Ex<CR>")

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
nnoremap("<leader>f", function()
    vim.lsp.buf.format({ async = true })
end)
nnoremap("<leader>bl", ":BufferLineMoveNext<CR>")
nnoremap("<leader>bh", ":BufferLineMovePrev<CR>")

-- Telescope
nnoremap("<leader>se", ":Telescope find_files<CR>")
nnoremap("<leader>lg", ":Telescope live_grep<CR>")
nnoremap("<leader>sr", ":Telescope oldfiles<CR>")
nnoremap("<leader>P", ":Telescope projects<CR>")
nnoremap("<leader>D", ":Telescope diagnostics<CR>")
nnoremap("<leader>e", ":Telescope file_browser<CR>")

-- Harpoon
nnoremap("<leader>a", "<cmd>lua require('harpoon.mark').add_file()<CR>")
nnoremap("<C-e>", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>")
nnoremap("<C-1>", "<cmd>lua require('harpoon.ui').nav_file(1)<CR>")
nnoremap("<C-2>", "<cmd>lua require('harpoon.ui').nav_file(2)<CR>")
nnoremap("<C-3>", "<cmd>lua require('harpoon.ui').nav_file(3)<CR>")
nnoremap("<C-4>", "<cmd>lua require('harpoon.ui').nav_file(4)<CR>")

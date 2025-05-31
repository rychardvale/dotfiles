vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })

--[[ vim.keymap.set('n', '<C-s>', ':w<CR>') ]]
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
vim.keymap.set("n", "<leader>D", ":TroubleToggle<CR>")
vim.keymap.set("t", "<C-space>", "<C-\\><C-n>")

vim.keymap.set("n", "<leader>nt", "<cmd>Neotree<CR>")
vim.keymap.set("n", "<space>fb", ":Telescope file_browser path=%:p:h select_buffer=true<CR>")

-- let me be
vim.keymap.set("i", "<C-c>", "<ESC>")

-- buffer stuff
vim.keymap.set("n", "<leader>cc", function() -- closes current buffer
  local bufnr = vim.api.nvim_get_current_buf()
  if bufnr == 0 then
    return
  end
  vim.cmd(string.format("%s %d", "bdelete!", bufnr))
end) -- closes buffer
vim.keymap.set("n", "]b", function()
  vim.cmd("bnext")
end)
vim.keymap.set("n", "[b", function()
  vim.cmd("bprev")
end)

--
-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = "*",
})

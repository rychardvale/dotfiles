local opt = vim.opt
local g = vim.g

-- opt.nu = true
opt.number = true
opt.relativenumber = true

opt.expandtab = false
opt.tabstop = 4
opt.shiftwidth = 4
opt.smartindent = true
opt.ignorecase = true
opt.smarttab = true
opt.clipboard = "unnamedplus"
opt.guifont = { "JetBrainsMono Nerd Font:h11" }
opt.signcolumn = "yes"
opt.splitbelow = true
opt.splitright = true

opt.laststatus = 2
opt.showtabline = 2

opt.foldenable=false
opt.foldmethod="expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldlevel = 99

opt.cursorline = true

opt.termguicolors = true
opt.background = "dark"
opt.showmode = false
opt.showcmd = false
opt.scrolloff = 4
opt.sidescrolloff = 4
opt.swapfile = false

g.mkdp_preview_options = {
	disable_sync_scroll = 1,
}

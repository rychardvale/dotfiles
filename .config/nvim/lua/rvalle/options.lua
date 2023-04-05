local o = vim.opt
local g = vim.g

vim.g.clipboard = {
	name = "xsel",
	copy = {
		["+"] = "xsel --nodetach -i -b",
		["*"] = "xsel --nodetach -i -p",
	},
	paste = {
		["+"] = "xsel -o -b",
		["*"] = "xsel -o -b",
	},
	cache_enabled = 1,
}
o.clipboard = "unnamedplus"
o.expandtab = false
o.tabstop = 4
o.shiftwidth = 4
o.smartindent = true
o.smarttab = true
o.ignorecase = true
o.signcolumn = "yes"
o.splitbelow = true
o.splitright = true
o.laststatus = 2
o.showtabline = 2
o.writebackup = false
o.guifont = { "JetBrainsMono Nerd Font:h10" }
o.updatetime = 250
o.cursorline = true
o.termguicolors = true
o.background = "dark"
o.showmode = false
o.showcmd = false
o.scrolloff = 10
o.sidescrolloff = 10
o.wrap = false
o.swapfile = false
o.undofile = true
o.completeopt = "menuone,noselect"

o.list = true
o.listchars = {
	tab = "→ ",
	trail = "⋅",
	extends = "❯",
	precedes = "❮",
}

o.relativenumber = true
o.number = true

o.tabline = "%F"
g.gruvbox_material_background = "hard"
g.gruvbox_material_foreground = "original"

local o = vim.opt

o.expandtab = false
o.tabstop = 4
o.shiftwidth = 4
o.smartindent = true
o.smarttab = true
o.ignorecase = true
o.clipboard = "unnamedplus"
o.signcolumn = "yes"
o.splitbelow = true
o.splitright = true
o.laststatus = 2
o.showtabline = 2
o.writebackup = false
o.guifont = { "JetBrainsMono Nerd Font:h10" }
o.updatetime = 250
o.cursorline = false
o.termguicolors = true
o.background = "dark"
o.showmode = false
o.showcmd = false
o.scrolloff = 10
o.sidescrolloff = 10
o.wrap = false
o.swapfile = false
o.undofile = true

o.list = true
o.listchars = {
    tab = "→ ",
    eol = "¬",
    trail = "⋅",
    extends = "❯",
    precedes = "❮",
}

o.showbreak = "↪"
o.relativenumber = true
o.number = true

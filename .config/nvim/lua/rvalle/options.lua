local g = vim.g
local opt = vim.opt

opt.nu = true
opt.number = true
opt.relativenumber = true

opt.expandtab = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.smartindent = false
opt.ignorecase = true
opt.smarttab = false
opt.clipboard = "unnamedplus"
opt.guifont = { "JetBrainsMono Nerd Font:h11" }

opt.laststatus = 2
opt.showtabline = 2

opt.cursorline = true

opt.termguicolors = true
opt.background = "dark"
opt.showmode = false
opt.showcmd = false
opt.scrolloff = 6
opt.updatetime = 200

--[[ g.loaded_netrw = 1
g.loaded_netrwPlugin = 1 ]]

--[[ g.neovide_cursor_antialiasing = true
g.neovide_transparency = 0.95
g.neovide_no_idle = true
g.neovide_cursor_animation_length = 0.13
g.neovide_cursor_vfx_particle_density = 10.0
g.neovide_hide_mouse_when_typing = true
g.neovide_confirm_quit = true ]]

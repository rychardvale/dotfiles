require("rvalle.themes.catpuccin")
require("rvalle.themes.tokyo")

local default_scheme = "tokyonight-night"
local status, _ = pcall(vim.cmd, "colorscheme " .. default_scheme)
if not status then
    return
end

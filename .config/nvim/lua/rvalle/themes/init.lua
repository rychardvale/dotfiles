-- require("rvalle.themes.catpuccin")
-- require("rvalle.themes.tokyo")
-- require("rvalle.themes.onedark")

local default_scheme = "gruvbox-material"
local status, _ = pcall(vim.cmd, "colorscheme " .. default_scheme)
if not status then
    return
end

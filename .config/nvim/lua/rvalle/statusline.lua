local ok, lualine = pcall(require, "lualine")
if not ok then
    return
end

local colors = require("tokyonight.colors").setup()

local custom_theme = {
    normal = {
        a = { fg = colors.blue1, bg = colors.black },
        b = { fg = colors.green, bg = colors.black },
        c = { fg = colors.fg, bg = colors.black },
    },

    insert = { a = { fg = colors.yellow, bg = colors.black } },
    visual = { a = { fg = colors.magenta, bg = colors.black } },
    replace = { a = { fg = colors.magenta, bg = colors.black } },

    inactive = {
        a = { fg = colors.fg, bg = colors.black },
        b = { fg = colors.fg, bg = colors.black },
        c = { fg = colors.fg, bg = colors.black },
    },
}

local navic = require("nvim-navic")
vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
vim.o.statusline = "%{%v:lua.require'nvim-navic'.get_location()%}"

lualine.setup({
    options = {
        theme = custom_theme,
        component_separators = "|",
        section_separators = { left = "", right = "" },
    },
    winbar = {
        lualine_c = {
            {
                navic.get_location,
                cond = navic.is_available,
                padding = 2,
            },
        },
    },
})

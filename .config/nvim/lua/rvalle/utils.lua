local M = {}
M.change_colorscheme = function(color)
    if color == "light" then
        vim.g.ayucolor = "light"
        vim.cmd([[colorscheme ayu]])
        return
    end

    vim.cmd([[colorscheme tokyonight-night]])
end

return M

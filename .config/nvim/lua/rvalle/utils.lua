local M = {}
M.change_colorscheme = function(color)
    if color == "light" then
        vim.o.background = "light"
        vim.cmd([[colorscheme one-nvim]])
        return
    end

    vim.cmd([[colorscheme tokyonight-night]])
end

return M

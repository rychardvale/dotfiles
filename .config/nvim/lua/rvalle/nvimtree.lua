local ok, nvimtree = pcall(require, "nvim-tree")
if not ok then
    return print("nvim-tree not installed")
end

nvimtree.setup({
    sync_root_with_cwd = true,
    update_focused_file = {
        enable = false,
        update_root = false,
        ignore_list = {},
    },
})

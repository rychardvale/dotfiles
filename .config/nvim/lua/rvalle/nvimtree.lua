local ok, nvimtree = pcall(require, "nvim-tree")
if not ok then
	vim.notify("nvim-tree not installed")
	return
end

nvimtree.setup({
	sync_root_with_cwd = true,
	update_focused_file = {
		enable = false,
		update_root = false,
		ignore_list = {},
	},
})

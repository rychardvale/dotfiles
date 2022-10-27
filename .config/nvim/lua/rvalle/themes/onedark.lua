local ok, onedark = pcall(require, "onedark")
if ok then
	onedark.setup({
		style = "deep",
	})
	onedark.load()
end

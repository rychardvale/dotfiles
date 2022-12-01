local ok, telescope = pcall(require, "telescope")
if not ok then
	return
end

telescope.setup({
	extensions = {
		file_browser = {
			hijack_netrw = true,
		},
	},
})

telescope.load_extension("projects")
telescope.load_extension("file_browser")
--telescope.load_extension("fzf")

local ok, telescope = pcall(require, "telescope")
if not ok then
	return
end

require("git-worktree").setup()
telescope.setup({
	defaults = {
		file_ignore_patterns = { "node_modules" },
	},
	extensions = {
		file_browser = {
			hijack_netrw = true,
		},
	},
	pickers = {
		find_files = {
			hidden = true,
		},
	},
})

-- telescope.load_extension("projects")
pcall(telescope.load_extension, "fzf")
pcall(telescope.load_extension, "file_browser")
pcall(telescope.load_extension, "git_worktree")

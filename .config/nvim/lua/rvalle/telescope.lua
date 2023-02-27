local ok, telescope = pcall(require, "telescope")
if not ok then
	return
end

require("git-worktree").setup()
telescope.setup({
	defaults = {
		file_ignore_patterns = { "node_modules" },
	},
	pickers = {
		find_files = {
			hidden = true,
		},
	},
})

pcall(telescope.load_extension, "fzf")
pcall(telescope.load_extension, "git_worktree")

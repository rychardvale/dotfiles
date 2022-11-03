local ok, telescope = pcall(require, "telescope")
if not ok then
	return
end

telescope.load_extension("projects")
-- telescope.load_extension("fzf")

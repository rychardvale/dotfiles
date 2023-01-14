local ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not ok then
	vim.notify("Treesitter configs not found")
	return
end

treesitter.setup({
	ensure_installed = "all",
	highlight = {
		enable = true,
		matchup = { enable = true },
		context_commentstring = {
			enable = true,
			enable_autocmd = false,
		},
	},
})

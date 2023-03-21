local ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not ok then
	vim.notify("Treesitter configs not found")
	return
end

treesitter.setup({
	ensure_installed = "all",
	ignore_install = { "smali" },
	highlight = {
		enable = true,
		matchup = { enable = true },
		disable = { 'css', 'sql' },
		context_commentstring = {
			enable = true,
			enable_autocmd = false,
		},
	},
})

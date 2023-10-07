require("rvalle.plugins")
require("rvalle.options")
require("rvalle.remaps")

if vim.g.vscode then
	require("rvalle.vscode")
else
	require("rvalle.treesitter")
	require("rvalle.plugins")
	require("rvalle.options")
	require("rvalle.themes")
	require("rvalle.telescope")
	require("rvalle.null-ls")
	require("rvalle.lsp")
	require("rvalle.comment")
	require("rvalle.colorizer")
	require("rvalle.oil")
end

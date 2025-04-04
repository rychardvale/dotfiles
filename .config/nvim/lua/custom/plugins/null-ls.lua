return {
	"nvimtools/none-ls.nvim",
	config = function()
		local none_ls = require("null-ls")
		local formatting = none_ls.builtins.formatting

		none_ls.setup({
			sources = {
				formatting.stylua,
				formatting.prettier.with({
					filetypes = {
						"html",
						"json",
						"yaml",
						"yml",
						"markdown",
						"css",
						"typescript",
						"typescriptreact",
						"javascript",
						"javascriptreact",
					},
				}),
				formatting.yamlfmt,
				formatting.sqlfmt,
				formatting.gofumpt,
				formatting.goimports_reviser,
				formatting.black.with({
					filetypes = {
						"python",
					},
				}),
			},
		})
	end,
}

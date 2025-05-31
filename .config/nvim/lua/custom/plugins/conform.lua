return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			go = { "gofumpt", "goimports-reviser" },
			templ = { "templ" },
			python = { "black" },
			sql = { "sqlfmt" },
		},
	},
}

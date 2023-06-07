local ok, null_ls = pcall(require, "null-ls")
if not ok then
	return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	sources = {
		require("typescript.extensions.null-ls.code-actions"),
		formatting.stylua,
		formatting.clang_format.with({
			filetypes = { "c", "cpp" },
		}),
		formatting.prettier.with({
			only_local = "node_modules/.bin",
			filetypes = {
				"html",
				"json",
				"yaml",
				"markdown",
				"css",
				"typescript",
				"typescriptreact",
				"javascript",
				"javascriptreact",
			},
		}),
		formatting.rustfmt,
		formatting.yamlfmt,
		formatting.black,
		formatting.sqlfmt,
		diagnostics.eslint,
	},
})

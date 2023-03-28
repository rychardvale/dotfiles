local okmason, masonlsp = pcall(require, "mason-lspconfig")
if not okmason then
	return vim.notify("Mason LSPconfig not found")
end

masonlsp.setup({
	ensure_installed = {
		"lua_ls",
		"pyright",
		"bashls",
		"tsserver",
		"rust_analyzer",
		"gopls",
		"prismals",
	},
})

local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local function config(_config)
	return vim.tbl_deep_extend("force", {
		capabilities = capabilities,
	}, _config or {})
end

lspconfig.pyright.setup(config())
lspconfig.html.setup(config())
lspconfig.bashls.setup(config())
lspconfig.lua_ls.setup(config({
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
}))
lspconfig.tsserver.setup(config())
lspconfig.rust_analyzer.setup(config({
	settings = {
		rust = {
			unstable_features = true,
			build_on_save = false,
			all_features = true,
		},
	},
}))
lspconfig.gopls.setup(config())
lspconfig.prismals.setup(config())

local signs = { Error = "E ", Warn = "W ", Info = "I " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	underline = true,
	update_in_insert = false,
	severity_sort = true,
	float = { source = "always" },
})

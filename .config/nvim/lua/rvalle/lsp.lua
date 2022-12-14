local okmason, masonlsp = pcall(require, "mason-lspconfig")
if not okmason then
	return
end

masonlsp.setup()

local nnoremap = require("rvalle.keymap").nnoremap
local inoremap = require("rvalle.keymap").inoremap
local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()


local function config(_config)
	return vim.tbl_deep_extend("force", {
		capabilities = capabilities,
		on_attach = function()
			nnoremap("gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
			nnoremap("gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
			inoremap("<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
			nnoremap("<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
		end,
	}, _config or {})
end

lspconfig.pyright.setup(config())
lspconfig.sumneko_lua.setup(config({
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("lua", true),
			},
			telemetry = {
				enable = false,
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
lspconfig.clangd.setup(config())
lspconfig.marksman.setup(config())

-- Diagnostics signs in the gutter
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	underline = true,
	update_in_insert = true,
	severity_sort = true,
	float = { source = "always" },
})

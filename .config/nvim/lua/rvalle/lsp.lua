local ok_navic, navic = pcall(require, "nvim-navic")
if ok_navic then
	navic.setup({
		icons = {
			File = " ",
			Module = " ",
			Namespace = " ",
			Package = " ",
			Class = " ",
			Method = " ",
			Property = " ",
			Field = " ",
			Constructor = " ",
			Enum = "練",
			Interface = "練",
			Function = " ",
			Variable = " ",
			Constant = " ",
			String = " ",
			Number = " ",
			Boolean = "◩ ",
			Array = " ",
			Object = " ",
			Key = " ",
			Null = "ﳠ ",
			EnumMember = " ",
			Struct = " ",
			Event = " ",
			Operator = " ",
			TypeParameter = " ",
		},
		highlight = true,
		separator = " > ",
		depth_limit = 0,
		depth_limit_indicator = "..",
		safe_output = true,
	})
end

local okmason, masonlsp = pcall(require, "mason-lspconfig")
if okmason then
	masonlsp.setup()
end

local nnoremap = require("rvalle.keymap").nnoremap
local inoremap = require("rvalle.keymap").inoremap
local lspconfig = require("lspconfig")

vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	underline = true,
	update_in_insert = true,
	severity_sort = true,
	float = { source = "always" },
})

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

require("lsp-inlayhints").setup({
	inlay_hints = {
		parameter_hints = {
			show = false,
			-- prefix = "<- ",
			separator = ", ",
		},
		type_hints = {
			-- type and other hints
			show = true,
			prefix = "",
			separator = ", ",
			remove_colon_end = false,
			remove_colon_start = false,
		},
		-- separator between types and parameter hints. Note that type hints are
		-- shown before parameter
		labels_separator = "  ",
		-- whether to align to the length of the longest line in the file
		max_len_align = false,
		-- padding from the left if max_len_align is true
		max_len_align_padding = 1,
		-- whether to align to the extreme right or not
		right_align = false,
		-- padding from the right if right_align is true
		right_align_padding = 7,
		-- highlight group
		highlight = "Comment",
	},
	debug_mode = false,
})

local function config(_config)
	return vim.tbl_deep_extend("force", {
		capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
		on_attach = function(client, bufnr)
			if client.server_capabilities.documentSymbolProvider then
				navic.attach(client, bufnr)
			end
			require("lsp-inlayhints").on_attach(client, bufnr)
			nnoremap("gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
			nnoremap("gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
			inoremap("<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
		end,
		flags = {
			debounce_text_changes = 10,
		},
	}, _config or {})
end

lspconfig.pyright.setup(config())
lspconfig.sumneko_lua.setup(config({
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
}))
lspconfig.tsserver.setup({
	settings = {
		typescript = {
			inlayHints = {
				includeInlayParameterNameHints = "all",
				includeInlayParameterNameHintsWhenArgumentMatchesName = false,
				includeInlayFunctionParameterTypeHints = true,
				includeInlayVariableTypeHints = true,
				includeInlayPropertyDeclarationTypeHints = true,
				includeInlayFunctionLikeReturnTypeHints = true,
				includeInlayEnumMemberValueHints = true,
			},
		},
		javascript = {
			inlayHints = {
				includeInlayParameterNameHints = "all",
				includeInlayParameterNameHintsWhenArgumentMatchesName = false,
				includeInlayFunctionParameterTypeHints = true,
				includeInlayVariableTypeHints = true,
				includeInlayPropertyDeclarationTypeHints = true,
				includeInlayFunctionLikeReturnTypeHints = true,
				includeInlayEnumMemberValueHints = true,
			},
		},
	},
})
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

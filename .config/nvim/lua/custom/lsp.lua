local navic = require("nvim-navic")
local on_attach = function(client, bufnr)
	-- NOTE: Remember that lua is a real programming language, and as such it is possible
	-- to define small helper and utility functions so you don't have to repeat yourself
	-- many times.
	--
	-- In this case, we create a function that lets us more easily define mappings specific
	-- for LSP related items. It sets the mode, buffer and description for us each time.
	local nmap = function(keys, func, desc)
		if desc then
			desc = "LSP: " .. desc
		end
		vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
	end
	local imap = function(keys, func, desc)
		if desc then
			desc = "LSP: " .. desc
		end

		vim.keymap.set("i", keys, func, { buffer = bufnr, desc = desc })
	end

	if client.server_capabilities.documentSymbolProvider then
		navic.attach(client, bufnr)
	end
	nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
	imap("<C-K>", vim.lsp.buf.signature_help, "Signature Help")
	nmap("<leader>ca", function()
		vim.lsp.buf.code_action({ context = { only = { "quickfix", "refactor", "source" } } })
	end, "[C]ode [A]ction")

	-- See `:help K` for why this keymap
	nmap("K", vim.lsp.buf.hover, "Hover Documentation")
	nmap("<C-K>", vim.lsp.buf.signature_help, "Signature Documentation")

	-- Create a command `:Format` local to the LSP buffer
	nmap("<leader>ff", function()
		require("conform").format({ bufnr = bufnr })
	end, "Format buffer")
end

-- mason-lspconfig requires that these setup functions are called in this order
-- before setting up the servers.
require("mason").setup()
require("mason-lspconfig").setup()

-- Enable the following language servers
--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
--
--  Add any additional override configuration in the following tables. They will be passed to
--  the `settings` field of the server config. You must look up that documentation yourself.
--
--  If you want to override the default filetypes that your language server will attach to you can
--  define the property 'filetypes' to the map in question.
local servers = {
	gopls = {
		analyses = {
			unusedparams = true,
			shadow = true,
			unusedwrite = true,
			unusedvariable = true,
		},
		staticcheck = true,
	},
	html = { filetypes = { "html", "twig", "hbs", "templ" } },
	tailwindcss = { filetypes = { "html", "templ" } },
	htmx = { filetypes = { "html", "templ" } },
	svelte = { filetypes = { "svelte" } },

	lua_ls = {
		Lua = {
			workspace = { checkThirdParty = false },
			telemetry = { enable = false },
			-- NOTE: toggle below to ignore Lua_LS's noisy `missing-fields` warnings
			-- diagnostics = { disable = { 'missing-fields' } },
		},
	},
}

local cmds = {
	gopls = { "gopls" },
}

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers

-- Ensure the servers above are installed

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

local mason_lspconfig = require("mason-lspconfig")
mason_lspconfig.setup({ ensure_installed = vim.tbl_keys(servers) })

mason_lspconfig.setup_handlers({
	function(server_name)
		require("lspconfig")[server_name].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = servers[server_name],
			filetypes = (servers[server_name] or {}).filetypes,
			cmd = cmds[server_name],
		})
	end,
})

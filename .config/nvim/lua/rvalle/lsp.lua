local lsp = require("lsp-zero")

lsp.preset("recommended")
lsp.ensure_installed({
	"tsserver",
	"rust_analyzer",
	"lua_ls",
})

lsp.configure("lua-language-server", {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
	["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
	["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
	["<C-y>"] = cmp.mapping.confirm({ select = true }),
	["<C-Space>"] = cmp.mapping.complete(),
})
cmp_mappings["<Tab>"] = nil
cmp_mappings["<S-Tab>"] = nil

lsp.setup_nvim_cmp({
	mapping = cmp_mappings,
})

lsp.set_preferences({
	suggest_lsp_servers = false,
	sign_icons = {
		error = "E",
		warn = "W",
		hint = "H",
		info = "I",
	},
})
lsp.nvim_workspace()

local nl = require("null-ls")
lsp.on_attach(function(client, bufnr)
	local opts = { buffer = bufnr, remap = false }
	vim.keymap.set("n", "gdd", function()
		vim.lsp.buf.definition()
	end, opts)
	vim.keymap.set("n", "gds", ":vsplit<CR>:lua vim.lsp.buf.definition()<CR>", opts)
	vim.keymap.set("n", "K", function()
		vim.lsp.buf.hover()
	end, opts)
	vim.keymap.set("i", "<C-k>", function()
		vim.lsp.buf.signature_help()
	end, opts)

	vim.keymap.set("n", "<leader>ff", function()
		vim.lsp.buf.format({
			async = true,
			filter = function(clt)
				local query = {
					filetype = vim.bo[bufnr].filetype,
					method = nl.methods.FORMATTING,
				}
				local has_formatter = nl.is_registered(query)
				if has_formatter then
					return clt.name == "null-ls"
				end
				return true
			end,
		})
	end, opts)
	vim.keymap.set("v", "<leader>ff", function()
		vim.lsp.buf.format({
			async = true,
			filter = function(clt)
				local query = {
					filetype = vim.bo[bufnr].filetype,
					method = nl.methods.FORMATTING,
				}
				local has_formatter = nl.is_registered(query)
				if has_formatter then
					return clt.name == "null-ls"
				end
				return true
			end,
		})
	end, opts)
	vim.keymap.set("n", "<leader>ls", ":Telescope lsp_workspace_symbols<CR>", opts)
	vim.keymap.set("n", "<leader>vd", function()
		vim.diagnostic.open_float()
	end, opts)
	vim.keymap.set("n", "<C-]>", function()
		vim.diagnostic.goto_next()
	end, opts)
	vim.keymap.set("n", "<C-[>", function()
		vim.diagnostic.goto_prev()
	end, opts)
	vim.keymap.set("n", "<leader>la", function()
		vim.lsp.buf.code_action()
	end, opts)
	vim.keymap.set("n", "<leader>R", ":Telescope lsp_references<CR>", opts)
	vim.keymap.set("n", "<leader>lr", function()
		vim.lsp.buf.rename()
	end, opts)
end)

lsp.setup()

vim.diagnostic.config({
	virtual_text = true,
})

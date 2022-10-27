local nnoremap = require("rvalle.keymap").nnoremap
local ok, lspconfig = pcall(require, "lspconfig")
if not ok then
    return
end

local okmason, masonlsp = pcall(require, "mason-lspconfig")
if not okmason then
    return
end

masonlsp.setup()

vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
})

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

local function config(_config)
    return vim.tbl_deep_extend("force", {
        capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
        on_attach = function(client, bufnr)
            nnoremap("<leader>lk", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
            nnoremap("<leader>lj", "<cmd>lua vim.diagnostic.goto_next()<CR>")
            nnoremap("gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
            nnoremap("gr", "<cmd>lua vim.lsp.buf.references()<CR>")
            nnoremap("gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
            nnoremap("<C-h>", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
            nnoremap("<leader>lr", "<cmd>lua vim.lsp.buf.rename()<CR>")
            nnoremap("<leader>la", "<cmd>lua vim.lsp.buf.code_action()<CR>")
            nnoremap("K", function()
                vim.lsp.buf.hover()
            end)

            --[[
            local group_exists, _ = pcall(vim.api.nvim_get_autocmds, { group = "lsp_highlight" })
            if not group_exists then
                vim.api.nvim_create_augroup("lsp_highlight", {})
            end
            if client.supports_method("textDocument/documentHighlight") then
                vim.api.nvim_clear_autocmds({ group = "lsp_highlight", buffer = bufnr })
                vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
                    callback = vim.lsp.buf.document_highlight,
                    group = "lsp_highlight",
                    buffer = bufnr,
                    desc = "Highlight on variable hover",
                })
                vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
                    callback = vim.lsp.buf.clear_references,
                    group = "lsp_highlight",
                    buffer = bufnr,
                    desc = "Remove highlight from variable on move",
                })
            end]]
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
        },
    },
}))
lspconfig.tsserver.setup(config())
lspconfig.rust_analyzer.setup(config())
lspconfig.gopls.setup(config())
lspconfig.prismals.setup(config())

local caps = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
caps.offsetEncoding = { "utf-16" }
lspconfig.clangd.setup(config({
    capabilities = caps,
}))

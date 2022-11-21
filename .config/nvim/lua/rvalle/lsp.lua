local nnoremap = require("rvalle.keymap").nnoremap

local okmason, masonlsp = pcall(require, "mason-lspconfig")
if not okmason then
    return
end

masonlsp.setup()

local ok, lspconfig = pcall(require, "lspconfig")
if not ok then
    return
end

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
        on_attach = function()
            nnoremap("<leader>lk", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
            nnoremap("<leader>lj", "<cmd>lua vim.diagnostic.goto_next()<CR>")
            nnoremap("gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
            nnoremap("gr", "<cmd>lua vim.lsp.buf.references()<CR>")
            nnoremap("gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
            nnoremap("gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
            nnoremap("<C-h>", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
            nnoremap("<leader>lr", "<cmd>lua vim.lsp.buf.rename()<CR>")
            nnoremap("<leader>la", "<cmd>lua vim.lsp.buf.code_action()<CR>")
            nnoremap("K", function()
                vim.lsp.buf.hover()
            end)
        end,
        flags = { debounce_text_changes = 150 },
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
lspconfig.clangd.setup(config())

local ok, null_ls = pcall(require, "null-ls")
if not ok then
    return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
    debug = true,
    sources = {
        formatting.stylua,
        formatting.clang_format.with({
            filetypes = { "c", "cpp" },
        }),
        formatting.prismaFmt,
        formatting.prettier,
        diagnostics.eslint,
    },
})

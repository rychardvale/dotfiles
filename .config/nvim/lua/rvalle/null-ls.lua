local ok, null_ls = pcall(require, "null-ls")
if not ok then
    return
end

local formatting = null_ls.builtins.formatting

null_ls.setup({
    debug = true,
    sources = {
        formatting.stylua,
        formatting.uncrustify.with({
            filetypes = { "c", "cpp" },
        }),
        formatting.prismaFmt,
        formatting.prettier,
    },
})

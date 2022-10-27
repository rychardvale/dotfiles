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
        formatting.prettier.with({
            extra_args = {
                "--print-width=80",
                "--trailling-comma=es5",
                "--single-quote=false",
                "--tab-width=4",
                "--use-tabs=true",
            },
        }),
    },
})

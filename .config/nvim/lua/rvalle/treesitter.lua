local ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not ok then
    vim.notify("Treesitter configs not found")
    return
end

treesitter.setup({
    ensure_installed = "all",
    highlight = {
		enable = true,
        --[[ matchup = { enable = true,
        },
        context_commentstring = {
            enable = true,
            enable_autocmd = false,
            config = {
                -- Languages that have a single comment style
                typescript = "// %s",
                css = "/* %s */",
                scss = "/* %s */",
                html = "<!-- %s -->",
                svelte = "<!-- %s -->",
                vue = "<!-- %s -->",
                json = "",
            },
        }, ]]
    },
})

return {
    "andythigpen/nvim-coverage",
    dependencies = "nvim-lua/plenary.nvim",
    opts = {
        lang = {
            go = {
                coverage_file = "/tmp/coverage.out",
            },
        },
    },
}

return {
    "ThePrimeagen/git-worktree.nvim",
    opts = {},
    config = function()
        vim.api.nvim_create_user_command("Gwt", function(opts)
            if #opts.fargs == 0 then
                require("telescope").extensions.git_worktree.git_worktrees()
            end
        end, { nargs = "?" })
    end,
}

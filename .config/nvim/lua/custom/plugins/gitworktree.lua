return {
    "ThePrimeagen/git-worktree.nvim",
    opts = {},
    config = function()
        vim.api.nvim_create_user_command("Gwt", function(opts)
            if #opts.fargs == 0 then
                require("telescope").extensions.git_worktree.git_worktrees()
            end
        end, { nargs = "?" })

        -- Command to create a new git worktree in /branches folder
        vim.api.nvim_create_user_command("GwtCreate", function(opts)
            if #opts.fargs == 0 then
                vim.ui.input({ prompt = "Enter branch name: " }, function(branch_name)
                    if branch_name and branch_name ~= "" then
                        local path = "./branches/" .. branch_name
                        require("git-worktree").create_worktree(path, branch_name, "origin")
                    else
                        vim.notify("Branch name is required", vim.log.levels.ERROR)
                    end
                end)
            else
                local branch_name = opts.fargs[1]
                local path = "./branches/" .. branch_name
                require("git-worktree").create_worktree(path, branch_name, "origin")
            end
        end, { 
            nargs = "?",
            desc = "Create a new git worktree in /branches folder"
        })
    end,
}

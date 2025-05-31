return {
	"mfussenegger/nvim-lint",
	config = function()
		require("lint").linters_by_ft = {
			go = { "golangcilint" },
		}
		local goci = require("lint").linters.golangcilint

		require("lint").linters.golangcilint = {
			cmd = goci.cmd,
			stdin = goci.stdin,
			append_fname = goci.append_fname,
			stream = goci.stream,
			ignore_exitcode = goci.ignore_exitcode,
			env = goci.env,
			parser = goci.parser,
			args = {
				"--output.json.path=stdout",
				"--show-stats=false",
				"--issues-exit-code",
				"0",
			},
		}

		vim.api.nvim_create_autocmd({ "BufWritePost" }, {
			callback = function()
				-- try_lint without arguments runs the linters defined in `linters_by_ft`
				-- for the current filetype
				require("lint").try_lint()
			end,
		})
		vim.api.nvim_create_autocmd({ "CursorHold" }, {
			callback = function()
				-- try_lint without arguments runs the linters defined in `linters_by_ft`
				-- for the current filetype
				require("lint").try_lint()
			end,
		})
	end,
}

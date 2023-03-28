local ok_treesitter, treesitter = pcall(require, "nvim-treesitter.configs")
if not ok_treesitter then
	vim.notify("Treesitter configs not found")
	return
end

treesitter.setup({
	ensure_installed = "all",
	ignore_install = { "smali" },
	highlight = {
		enable = true,
		matchup = { enable = true },
		disable = function(lang, buf)
			local max_filesize = 100 * 1024 -- 100 KB
			local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
			if ok and stats and stats.size > max_filesize then
				return true
			end
		end,
		context_commentstring = {
			enable = true,
			enable_autocmd = false,
		},
	},
})

local ok, comment = pcall(require, "Comment")
if not ok then
	return
end

comment.setup({
	padding = true,
	---Whether the cursor should stay at its position
	sticky = true,
	---Lines to be ignored while (un)comment
	ignore = nil,
	---LHS of toggle mappings in NORMAL mode
	toggler = {
		-- Line-comment toggle keymap
		line = "<leader>/",
		-- Block-comment toggle keymap
		block = nil,
	},
	---LHS of operator-pending mappings in NORMAL and VISUAL mode
	opleader = {
		---Line-comment keymap
		line = nil,
		---Block-comment keymap
		block = "<leader>/",
	},
	---Enable keybindings
	---NOTE: If given `false` then the plugin won't create any mappings
	mappings = {
		---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
		basic = true,
		---Extra mapping; `gco`, `gcO`, `gcA`
		extra = false,
		---Extended mapping; `g>` `g<` `g>[count]{motion}` `g<[count]{motion}`
		extended = false,
	},
	---Function to call before (un)comment
	pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
	---Function to call after (un)comment
	post_hook = nil,
})

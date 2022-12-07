local ok, bufferline = pcall(require, "bufferline")
if not ok then
    return print("could not find bufferline")
end

local diagnostics_indicator = function(count, level, diagnostics_dict, context)
  local icon = level:match("error") and " " or " "
  return " " .. icon .. count
end

bufferline.setup({
	options = {
		diagnostics = "nvim_lsp",
		diagnostics_indicator = diagnostics_indicator,
		diagnostics_update_in_insert = true,
	},
})

local ok, bufferline = pcall(require, "bufferline")
if not ok then
    return print("could not find bufferline")
end

local function diagnostics_indicator(_, _, diagnostics, _)
	local result = {}
	local symbols = { error = "", warning = "", info = "" }
	for name, count in pairs(diagnostics) do
		if symbols[name] and count > 0 then
			table.insert(result, symbols[name] .. " " .. count)
		end
	end
	result = table.concat(result, " ")
	return #result > 0 and result or ""
end

bufferline.setup({
	options = {
		diagnostics = "nvim_lsp",
		diagnostics_indicator = diagnostics_indicator,
		diagnostics_update_in_insert = false,
	},
})

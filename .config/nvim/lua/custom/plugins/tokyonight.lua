return {
  --[[ "folke/tokyonight.nvim",
  config = function()
    local transparent = false
    require("tokyonight").setup({
      style = "storm",
      transparent = transparent,
      styles = {
        sidebar = true,
        floats = true,
      },
    })
  end, ]]
}

return {
  "catppuccin/nvim",
  config = function()
    require("catppuccin").setup({
      transparent_background = false,
      term_colors = true,
      integrations = {
        cmp = true,
        gitsigns = true,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        diffview = true,
        telescope = {
          enabled = true,
          style = "nvchad",
        },
        dap_ui = true,
        treesitter_context = true,
        mason = true,
        neogit = true,
        dap = true,
        fidget = true,
        neotest = true,
        harpoon = true,
        neotree = true,
        illuminate = true,
        semantic_tokens = true,
        indent_blankline = true,
      },
      custom_highlights = function(color)
        return {
          ["@property.go"] = { fg = color.red },
          ["@constant.builtin.go"] = { fg = color.red },
          ["@variable.parameter.go"] = { fg = color.text },
          ["@module.go"] = { fg = color.peach },
          ["@type.go"] = { fg = color.teal },
          --[[ LineNr = { fg = color.text, bg = color.base },
          SignColumn = { fg = color.text, bg = color.base }, ]]
        }
      end,
    })
  end,
  name = "catppuccin",
  priority = 1000,
}

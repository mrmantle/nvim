return {
  "nvim-lualine/lualine.nvim",
  config = function()
    local bubble = require("themes.lualine_bubble")
    local sep1, sep2 = "", ""
    require("lualine").setup({
      options = {
        component_separators = "|",
        section_separators = { left = sep1, right = sep2 },
        icons_enabled = false,
        theme = bubble,
      },
      sections = {
        lualine_a = { { "mode", separator = { left = sep2 }, right_padding = 2 } },
        lualine_b = {
          { "branch" },
          { "filename" },
          {
            "diff",
            diff_color = {
              added = "LuaLineDiffAdd",
            },
          },
          { "diagnostics", sources = { "nvim_diagnostic", "nvim_lsp" } },
        },
        lualine_c = {},
        lualine_x = {
          { "encoding", separator = { left = sep2 } },
          { "filetype", separator = { left = sep2 } },
          { "fileformat", separator = { left = sep2 } },
        },
        lualine_y = { "progress" },
        lualine_z = { { "location", separator = { right = sep1 }, left_padding = 2 } },
      },
    })
  end,
}

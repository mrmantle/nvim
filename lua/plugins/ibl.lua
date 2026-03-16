return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  config = function()
    local indent_char = "▏"
    require("ibl").setup({
      indent = { char = indent_char },
      scope = {
        show_start = false,
        show_end = false,
      },
    })
  end,
}

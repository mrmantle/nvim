return {
  "saghen/blink.cmp",
  event = "VimEnter",
  version = "1.*",
  dependencies = {
    "rafamadriz/friendly-snippets",
  },
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = {
      preset = "default",
    },
    appearance = {
      nerd_font_variant = "mono",
    },
    completion = {
      documentation = { auto_show = false, auto_show_delay_ms = 500 },
      menu = {
        draw = { columns = { { "label", "label_description", gap = 1 }, { "kind" } } },
      },
    },
    sources = {
      default = { "lsp", "path", "snippets", "cmdline" },
    },
    snippets = { preset = "default" },
    fuzzy = { implementation = "prefer_rust_with_warning" },
    signature = { enabled = true },
  },
}

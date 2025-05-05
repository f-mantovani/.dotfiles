return {
  {
    "saghen/blink.cmp",
    keymap = {
      preset = "default",
      ["<C-y>"] = { "select_and_accept" },
    },
    appearance = {
      nerd_font_variant = "normal",
      completion = {
        menu = {
          border = "rounded",
        },
        ghost_text = {
          enabled = true,
        },
      },
    },
    signature = { enabled = true },
  },
}

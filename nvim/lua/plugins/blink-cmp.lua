return {
  {
    "saghen/blink.cmp",
    dependencies = {
      "Huijiro/blink-cmp-supermaven",
    },
    keymap = {
      preset = "default",
      ["<C-y>"] = { "select_and_accept" },
    },
    opts = {
      sources = {
        default = { "lsp", "path", "supermaven", "snippets", "buffer" },
        providers = {
          supermaven = {
            name = "supermaven",
            module = "blink-cmp-supermaven",
            async = true,
          },
        },
      },
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

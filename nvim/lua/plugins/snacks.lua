return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    picker = { enabled = true, layout = { preset = "ivy" } },
    terminal = { enabled = true, shell = "C:/Users/Felipe/scoop/apps/nu/current/nu.exe" },
  },
}

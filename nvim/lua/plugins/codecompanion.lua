return {
  "olimorris/codecompanion.nvim",
  version = "^19.0.0",
  opts = {
    strategies = {
      chat = {
        adapter = "opencode",
      },
    },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
}

-- -- This is a config to test later
-- require("codecompanion").setup({
--   strategies = {
--     chat = {
--       adapter = "openrouter",
--     },
--     inline = {
--       adapter = "openrouter",
--     },
--   },
--   adapters = {
--     require("codecompanion").extend("openai_compatible", {
--       env = {
--         url = "https://openrouter.ai/api",
--         api_key = "OPENROUTER_API_KEY",
--         chat_url = "/v1/chat/completions",
--       },
--       schema = {
--         model = {
--           default = "openrouter/free",
--         },
--       },
--     }),
--   },
-- }),


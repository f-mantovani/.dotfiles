return {
  {
    "ThePrimeagen/refactoring.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      -- Injeção manual: se alguém pedir 'async', entregamos 'plenary.async'
      -- Isso resolve o erro da linha 45 do refactoring.lua
      package.preload["async"] = function()
        return require("plenary.async")
      end

      require("refactoring").setup({})
    end,
  },
}

return {
  "nvim-java/nvim-java",
  dependencies = {
    {
      "mfussenegger/nvim-dap",
      config = function() end,
    },
  },
  config = function()
    require("java").setup()
    vim.lsp.enable("jdtls")
  end,
}

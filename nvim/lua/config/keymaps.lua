-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<leader>rn", function()
  return ":IncRename " .. vim.fn.expand("<cword>")
end, { expr = true })

vim.keymap.set("i", "jk", "<Esc>", { noremap = false })

vim.keymap.set({ "n", "v" }, "<leader>ck", "<cmd>CodeCompanionChat Toggle<cr>", { noremap = true, silent = true })

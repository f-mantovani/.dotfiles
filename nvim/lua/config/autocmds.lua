-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
--lua

-- Create autocommand group
local md_width = vim.api.nvim_create_augroup("CustomColorColumn", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
  group = md_width,
  -- pode ser usado uma tabela aqui para a seleção de múltiplos arquivos
  -- {"markdown", "text"}
  pattern = "markdown",
  callback = function()
    -- usando o local para aplicar apenas a esse arquivo
    vim.opt_local.colorcolumn = "80"
  end,
})

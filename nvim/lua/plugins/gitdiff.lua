return {
  {
    "akinsho/git-conflict.nvim",
    version = "*", -- Usa a versão mais recente marcada como estável
    config = function()
      require("git-conflict").setup({
        default_mappings = true, -- Usa os atalhos padrões do plugin
        default_commands = true, -- Habilita os comandos do plugin
        disable_diagnostics = true, -- Mantém os diagnósticos ativos em arquivos com conflito
        list_opener = "copen", -- Abre a lista de conflitos usando copen
        highlights = {
          incoming = "DiffAdd", -- Define a cor para as mudanças recebidas
          current = "DiffText", -- Define a cor para as mudanças locais
        },
      })
    end,
  },
}

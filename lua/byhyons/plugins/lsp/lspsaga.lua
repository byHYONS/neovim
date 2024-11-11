return {
  "nvimdev/lspsaga.nvim",
  event = "LspAttach", -- Carica il plugin quando un server LSP si attacca
  dependencies = {
    "nvim-tree/nvim-web-devicons", -- Dipendenza per le icone
    "nvim-treesitter/nvim-treesitter", -- Dipendenza per l'analisi del codice
  },
  config = function()
    require("lspsaga").setup({
      -- Configurazione UI
      ui = {
        border = "rounded", -- Bordo delle finestre di lspsaga
        winblend = 0, -- Trasparenza delle finestre
        expand = "", -- Icona per espandere
        collapse = "", -- Icona per comprimere
        preview = " ", -- Icona per l'anteprima
        code_action = "💡", -- Icona per le azioni di codice
        diagnostic = "🐛", -- Icona per le diagnostiche
        incoming = " ", -- Icona per i cambiamenti in entrata
        outgoing = " ", -- Icona per i cambiamenti in uscita
        hover = " ", -- Icona per il hover
        kind = {}, -- Puoi personalizzare ulteriormente i tipi di simboli
        diagnostic_head = "🐛 ",
        diagnostic_sign = " ",
      },
      -- Abilita il Lightbulb per le azioni rapide
      lightbulb = {
        enable = true,
        sign = true,
        sign_priority = 20,
        virtual_text = false,
      },
      -- Configurazione della Winbar per i simboli
      symbol_in_winbar = {
        enable = true,
        separator = " > ",
        hide_keyword = true,
        show_file = true,
        folder_level = 2,
        respect_root = false,
        color_mode = true,
      },
      -- Abilita la navigazione call hierarchy
      callhierarchy = {
        enable = true,
      },
      -- Abilita le funzionalità di navigazione diagnostica
      diagnostic = {
        show_code_action = true,
      },
      -- Altre opzioni di configurazione possono essere aggiunte qui
    })
  end,
}

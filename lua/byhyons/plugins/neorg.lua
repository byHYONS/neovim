-- Neorg
return {
  "nvim-neorg/neorg",
  lazy = false,
  version = "*", -- Pin all'ultima release stabile
  build = ":Neorg sync-parsers", -- Attiva Tree-sitter
  config = function()
    require("neorg").setup({
      load = {
        ["core.defaults"] = {}, -- Carica i moduli di base per un'esperienza completa
        ["core.concealer"] = {}, -- Migliora la leggibilità nascondendo il markup
        ["core.dirman"] = { -- Gestione delle aree di lavoro (workspaces)
          config = {
            workspaces = {
              notes = "~/neorg", -- Il workspace principale
            },
            default_workspace = "notes",
          },
        },
        ["core.completion"] = { -- Abilita l'autocompletamento con nvim-cmp
          config = { engine = "nvim-cmp" },
        },
        ["core.qol.todo_items"] = {}, -- Migliora la gestione delle liste di cose da fare
        ["core.integrations.treesitter"] = {}, -- Integrazione con Tree-sitter
      },
    })
  end,
}

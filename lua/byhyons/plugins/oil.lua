-- OIL CON BUFFER FLOTTANTE
return {
  "stevearc/oil.nvim",
  lazy = false,
  opts = {
    default_file_explorer = false,
    columns = { "icon" },
    view_options = {
      show_hidden = true,
      natural_order = true,
    },
    float = {
      padding = 2,
      max_width = 0.7,
      max_height = 0.7,
      border = "rounded",
      win_options = {
        winblend = 10,
      },
    },
    constrain_cursor = "editable",
    cleanup_delay_ms = 2000,
    prompt_save_on_select_new_entry = true,
    lsp_file_methods = {
      enabled = true,
      timeout_ms = 1000,
      autosave_changes = false,
    },
    keymaps = {
      ["<Esc>"] = { "actions.close", mode = "n" }, -- Chiude Oil (come :q)
      ["<CR>"] = "actions.select", -- Apre file o entra nella cartella
      ["<Tab>"] = "actions.select",
      ["<C-v>"] = { "actions.select", opts = { vertical = true } }, -- Apre in split verticale
      ["<C-h>"] = { "actions.select", opts = { horizontal = true } }, -- Apre in split orizzontale
      ["<C-t>"] = { "actions.select", opts = { tab = true } }, -- Apre in nuovo tab
      ["<C-p>"] = "actions.preview", -- Mostra un'anteprima del file (split temporaneo)
      ["<C-c>"] = { "actions.close", mode = "n" }, -- Chiude Oil (alternativa a Esc)
      ["<C-l>"] = "actions.refresh", -- Ricarica la lista dei file/cartelle
      ["-"] = { "actions.parent", mode = "n" }, -- Torna alla cartella superiore
      ["_"] = { "actions.open_cwd", mode = "n" }, -- Apre la directory corrente (cwd)
      ["`"] = { "actions.cd", mode = "n" }, -- Cambia directory in quella attuale
      ["~"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" }, -- Cambia dir solo per questo tab
      ["gs"] = { "actions.change_sort", mode = "n" }, -- Cambia criterio di ordinamento (nome, tipo, ecc.)
      ["gx"] = "actions.open_external", -- Apre il file con l'app di sistema (come `xdg-open`)
      ["g."] = { "actions.toggle_hidden", mode = "n" }, -- Mostra/nasconde i file nascosti
      ["g\\"] = { "actions.toggle_trash", mode = "n" }, -- Passa tra eliminazione diretta e cestino
    },
    use_default_keymaps = true,
  },
}

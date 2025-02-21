-- mySQL
return {
  "tpope/vim-dadbod",
  dependencies = {
    "kristijanhusak/vim-dadbod-ui",
    "kristijanhusak/vim-dadbod-completion",
  },
  cmd = { "DB", "DBUI", "DBUIToggle", "DBUIAddConnection" },
  keys = {
    {
      "<leader>mu",
      function()
        vim.cmd("tabnew") -- Crea una nuova tab
        vim.defer_fn(function()
          vim.cmd("DBUIToggle") -- Avvia DBUI con un leggero ritardo
        end, 300) -- Delay di 200ms
      end,
      desc = "Open Database UI",
    },
    {
      "<leader>ma",
      function()
        vim.cmd("wincmd j") -- Sposta il cursore nella finestra dbout
        vim.cmd("normal! j") -- Scendi di una riga
        vim.cmd("normal! za") -- Apri/chiudi la cartella con za
      end,
      desc = "Apri tabella",
    },
  },
  config = function()
    vim.g.db_ui_auto_execute_table_helpers = 1
    vim.g.db_ui_use_nerd_fonts = 1
    vim.g.db_ui_win_position = "right" -- Pannello DB sulla destra
    vim.g.db_ui_show_database_icon = 1 -- Mostra icona database
    vim.g.db_ui_execute_on_save = 1 -- Non eseguire automaticamente le query
    vim.g.db_ui_winwidth = 55 -- Imposta la larghezza del pannello database

    vim.g.db_ui_table_helpers = {
      mysql = {
        Columns = "USE `{dbname}`; DESCRIBE `{table}`;",
      },
    }

    -- Imposta gli autocmd per la gestione delle finestre
    vim.cmd([[
      augroup DadbodUISettings
        autocmd!
        autocmd FileType dbout wincmd J | resize 21
        autocmd FileType sql wincmd K
      augroup END
    ]])
  end,
}

-- supporto sintassi blade
return {
  "jwalton512/vim-blade",
  ft = "blade",

  -- TODO: TESTARE SE FUNZIONA E SE UTILE:
  -- riconoscimanto filetype
  vim.filetype.add({
    extension = {
      ["blade.php"] = "blade",
    },
  }),
}

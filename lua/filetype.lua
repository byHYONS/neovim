-- Riconosci i file .blade.php come tipo di file blade
vim.filetype.add({
  extension = {
    ["blade.php"] = "blade",
  },
})

-- comando per creare query Blade:
-- :TSEditQuery highlights blade

-- comando per creare injections Blade:
-- :TSEditQuery injections blade

-- interrogare tipo di file:
-- :set filetype?

-- abilita sintassi:
-- :syntax on / :syntax enable

-- lista di highlight gruop:
-- :syntax list

-- verificare il tipo di sintassi caricato:
-- :scriptnames

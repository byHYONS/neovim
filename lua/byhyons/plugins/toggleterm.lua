-- Imposta il leader, se non è già impostato
vim.g.mapleader = " "

-- Funzione di utilità per definire le mappature
local function map(mode, keys, command, desc)
  vim.api.nvim_set_keymap(mode, keys, command, { noremap = true, silent = true, desc = desc })
end

-- Mappature per aprire terminali specifici e generici
map("n", "<leader>zt", ":1ToggleTerm direction=horizontal<CR>", "Terminale generico") -- Terminale generico orizzontale (ID 1)
map("n", "<leader>zf", ":2ToggleTerm direction=float<CR>", "Terminale generico flottante") -- Terminale generico flottante (ID 2)

-- Terminale per `php artisan serve` (ID 3), in modalità flottante
map("n", "<leader>zl", ":3TermExec direction=float cmd='php artisan serve'<CR>", "Avvia server Laravel")

-- Terminale per `npm run dev` (ID 4), in modalità flottante
map("n", "<leader>zn", ":4TermExec direction=float cmd='npm run dev'<CR>", "Avvia server Node")

-- Terminale per Python (usando l'ID 5), in modalità flottante
map("n", "<leader>zp", ":5TermExec direction=float cmd='python3 %'<CR>", "Esegui file Python")

-- Mappatura per chiudere l'inserimento senza chiudere il terminale
map("t", "<leader>zx", "<C-\\><C-n>", "Esci dal terminale senza chiuderlo")

-- Mappatura per chiudere il terminale specifico dalla modalità normale
map("n", "<leader>zc", ":q<CR>", "Chiudi il terminale")

-- Configurazione di ToggleTerm come plugin
return {
  {
    "akinsho/toggleterm.nvim",
    lazy = true,
    cmd = { "ToggleTerm", "TermExec" },
    config = function()
      require("toggleterm").setup({
        size = 15,
        open_mapping = [[<leader>t]], -- Tasto rapido per aprire/chiudere un terminale generico
        direction = "horizontal", -- Direzione predefinita per il terminale generico
        shading_factor = 2, -- Ombreggiatura
        close_on_exit = true, -- Chiudi il terminale al termine del processo
        float_opts = { border = "curved" }, -- Stile della finestra flottante per terminali specifici
      })
    end,
  },
}

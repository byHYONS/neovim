-- Imposta il leader, se non è già impostato
vim.g.mapleader = " "

-- Funzione di utilità per definire le mappature
local function map(mode, keys, command, desc)
  vim.api.nvim_set_keymap(mode, keys, command, { noremap = true, silent = true, desc = desc })
end

-- Funzione per salvare ed eseguire uno script Python
local pythonTerm = nil
function _G.save_and_run_python()
  vim.cmd("write") -- Salva il file corrente
  local Terminal = require("toggleterm.terminal").Terminal
  local cmdM = "python3 " .. vim.fn.expand("%") .. "; exec bash"

  if pythonTerm then
    vim.cmd("normal! <C-w>J")
    pythonTerm:send("\n" .. cmdM)
    vim.defer_fn(function()
      vim.cmd("startinsert")
    end, 200)
  else
    pythonTerm = Terminal:new({
      cmd = cmdM,
      direction = "horizontal",
    }):toggle()
  end
end

-- Funzione per chiudere e cancellare il terminale
function _G.close_python_terminal()
  if pythonTerm then
    vim.cmd("normal! <C-\\><C-n>")
    pythonTerm:close()
    -- Se vuoi anche eliminare il buffer:
    vim.cmd("bd! " .. pythonTerm.bufnr)
    pythonTerm = nil -- Resetta la variabile
  end
end

-- Resetta tutti i terminali
function _G.reset_all_terminals()
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_get_option(buf, "filetype") == "toggleterm" then
      vim.cmd("bd! " .. buf)
    end
  end
end

-- Mappature per aprire terminali specifici e generici

map("n", "<leader>z", "", " Terminal")
map("n", "<leader>zt", ":1ToggleTerm direction=horizontal<CR>", "Terminale generico") -- Terminale generico orizzontale (ID 1)
map("n", "<leader>zf", ":2ToggleTerm direction=float<CR>", "Terminale generico flottante") -- Terminale generico flottante (ID 2)

-- Terminale per `php artisan serve` (ID 3), in modalità flottante
map("n", "<leader>zl", ":3TermExec direction=float cmd='php artisan serve'<CR>", "Avvia server Laravel")

-- Terminale per `npm run dev` (ID 4), in modalità flottante
map("n", "<leader>zn", ":4TermExec direction=float cmd='npm run dev'<CR>", "Avvia server Node")

-- Terminale & OutPut per Python (usando l'ID 5), in modalità flottante
map("n", "<leader>zr", ":lua save_and_run_python()<CR>", "OutPut Python")
map("n", "<leader>zp", ":5TermExec direction=float cmd='python3 %'<CR>", "TermFlot Python")
map("t", "<leader>zq", "<C-\\><C-n>:lua close_python_terminal()<CR>", "Chiudi OutPut")

-- Mappatura per chiudere l'inserimento senza chiudere il terminale
map("t", "<leader>zx", "<C-\\><C-n><C-w>k <C-w>l", "Focus Codice")

-- Terminale per `browser-sync` (ID 6), in modalità flottante
map(
  "n",
  "<leader>zg",
  ":6TermExec direction=float cmd='browser-sync start --server --files \"**/*.html,**/*.css,**/*.js\"'<CR>",
  "Go Live"
)

-- Mappatura per chiudere il terminale specifico dalla modalità normale
map("n", "<leader>zc", ":q<CR>", "Chiudi il terminale")
map("n", "<leader>zd", ":lua reset_all_terminals()<CR>", "Resetta tutto")

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
        close_on_exit = false, -- Chiudi il terminale al termine del processo
        start_in_insert = true,
        float_opts = { border = "curved" }, -- Stile della finestra flottante per terminali specifici
      })
    end,
  },
}

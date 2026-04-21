# NEOVIM ❤️

[![Neovim](https://img.shields.io/badge/Neovim-0.10%2B-blue?style=flat-square&logo=neovim)](https://github.com/neovim/neovim/releases)
[![Lua](https://img.shields.io/badge/Lua-5.1%20%7C%205.4-green?style=flat-square&logo=lua)](https://www.lua.org)
[![Commits](https://img.shields.io/github/commit-activity/y/byHYONS/neovim?style=flat-square)](https://github.com/byHYONS/neovim/commits/main)

> [!NOTE]
>
> repo: neovim

Il mio parere su Neovim?
Amore a prima vista...

## Come appare Neovim

Ecco alcuni screenshot che mostrano la configurazione in azione:

<table>
  <tr>
    <td><img src="https://raw.githubusercontent.com/byHYONS/neovim/main/assets/nvim01.png" width="400"/></td>
    <td><img src="https://raw.githubusercontent.com/byHYONS/neovim/main/assets/nvim02.png" width="400"/></td>
  </tr>
  <tr>
    <td align="center"><em>Tree dei file e popup del menu</em></td>
    <td align="center"><em>Suggerimenti del codice con Copilot</em></td>
  </tr>
  <tr>
    <td><img src="https://raw.githubusercontent.com/byHYONS/neovim/main/assets/nvim03.png" width="400"/></td>
    <td><img src="https://raw.githubusercontent.com/byHYONS/neovim/main/assets/nvim04.png" width="400"/></td>
  </tr>
  <tr>
    <td align="center"><em>Inserimento parametri nelle funzioni</em></td>
    <td align="center"><em>Suggerimenti delle directory</em></td>
  </tr>
  <tr>
    <td><img src="https://raw.githubusercontent.com/byHYONS/neovim/main/assets/nvim05.png" width="400"/></td>
    <td><img src="https://raw.githubusercontent.com/byHYONS/neovim/main/assets/nvim06.png" width="400"/></td>
  </tr>
  <tr>
    <td align="center"><em>Telescope in azione con 2 buffer affiancati</em></td>
    <td align="center"><em>Oil in azione con 2 buffer affiancati</em></td>
  </tr>
</table>

---

## Indice

1. [Requisiti](#requisiti)
2. [Struttura del Progetto](#struttura-del-progetto)
3. [Setup Iniziale](#la-mia-impostazione-e-setting-di-nvim)
4. [Plugin](#plugin)
5. [Keymaps](#keymaps)
6. [Evoluzione LSP 2025](#evoluzione-della-configurazione-lsp-2025)

---

## Requisiti

Prima di iniziare, assicurati di avere installato quanto segue sul tuo Mac:

| Strumento                 | Installazione                                                                                     |
| ------------------------- | ------------------------------------------------------------------------------------------------- |
| **Homebrew**              | `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"` |
| **Git**                   | `brew install git`                                                                                |
| **Ripgrep**               | `brew install ripgrep`                                                                            |
| **Node.js**               | `brew install node`                                                                               |
| **Python**                | `brew install python`                                                                             |
| **WezTerm** (consigliato) | `brew install --cask wezterm`                                                                     |
| **Font Nerd**             | `brew tap homebrew/cask-fonts && brew install font-meslo-lg-nerd-font`                            |

---

## Struttura del Progetto

La configurazione di Neovim è organizzata in questo modo:

```
~/.config/nvim/
├── assets/                    --> Screenshot e immagini per il README
├── after/
│   └── lsp/                   --> Configurazioni LSP individuali
│       ├── html.lua           --> HTML + Blade
│       ├── lua_ls.lua         --> Lua
│       ├── ts_ls.lua          --> TypeScript
│       ├── pyright.lua        --> Python
│       ├── svelte.lua         --> Svelte
│       ├── vue_ls.lua         --> Vue.js
│       ├── cssls.lua          --> CSS
│       ├── tailwindcss.lua    --> Tailwind CSS
│       ├── jsonls.lua         --> JSON
│       ├── graphql.lua        --> GraphQL
│       ├── bashls.lua         --> Bash
│       ├── intelephense.lua   --> PHP
│       ├── phpactor.lua       --> PHP Actor
│       ├── sqls.lua           --> SQL
│       └── emmet_ls.lua       --> Emmet
├── lua/
│   ├── byhyons/
│   │   ├── core/              --> Opzioni e keymaps base
│   │   │   ├── init.lua      --> Entry point core
│   │   │   ├── options.lua   --> Opzioni Neovim
│   │   │   └── keymaps.lua   --> Scorciatoie tastiera
│   │   ├── plugins/          --> Configurazione plugin
│   │   │   ├── init.lua      --> Plugin base (plenary, vim-tmux-navigator)
│   │   │   ├── lsp/          --> LSP e Mason
│   │   │   │   ├── lsp.lua   --> Configurazione base LSP
│   │   │   │   └── mason.lua --> Solo installazione server
│   │   │   ├── colorscheme.lua
│   │   │   ├── nvim-tree.lua
│   │   │   ├── telescope.lua
│   │   │   ├── nvim-cmp.lua
│   │   │   ├── treesitter.lua
│   │   │   ├── gitsigns.lua
│   │   │   ├── lazygit.lua
│   │   │   ├── copilot.lua
│   │   │   ├── noice.lua
│   │   │   ├── oil.lua
│   │   │   └── ... (altri plugin)
│   │   ├── highlight.lua     --> Highlight personalizzati
│   │   └── lazy.lua          --> Configurazione Lazy.nvim
│   └── custom/
│       ├── configs/          --> Configurazioni custom
│       │   └── dap_python.lua
│       ├── clone-github.lua  --> Script per clonare repo
│       ├── github.lua        --> Script per creare repo GitHub
│       └── neorg-exporter.lua --> Script export Neorg
├── snippets/                  --> Snippet personali
├── after/
│   └── queries/              --> Query Treesitter custom
├── init.lua                  --> Entry point principale
└── README.md                 --> Questo file
```

### Spiegazione delle directory principali

- **`lua/byhyons/core/`** - Opzioni base di Neovim e keymaps generali
- **`lua/byhyons/plugins/`** - Configurazione di tutti i plugin
- **`lua/byhyons/plugins/lsp/`** - Configurazione LSP e Mason
- **`after/lsp/`** - File di configurazione per ogni singolo server LSP
- **`lua/custom/`** - Script personali (non inclusi nel README per proteggere il lavoro)
- **`snippets/`** - Snippet personalizzati per vari linguaggi
- **`after/queries/`** - Query Treesitter custom (es. per Blade, HTML, etc.)

---

## Quick Start

Se vuoi solo clonare la configurazione e iniziare subito:

```bash
# Clona la configurazione
git clone https://github.com/tuo-utente/nvim.git ~/.config/nvim

# Apri Neovim (Lazy.nvim installerà automaticamente tutti i plugin)
nvim

# Durante il primo avvio, Lazy installerà i plugin
# Aspetta che finisca l'installazione
```

### Dopo il primo avvio

```bash
# Aggiorna tutti i plugin
:Lazy

# Pulisci i plugin non usati
:Lazy clean
```

---

## La mia impostazione e setting di nvim:

### Aprire una finestra del terminale

Aprire una finestra del terminale sul Mac, va bene qualsiasi:
terminale, Alacritty, iTerm2 oppore WezTerm (quello che uso io)...

### Installare Homebrew

Esegui il seguente comando:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Se necessario, quando richiesto, inserisci la password.
Se non è stato installato XCode Command Line Tools, quando richiesto, premere Invio e homebrew installerà anche questo.

### Aggiungi il percorso solo Apple Macbook Silicon

Eseguire i seguenti due comandi per farlo:

```bash
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"
```

### Installare WezTerm se necessario

Se non si dispone di un terminale con la possibilità di personalizzare i colori, installare WezTerm oppore iTerm2 con homebrew:

Per WezTerm eseguire il seguente comando:

```bash
brew install --cask wezterm
```

Per iTerm2 eseguire il seguente comando:

```bash
brew install --cask iterm2
```

Quindi passare a questo terminale.

### Installare un font Nerd

Io uso `Meslo Nerd Font`.

Per installarlo fare:

```bash
brew tap homebrew/cask-fonts
```

E poi lo fare:

```bash
brew install font-meslo-lg-nerd-font
```

### Installare Neovim

Eseguire:

```bash
brew install neovim
```

### Installare Ripgrep

Eseguire:

```bash
brew install ripgrep
```

### Installare node

Eseguire:

```bash
brew install node
```

### Setup della Struttura iniziale dei file

La configurazione sarà localizzata in `~/.config/nvim`.

Configurare la struttura iniziale del file con i seguenti comandi:

Crea la directory di configurazione nvim.

```bash
mkdir -p ~/.config/nvim
```

`-p` Viene utilizzato anche per creare directory genitori se non esistono già

Spostarsi in questa directory:

```bash
cd ~/.config/nvim
```

Creare il file principale `init.lua`:

```bash
touch init.lua
```

Creazione di una directory di amministrazione `lua/byhyons/core`:

_Ogni volta che uso “byhyons” puoi sostituirlo con il tuo nome._

```bash
mkdir -p lua/byhyons/core
```

Creare una directory plugin (avrà tutte le configurazioni/specs del plugin):

```bash
mkdir -p lua/byhyons/plugins
```

Creazione del file `lazy.lua` (sarà utilizzato per configurare il gestore del plugin lazy.nvim):

```bash
touch lua/byhyons/lazy.lua
```

### Impostare le opzioni di base

Assicurati di essere in `~/.config/nvim` apri la configurazione:

`nvim .`

Passare alla cartella principale e premere `%` per creare un file e chiamarlo: `options.lua`

In questo file aggiungi:

```lua
vim.cmd("let g:netrw_liststyle = 3")
```

Aprire l'esploratore con :Explore e navigare verso il file principale `init.lua`.

Aggiungere le seguenti opzioni per caricare le opzioni di base all'avvio:

```lua
require("byhyons.core.options")
```

Chiudere Neovim con `:w` e riaprirlo con `nvim .`

Torna indietro a `options.lua` e aggiungi quanto segue per impostare il resto delle opzioni:

```lua
local opt = vim.opt -- for conciseness

-- line numbers
opt.relativenumber = true -- show relative line numbers
opt.number = true -- shows absolute line number on cursor line (when relative number is on)

-- tabs & indentation
opt.tabstop = 2 -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one

-- line wrapping
opt.wrap = false -- disable line wrapping

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

-- cursor line
opt.cursorline = true -- highlight the current cursor line

-- appearance

-- turn on termguicolors for nightfly colorscheme to work
-- (have to use iterm2 or any other true color terminal)
opt.termguicolors = true
opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes" -- show sign column so that text doesn't shift

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- turn off swapfile
opt.swapfile = false
```

Fare `:e lua/byhyons/core/init.lua`

Aggiungere quanto segue:

```lua
require("byhyons.core.options")
```

Aprire l'esploratore con `:Explore` andare al file principale `init.lua` e modificare require in:

```lua
require("byhyons.core")
```

### Imposta core keymaps

Fare `:e lua/byhyons/core/keymaps.lua`

E aggiungere quanto segue a questo file:

```lua
-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

---

-- General Keymaps -------------------

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- delete single character without copying into register
-- keymap.set("n", "x", '"\_x')

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) -- go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) -- go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) -- move current buffer to new tab
```

Aprire l'esploratore con `:Explore`, aggiungi qui `lua/byhyons/core/init.lua` quanto segue:

```lua
require("byhyons.core.options")
require("byhyons.core.keymaps")
```

Uscita con `:q` e rientra in Neovim con `nvim .`

### Configurazione lazy.nvim

Vai a `lazy.lua` e aggiungi l'inizianizzazione di `lazy.nvim`

```lua
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
vim.fn.system({
"git",
"clone",
"--filter=blob:none",
"https://github.com/folke/lazy.nvim.git",
"--branch=stable", -- latest stable release
lazypath,
})
end
vim.opt.rtp:prepend(lazypath)
```

Quindi configurare `lazy.nvim` con quanto segue:

```lua
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
vim.fn.system({
"git",
"clone",
"--filter=blob:none",
"https://github.com/folke/lazy.nvim.git",
"--branch=stable", -- latest stable release
lazypath,
})
end
vim.opt.rtp:prepend(lazypath)

--- modifica da qui:
require("lazy").setup("byhyons.plugins")
--- fino a qui
```

Poi apri l'esploratore con `:Explore` e navigare verso il file principale `init.lua`.

Aggiungere quanto segue:

```lua
require("byhyons.core")
require("byhyons.lazy")
```

Uscita con `:q` e rientro in Neovim con `nvim`

Ora è possibile vedere l'interfaccia di `lazy.nvim` digitando il comando `:Lazy` e puoi chiuderla con `q`

### Installare la navigazione plenaria & vim-tmux-navigator

Fare `:e lua/byhyons/plugins/init.lua`

Aggiungere quanto segue per installare il navigatore della plenaria e il `vim-tmux-navigatore`:

```lua
return {
"nvim-lua/plenary.nvim", -- lua functions that many plugins use
"christoomey/vim-tmux-navigator", -- tmux & split window navigation
}
```

Dopo aver aggiunto questo, salvare il file. Si può installare manualmente facendo `:Lazy` e poi digitando `I` (maiuscola).

Oppure si può fare: dopo l'installazione, chiudere l'interfaccia utente con `q` e caricare manualmente un plugin con `:Lazy reload vim-tmux-navigator`.

Altro metodo è: uscire con `:q` e rientro in Neovim con `nvim .`, succederà automaticamente.

### Installare e configurare tokyonight colorscheme

Fare `:e lua/byhyons/plugins/colorscheme.lua`

In questo file aggiungere quanto segue:

```lua
return {
{
"folke/tokyonight.nvim",
priority = 1000, -- make sure to load this before all the other start plugins
config = function()
local bg = "#011628"
local bg_dark = "#011423"
local bg_highlight = "#143652"
local bg_search = "#0A64AC"
local bg_visual = "#275378"
local fg = "#CBE0F0"
local fg_dark = "#B4D0E9"
local fg_gutter = "#627E97"
local border = "#547998"

      require("tokyonight").setup({
        style = "night",
        on_colors = function(colors)
          colors.bg = bg
          colors.bg_dark = bg_dark
          colors.bg_float = bg_dark
          colors.bg_highlight = bg_highlight
          colors.bg_popup = bg_dark
          colors.bg_search = bg_search
          colors.bg_sidebar = bg_dark
          colors.bg_statusline = bg_dark
          colors.bg_visual = bg_visual
          colors.border = border
          colors.fg = fg
          colors.fg_dark = fg_dark
          colors.fg_float = fg
          colors.fg_gutter = fg_gutter
          colors.fg_sidebar = fg_dark
        end,
      })
      -- load the colorscheme here
      vim.cmd([[colorscheme tokyonight]])
    end,

},
}
```

_Questa impostazione di colorcheme di tokyonight ha alcune modifiche dei colori in base alle mie preferenze._

Uscita con `:q` e rientro in Neovim con `nvim .`

### Configurare nvim-tree file explorer

Fare `:e lua/byhyons/plugins/nvim-tree.lua`

Aggiungere le seguenti operazioni:

```lua
return {
"nvim-tree/nvim-tree.lua",
dependencies = "nvim-tree/nvim-web-devicons",
config = function()
local nvimtree = require("nvim-tree")

    -- recommended settings from nvim-tree documentation
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    nvimtree.setup({
      view = {
        width = 35,
        relativenumber = true,
      },
      -- change folder arrow icons
      renderer = {
        indent_markers = {
          enable = true,
        },
        icons = {
          glyphs = {
            folder = {
              arrow_closed = "", -- arrow when folder is closed
              arrow_open = "", -- arrow when folder is open
            },
          },
        },
      },
      -- disable window_picker for
      -- explorer to work well with
      -- window splits
      actions = {
        open_file = {
          window_picker = {
            enable = false,
          },
        },
      },
      filters = {
        custom = { ".DS_Store" },
      },
      git = {
        ignore = false,
      },
    })

    -- set keymaps
    local keymap = vim.keymap -- for conciseness

    keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" }) -- toggle file explorer
    keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file explorer on current file" }) -- toggle file explorer on current file
    keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" }) -- collapse file explorer
    keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" }) -- refresh file explorer

end
}
```

Uscita con `:q` e rientro in Neovim con `nvim`

### Impostazione which-key

which-key è ottimo per vedere quali mappe chiave è possibile utilizzare.

**Apri il file explorer con `<leader>ee` (nella mia configurare il `<leader>` è `space`)**

Nella directory plugins aggiungi un nuovo file con `a` e chiamalo `which-key.lua`

Aggiungi questo al file:

```lua
return {
"folke/which-key.nvim",
event = "VeryLazy",
init = function()
vim.o.timeout = true
vim.o.timeoutlen = 500
end,
opts = {
-- your configuration comes here
-- or leave it empty to use the default settings
-- refer to the configuration section below
},
}
```

Uscita con `:q` e rientro in Neovim con `nvim`

### Setup Telescope fuzzy finder

Apri il file explorer con `<leader>ee`

Nella directory plugins aggiungere un nuovo file con `a` e nominarlo `telescope.lua`

Aggiungi questo al file:

```lua
return {
"nvim-telescope/telescope.nvim",
branch = "0.1.x",
dependencies = {
"nvim-lua/plenary.nvim",
{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
"nvim-tree/nvim-web-devicons",
},
config = function()
local telescope = require("telescope")
local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        path_display = { "smart" },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
            ["<C-j>"] = actions.move_selection_next, -- move to next result
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          },
        },
      },
    })

    telescope.load_extension("fzf")

    -- set keymaps
    local keymap = vim.keymap -- for conciseness

    keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
    keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
    keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
    keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })

end,
}
```

Uscita con `:q` e rientro in Neovim con `nvim`

### Impostare un greeter

Condividiamo un saluto nella pagina iniziale di Neovim con `alpha-nvim`

Apri il file explorer con `<leader>ee`

Nella directory plugins aggiungere un nuovo file con `a` e chiamarlo `alpha.lua`

Aggiungere il seguente codice:

```lua
return {
"goolord/alpha-nvim",
event = "VimEnter",
config = function()
local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

    -- Set header
    dashboard.section.header.val = {
      "                                                     ",
      "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
      "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
      "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
      "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
      "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
      "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
      "                                                     ",
    }

    -- Set menu
    dashboard.section.buttons.val = {
      dashboard.button("e", "  > New File", "<cmd>ene<CR>"),
      dashboard.button("SPC ee", "  > Toggle file explorer", "<cmd>NvimTreeToggle<CR>"),
      dashboard.button("SPC ff", "󰱼 > Find File", "<cmd>Telescope find_files<CR>"),
      dashboard.button("SPC fs", "  > Find Word", "<cmd>Telescope live_grep<CR>"),
      dashboard.button("SPC wr", "󰁯  > Restore Session For Current Directory", "<cmd>SessionRestore<CR>"),
      dashboard.button("q", " > Quit NVIM", "<cmd>qa<CR>"),
    }

    -- Send config to alpha
    alpha.setup(dashboard.opts)

    -- Disable folding on alpha buffer
    vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])

end,
}
```

Uscita con `:q` e rientro in Neovim con `nvim`

### Configurare il gestore di sessione automatizzato

La gestione automatica delle sessioni è ottima per il salvataggio automatico delle sessioni prima di uscire da Neovim, quando si ritorna possiamo recuperare la nostra sessione.

Apri il file explorer con `<leader>ee`

Nella directory plugins aggiungere un nuovo file con `a` e chiamarlo `auto-session.lua`

Aggiungere le seguenti operazioni:

```lua
return {
"rmagatti/auto-session",
config = function()
local auto_session = require("auto-session")

    auto_session.setup({
      auto_restore_enabled = false,
      auto_session_suppress_dirs = { "~/", "~/Dev/", "~/Downloads", "~/Documents", "~/Desktop/" },
    })

    local keymap = vim.keymap

    keymap.set("n", "<leader>wr", "<cmd>SessionRestore<CR>", { desc = "Restore session for cwd" }) -- restore last workspace session for current directory
    keymap.set("n", "<leader>ws", "<cmd>SessionSave<CR>", { desc = "Save session for auto session root dir" }) -- save workspace session for current working directory

end,
}
```

Uscita con `:q` e rientro in Neovim con `nvim .`

Quando si lavora in un progetto, ora è possibile chiudere tutto con `:qa` e quando si apre di nuovo Neovim per repristinare la sessione puoi digitare la combinazione `<leader>wr`.

### Disabilitare lazy.nvim change-detection

Disabilitiamo la notifica di rilevamento del cambio `lazy.nvim`, la trovo un po’ fastidiosa.

Navigare verso `lazy.lua` modificare il codice così:

```lua
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
vim.fn.system({
"git",
"clone",
"--filter=blob:none",
"https://github.com/folke/lazy.nvim.git",
"--branch=stable", -- latest stable release
lazypath,
})
end
vim.opt.rtp:prepend(lazypath)

--- modifica qui:
require("lazy").setup("byhyons.plugins", {
change_detection = {
notify = false,
},
})
--- fino qui
```

Uscita con `:q` e rientro in Neovim con `nvim`

### Impostare il bufferline per migliorare l'aspetto delle schede

Apri il file explorer con `<leader>ee`

Nella directory plugins aggiungere un nuovo file con `a` e chiamarlo `bufferline.lua`

Aggiungere il seguente codice:

```lua
return {
"akinsho/bufferline.nvim",
dependencies = { "nvim-tree/nvim-web-devicons" },
version = "\*",
opts = {
options = {
mode = "tabs",
separator_style = "slant",
},
},
}
```

Uscita con `:q` e rientro in Neovim con `nvim`

### Configurare lualine per una linea di stato migliore

Apri il file explorer con `<leader>ee`

Nella directory plugins aggiungere un nuovo file con `a` e chiamarlo `lualine.lua`

Aggiungere il seguente codice:

```lua
return {
"nvim-lualine/lualine.nvim",
dependencies = { "nvim-tree/nvim-web-devicons" },
config = function()
local lualine = require("lualine")
local lazy_status = require("lazy.status") -- to configure lazy pending updates count

    local colors = {
      blue = "#65D1FF",
      green = "#3EFFDC",
      violet = "#FF61EF",
      yellow = "#FFDA7B",
      red = "#FF4A4A",
      fg = "#c3ccdc",
      bg = "#112638",
      inactive_bg = "#2c3043",
    }

    local my_lualine_theme = {
      normal = {
        a = { bg = colors.blue, fg = colors.bg, gui = "bold" },
        b = { bg = colors.bg, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
      },
      insert = {
        a = { bg = colors.green, fg = colors.bg, gui = "bold" },
        b = { bg = colors.bg, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
      },
      visual = {
        a = { bg = colors.violet, fg = colors.bg, gui = "bold" },
        b = { bg = colors.bg, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
      },
      command = {
        a = { bg = colors.yellow, fg = colors.bg, gui = "bold" },
        b = { bg = colors.bg, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
      },
      replace = {
        a = { bg = colors.red, fg = colors.bg, gui = "bold" },
        b = { bg = colors.bg, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
      },
      inactive = {
        a = { bg = colors.inactive_bg, fg = colors.semilightgray, gui = "bold" },
        b = { bg = colors.inactive_bg, fg = colors.semilightgray },
        c = { bg = colors.inactive_bg, fg = colors.semilightgray },
      },
    }

    -- configure lualine with modified theme
    lualine.setup({
      options = {
        theme = my_lualine_theme,
      },
      sections = {
        lualine_x = {
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
            color = { fg = "#ff9e64" },
          },
          { "encoding" },
          { "fileformat" },
          { "filetype" },
        },
      },
    })

end,
}
```

Per fare in modo che `lualine` possa mostrare aggiornamenti dei plugin in sospeso attraverso `lazy.nvim`, aprire `lazy.lua` e modificarlo così:

```lua
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
vim.fn.system({
"git",
"clone",
"--filter=blob:none",
"https://github.com/folke/lazy.nvim.git",
"--branch=stable", -- latest stable release
lazypath,
})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("josean.plugins", {

--- modificare qui:
checker = {
enabled = true,
notify = false,
},
--- fino a qui

change_detection = {
notify = false,
},
})
```

Uscita con `:q` e rientro in Neovim con `nvim`

### Setup dressing.nvim

`dressing.nvim` migliora lo UI per `vim.ui.selecte` e la `vim.ui.input`

Apri il file explorer con `<leader>ee`

Nella directory plugins aggiungere un nuovo file con `a` e chiamarlo `dressing.lua`

Aggiungere il seguente codice:

```lua
return {
"stevearc/dressing.nvim",
event = "VeryLazy",
}
```

Uscita con `:q` e rientro in Neovim con `nvim`

### Configurazione vim-maximizer

Apri il file explorer con `<leader>ee`

Nella directory plugins aggiungere un nuovo file con `a` e chiamarlo `vim-maximizer.lua`

Aggiungere il seguente codice:

```lua
return {
"szw/vim-maximizer",
keys = {
{ "<leader>sm", "<cmd>MaximizerToggle<CR>", desc = "Maximize/minimize a split" },
},
}
```

Uscita con `:q` e rientro in Neovim con `nvim`

### Setup treesitter

Treesitter è una funzionalità fantastica di Neovim che fornisce una migliore evidenziazione della sintassi, indentazione, autotagging, selezione incrementale e molte altre caratteristiche interessanti.

Apri il file explorer con `<leader>ee`

Nella directory plugins aggiungere un nuovo file con `a` e chiamarlo `treesitter.lua`

Aggiungere il seguente codice:

```lua
return {
"nvim-treesitter/nvim-treesitter",
event = { "BufReadPre", "BufNewFile" },
build = ":TSUpdate",
dependencies = {
"windwp/nvim-ts-autotag",
},
config = function()
-- import nvim-treesitter plugin
local treesitter = require("nvim-treesitter.configs")

    -- configure treesitter
    treesitter.setup({ -- enable syntax highlighting
      highlight = {
        enable = true,
      },
      -- enable indentation
      indent = { enable = true },
      -- enable autotagging (w/ nvim-ts-autotag plugin)
      autotag = {
        enable = true,
      },
      -- ensure these language parsers are installed
      ensure_installed = {
        "json",
        "javascript",
        "typescript",
        "tsx",
        "yaml",
        "html",
        "css",
        "prisma",
        "markdown",
        "markdown_inline",
        "svelte",
        "graphql",
        "bash",
        "lua",
        "vim",
        "dockerfile",
        "gitignore",
        "query",
        "vimdoc",
        "c",
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
    })

end,
}
```

Uscita con `:q` e rientro in Neovim con `nvim`

### Impostare le guide di rientro

Apri il file explorer con `<leader>ee`

Nella directory plugins aggiungere un nuovo file con `a` e chiamarlo `indent-blankline.lua`

Aggiungere il seguente codice:

```lua
return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  opts = {
    indent = {
      char = "│", -- Simbolo di indentazione
    },
    scope = {
      enabled = false, -- Disabilita lo scope highlighting
    },
  },
  config = function()
    require("ibl").setup({
      indent = {
        char = "│",
      },
      scope = {
        enabled = false, -- Disabilita lo scope per evitare interferenze
      },
    })
  end,
}
```

Uscita con `:q` e rientro in Neovim con `nvim`

### Configurazione dell'autocompletamento

Condividiamo il completamento con `nvim-cmp` per ottenere suggerimenti mentre digitiamo.

Apri il file explorer con `<leader>ee`

Nella directory plugins aggiungere un nuovo file con `a` e chiamarlo `nvim-cmp.lua`

Aggiungere il seguente codice:

```lua
return {
"hrsh7th/nvim-cmp",
event = "InsertEnter",
dependencies = {
"hrsh7th/cmp-buffer", -- source for text in buffer
"hrsh7th/cmp-path", -- source for file system paths
{
"L3MON4D3/LuaSnip",
-- follow latest release.
version = "v2.\*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
-- install jsregexp (optional!).
build = "make install_jsregexp",
},
"saadparwaiz1/cmp_luasnip", -- for autocompletion
"rafamadriz/friendly-snippets", -- useful snippets
"onsails/lspkind.nvim", -- vs-code like pictograms
},
config = function()
local cmp = require("cmp")

    local luasnip = require("luasnip")

    local lspkind = require("lspkind")

    -- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
    require("luasnip.loaders.from_vscode").lazy_load()

    cmp.setup({
      completion = {
        completeopt = "menu,menuone,preview,noselect",
      },
      snippet = { -- configure how nvim-cmp interacts with snippet engine
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
        ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
        ["<C-e>"] = cmp.mapping.abort(), -- close completion window
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
      }),
      -- sources for autocompletion
      sources = cmp.config.sources({
        { name = "luasnip" }, -- snippets
        { name = "buffer" }, -- text within current buffer
        { name = "path" }, -- file system paths
      }),

      -- configure lspkind for vs-code like pictograms in completion menu
      formatting = {
        format = lspkind.cmp_format({
          maxwidth = 50,
          ellipsis_char = "...",
        }),
      },
    })

end,
}
```

Uscita con `:q` e rientro in Neovim con `nvim`

### Configurare l'autochisura di coppie

Questo plugin ci aiuterà a chiudere automaticamente parentesi, virgolette, tag ecc.

Apri il file explorer con `<leader>ee`

Nella directory plugins aggiungere un nuovo file con `a` e chiamarlo `autopairs.lua`

Aggiungere il seguente codice:

```lua
return {
"windwp/nvim-autopairs",
event = { "InsertEnter" },
dependencies = {
"hrsh7th/nvim-cmp",
},
config = function()
-- import nvim-autopairs
local autopairs = require("nvim-autopairs")

    -- configure autopairs
    autopairs.setup({
      check_ts = true, -- enable treesitter
      ts_config = {
        lua = { "string" }, -- don't add pairs in lua string treesitter nodes
        javascript = { "template_string" }, -- don't add pairs in javscript template_string treesitter nodes
        java = false, -- don't check treesitter on java
      },
    })

    -- import nvim-autopairs completion functionality
    local cmp_autopairs = require("nvim-autopairs.completion.cmp")

    -- import nvim-cmp plugin (completions plugin)
    local cmp = require("cmp")

    -- make autopairs and completion work together
    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

end,
}
```

Uscita con `:q` e rientro in Neovim con `nvim`

### Configurare il plugin per i commenti

Apri il file explorer con `<leader>ee`

Nella directory plugins aggiungere un nuovo file con `a` e chiamarlo `comment.lua`

Aggiungere il seguente codice:

```lua
return {
  "numToStr/Comment.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "JoosepAlviste/nvim-ts-context-commentstring",
  },
  config = function()
    -- import comment plugin safely
    local comment = require("Comment")

    local ts_context_commentstring = require("ts_context_commentstring.integrations.comment_nvim")

    -- enable comment
    comment.setup({
      padding = true, -- Aggiunge padding ai commenti
      sticky = false, -- Non mantiene il cursore fermo
      ignore = "^$", -- Ignora le linee vuote
      mappings = { -- Abilita le scorciatoie da tastiera
        basic = true,
        extra = false,
      },
      toggler = { -- Imposta i toggle per commentare
        line = "gcc", -- Commenta singola linea
        block = "gbc", -- Commenta blocco
      },
      opleader = { -- Definisce i leader per i commenti
        line = "gc", -- Leader per commentare singole linee
        block = "gb", -- Leader per commentare blocchi
      },
      extra = { -- Mappature extra
        above = "gcO", -- Commenta sopra la riga corrente
        below = "gco", -- Commenta sotto la riga corrente
        eol = "gcA", -- Commenta alla fine della riga corrente
      },
      pre_hook = ts_context_commentstring.create_pre_hook(), -- Pre-hook per gestire linguaggi con context (es. tsx, svelte)
      post_hook = function(ctx)
        -- Esempio di azione nel post_hook
        -- Puoi eseguire una funzione dopo aver commentato, ad esempio loggare un messaggio
        if ctx.range.srow ~= ctx.range.erow then
          print("Hai commentato un blocco di righe!")
        else
          print("Hai commentato una singola riga!")
        end
      end,
    })
  end,
}
```

Uscita con `:q` e rientro in Neovim con `nvim`

### Impostare i commenti todo

Apri il file explorer con `<leader>ee`

Nella directory plugins aggiungere un nuovo file con `a` e chiamarlo `todo-comments.lua`

Aggiungere il seguente codice:

```lua
return {
"folke/todo-comments.nvim",
event = { "BufReadPre", "BufNewFile" },
dependencies = { "nvim-lua/plenary.nvim" },
config = function()
local todo_comments = require("todo-comments")

    -- set keymaps
    local keymap = vim.keymap -- for conciseness

    keymap.set("n", "]t", function()
      todo_comments.jump_next()
    end, { desc = "Next todo comment" })

    keymap.set("n", "[t", function()
      todo_comments.jump_prev()
    end, { desc = "Previous todo comment" })

    todo_comments.setup()

end,
}
```

Cercare `telescope.luacon` con il comando `<leader>ff`

Apri questo file e aggiungere/modificare quanto segue per poter cercare le todo con il telescopio:

```lua
return {
"nvim-telescope/telescope.nvim",
branch = "0.1.x",
dependencies = {
"nvim-lua/plenary.nvim",
{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
"nvim-tree/nvim-web-devicons",

--- modifica qui:
"folke/todo-comments.nvim",
--- fino a qui

},
config = function()
local telescope = require("telescope")
local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        path_display = { "smart" },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
            ["<C-j>"] = actions.move_selection_next, -- move to next result
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          },
        },
      },
    })

    telescope.load_extension("fzf")

    -- set keymaps
    local keymap = vim.keymap -- for conciseness

    keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
    keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
    keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
    keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })

    --- modifica qui:
    keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })
    --- fino a qui

end,
}
```

Uscita con `:q` e rientro in Neovim con `nvim`

### Configurare il plugin di sostituzione

Questo plugin ci permette di utilizzare `s` per incollare/sostituire del testo, spostandoci con motion che precedentemente avevamo copiato.

Apri il file explorer con `<leader>ee`

Nella directory plugins aggiungere un nuovo file con `a` e chiamarlo `substitute.lua`

Aggiungere il seguente codice:

```lua
return {
"gbprod/substitute.nvim",
event = { "BufReadPre", "BufNewFile" },
config = function()
local substitute = require("substitute")

    substitute.setup()

    -- set keymaps
    local keymap = vim.keymap -- for conciseness

    vim.keymap.set("n", "s", substitute.operator, { desc = "Substitute with motion" })
    vim.keymap.set("n", "ss", substitute.line, { desc = "Substitute line" })
    vim.keymap.set("n", "S", substitute.eol, { desc = "Substitute to end of line" })
    vim.keymap.set("x", "s", substitute.visual, { desc = "Substitute in visual mode" })

end,
}
```

Uscita con `:q` e rientro in Neovim con `nvim`

### Configurazione nvim-surround

Questo plugin è ottimo per aggiungere, eliminare e modificare simboli e tag circostanti.

Apri il file explorer con `<leader>ee`

Nella directory plugins aggiungere un nuovo file con `a` e chiamarlo `surround.lua`

Aggiungere il seguente codice:

```lua
return {
"kylechui/nvim-surround",
event = { "BufReadPre", "BufNewFile" },
version = "\*", -- Use for stability; omit to use `main` branch for the latest features
config = true,
}
```

Uscita con `:q` e rientro in Neovim con `nvim`

### Evoluzione della Configurazione LSP (2025)

In questa sezione ti spiego un po' di storia su come è cambiata la configurazione LSP in Neovim e perché abbiamo dovuto adattarci.

#### Come funzionava prima (approccio vecchio)

Con il vecchio approccio, la configurazione LSP funzionava così:

1. **mason.nvim** installava i server linguistici
2. **mason-lspconfig.nvim** li configurava automaticamente
3. In un unico file (`lspconfig.lua`) configuravamo ogni server con `lspconfig["nomeserver"].setup({...})`
4. Ogni server aveva la sua configurazione dentro `mason_lspconfig.setup_handlers({...})`

Questo approccio funzionava, ma aveva diversi problemi:

- **Conflitti frequenti**: con il passare dei mesi, gli aggiornamenti di nvim-lspconfig e mason causavano spesso conflitti
- **Unico punto di fallimento**: se un server aveva un problema, spesso l'intera configurazione LSP smetteva di funzionare
- **Difficoltà nel debug**: era difficile capire quale server causava problemi
- **Il nuovo nvim-lspconfig non accetta più la formula `lspconfig["server"].setup({...})`**: il plugin ha cambiato il suo approccio interno

#### Cosa abbiamo fatto (nuovo approccio)

Per risolvere questi problemi, abbiamo adottato una nuova struttura:

1. **Mason si occupa SOLO dell'installazione** (non configura più i server)
2. **Ogni LSP ha il suo file separato** in `after/lsp/nome_server.lua`
3. **Configurazioni globali** in `lua/byhyons/plugins/lsp/lsp.lua` usando `vim.lsp.config("*")`
4. **Neovim carica automaticamente** i file in `after/lsp/` senza bisogno di import espliciti

Questo approccio è molto più **stabile** perché:

- Ogni LSP è isolato: se uno ha problemi, gli altri continuano a funzionare
- È più facile da mantenere e debuggare
- Neovim gestisce direttamente il caricamento dei server

#### Nuova struttura dei file

La nuova configurazione LSP è organizzata così:

```
lua/byhyons/plugins/lsp/
├── lsp.lua      --> Configurazione base LSP + keymaps + icons
└── mason.lua    --> Solo installazione server (non configurazione!)

after/lsp/
├── html.lua       --> Configurazione HTML
├── lua_ls.lua     --> Configurazione Lua
├── ts_ls.lua      --> Configurazione TypeScript
├── pyright.lua    --> Configurazione Python
├── svelte.lua     --> Configurazione Svelte
├── vue_ls.lua     --> Configurazione Vue
├── cssls.lua      --> Configurazione CSS
├── tailwindcss.lua --> Configurazione Tailwind
├── jsonls.lua     --> Configurazione JSON
├── graphql.lua    --> Configurazione GraphQL
├── bashls.lua     --> Configurazione Bash
├── emmet_ls.lua   --> Configurazione Emmet
├── intelephense.lua --> Configurazione PHP
├── phpactor.lua   --> Configurazione PHP Actor
├── sqls.lua       --> Configurazione SQL
└── vtsls.lua      --> Configurazione VTSLS
```

#### Configurazione LSP Base (lsp.lua)

Questo file contiene le configurazioni globali che si applicano a tutti i server LSP.

Apri il file explorer con `<leader>ee`

Nella directory `lua/byhyons/plugins/lsp/` assicurati che ci sia il file `lsp.lua` oppure crealo con `a` e chiamalo `lsp.lua`

Aggiungere il seguente codice:

```lua
return {
  "hrsh7th/cmp-nvim-lsp",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    { "antosha417/nvim-lsp-file-operations", config = true },
    { "folke/lazydev.nvim", opts = {} },
  },
  config = function()
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    local capabilities = cmp_nvim_lsp.default_capabilities()

    vim.lsp.config("*", {
      capabilities = capabilities,
    })

    -- ==============================
    --  Keymaps e segni diagnostici
    -- ==============================
    local keymap = vim.keymap
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        local opts = { buffer = ev.buf, silent = true }
        opts.desc = "Smart rename"
        keymap.set("n", "gI", vim.lsp.buf.rename, opts)
        opts.desc = "Show LSP references"
        keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)
        opts.desc = "Show definitions"
        keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
        opts.desc = "Go to declaration"
        keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        opts.desc = "Show implementations"
        keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)
        opts.desc = "Show type definitions"
        keymap.set("n", "gy", "<cmd>Telescope lsp_type_definitions<CR>", opts)
        opts.desc = "Code actions"
        keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
        opts.desc = "Buffer diagnostics"
        keymap.set("n", "gL", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)
        opts.desc = "Line diagnostics"
        keymap.set("n", "gl", vim.diagnostic.open_float, opts)
        opts.desc = "Prev diagnostic"
        keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
        opts.desc = "Next diagnostic"
        keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
        opts.desc = "Hover doc"
        keymap.set("n", "K", vim.lsp.buf.hover, opts)
        opts.desc = " Lazy LSP"
        keymap.set("n", "<leader>l", "", opts)
        opts.desc = "Restart LSP"
        keymap.set("n", "<leader>ls", ":LspRestart<CR>", opts)
      end,
    })

    -- ======================
    --   ICONS DIAGNOSTICI
    -- ======================
    local severity = vim.diagnostic.severity

    vim.diagnostic.config({
      virtual_text = true,
      signs = {
        text = {
          [severity.ERROR] = " ",
          [severity.WARN] = " ",
          [severity.HINT] = "󰠠 ",
          [severity.INFO] = " ",
        },
      },
    })
  end,
}
```

Uscita con `:q` e rientro in Neovim con `nvim`

#### Configurazione Mason (mason.lua)

Con il nuovo approccio, **mason si occupa SOLO dell'installazione** dei server e dei tool. Non configura più i server!

Apri il file explorer con `<leader>ee`

Nella directory `lua/byhyons/plugins/lsp/` crea (o modifica) il file `mason.lua`

Aggiungere il seguente codice:

```lua
-- MASON SERVER LSP
return {
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "vtsls",
        "vue_ls",
        "ts_ls",
        "bashls",
        "html",
        "emmet_ls",
        "cssls",
        "tailwindcss",
        "lua_ls",
        "graphql",
        "svelte",
        "intelephense",
        "phpactor",
        "prismals",
        "pyright",
        "clangd",
        "jsonls",
        "sqls",
        "ast_grep",
      },
    },
    dependencies = {
      {
        "williamboman/mason.nvim",
        opts = {
          ui = {
            icons = {
              package_installed = "✓",
              package_pending = "➜",
              package_uninstalled = "✗",
            },
          },
        },
      },
      "neovim/nvim-lspconfig",
    },
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = {
        "shfmt", -- bash formatter
        "prettier", -- prettier formatter
        "stylua", -- lua formatter
        "isort", -- python formatter
        "black", -- python formatter
        "pylint", -- python linter
        "eslint_d", -- js linter
        "blade-formatter",
        "mypy",
        "debugpy",
        "flake8",
        "php-cs-fixer",
        "phpstan",
        "sqlfmt",
        "jq", -- Per manipolare dati JSON
      },
    },
    dependencies = {
      "williamboman/mason.nvim",
    },
  },
}
```

Uscita con `:q` e rientro in Neovim con `nvim`

#### Configurazione LSP individuali (after/lsp/)

Ora ogni LSP ha il suo file separato nella directory `after/lsp/`. Questo permette a Neovim di caricarli automaticamente.

##### Esempio: HTML (after/lsp/html.lua)

Apri il file explorer con `<leader>ee`

Nella directory `after/lsp/` crea un nuovo file con `a` e chiamalo `html.lua`

Aggiungere il seguente codice:

```lua
-- HTML
return {
  cmd = { "vscode-html-language-server", "--stdio" },
  filetypes = { "html", "templ", "blade", "vue", "php" },
  root_markers = { "package.json", ".git" },
  init_options = {
    provideFormatter = true,
    embeddedLanguages = { css = true, javascript = true },
    configurationSection = { "html", "css", "javascript" },
  },
  settings = {},
}
```

Uscita con `:q` e rientro in Neovim con `nvim`

##### Esempio: Lua (after/lsp/lua_ls.lua)

Questo è un esempio più avanzato che mostra come configurare lua_ls con impostazioni personalizzate.

Apri il file explorer con `<leader>ee`

Nella directory `after/lsp/` crea un nuovo file con `a` e chiamalo `lua_ls.lua`

Aggiungere il seguente codice:

```lua
-- LUA_LS — LUA
return {
  cmd = { "lua-language-server" },
  filetypes = { "lua" },

  on_init = function(client)
    if client.workspace_folders and client.workspace_folders[1] then
      local path = client.workspace_folders[1].name

      ---@class HyonLuv
      ---@field fs_stat fun(path: string): table|nil
      ---@type HyonLuv|nil
      local luv = (vim and (vim.uv or vim.loop)) --[[@as HyonLuv|nil]]

      local has_luarc = false
      if luv then
        if luv.fs_stat(path .. "/.luarc.json") ~= nil then
          has_luarc = true
        elseif luv.fs_stat(path .. "/.luarc.jsonc") ~= nil then
          has_luarc = true
        end
      end

      if path ~= vim.fn.stdpath("config") and has_luarc then
        return
      end
    end

    -- Assicuriamoci che le tabelle esistano
    client.config = client.config or {}
    client.config.settings = client.config.settings or {}

    client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua or {}, {
      runtime = {
        version = "LuaJIT",
        path = { "lua/?.lua", "lua/?/init.lua" },
      },
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME,
        },
      },
      diagnostics = {
        globals = { "vim" },
        disable = { "missing-fields" },
      },
      completion = { callSnippet = "Replace" },
      telemetry = { enable = false },
    })
  end,

  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
        disable = { "missing-fields" },
      },
      completion = { callSnippet = "Replace" },
      telemetry = { enable = false },
    },
  },
}
```

Uscita con `:q` e rientro in Neovim con `nvim`

##### Altri LSP

Puoi aggiungere gli altri LSP seguendo lo stesso schema. Gli LSP attualmente configurati sono:

- `ts_ls.lua` - TypeScript/JavaScript
- `vue_ls.lua` - Vue.js
- `svelte.lua` - Svelte
- `pyright.lua` - Python
- `cssls.lua` - CSS
- `tailwindcss.lua` - Tailwind CSS
- `jsonls.lua` - JSON
- `graphql.lua` - GraphQL
- `bashls.lua` - Bash/Shell
- `emmet_ls.lua` - Emmet
- `intelephense.lua` - PHP
- `phpactor.lua` - PHP (alternativo)
- `sqls.lua` - SQL
- `vtsls.lua` - TypeScript (Volar)

#### Aggiornare lazy.lua per caricare i plugin LSP

Ora dobbiamo dire a lazy.nvim di caricare i plugin LSP.

Navigare verso `lazy.lua` e modificarlo in modo che lazy.nvim riconosca la nuova directory `lsp`.

Modificare la parte di require in questo modo:

```lua
--- modificare qui:
require("lazy").setup({ { import = "byhyons.plugins" }, { import = "byhyons.plugins.lsp" } }, {
--- fino a qui

checker = {
enabled = true,
notify = false,
},
change_detection = {
notify = false,
},
})
```

Uscita con `:q` e rientro in Neovim con `nvim`

#### nvim-cmp source per LSP

Ora dobbiamo assicurarci che nvim-cmp abbia accesso ai suggerimenti LSP.

Navigare verso `nvim-cmp.lua` e assicurarsi di avere questa configurazione nelle sources:

```lua
-- sources for autocompletion
sources = cmp.config.sources({

  --- modifica qui:
  { name = "nvim_lsp"},
  --- fino a qui

  { name = "luasnip" }, -- snippets
  { name = "buffer" }, -- text within current buffer
  { name = "path" }, -- file system paths
}),
```

Uscita con `:q` e rientro in Neovim con `nvim`

### Installazione di trouble.nvim

Questo è un altro plugin che aggiunge alcune belle funzionalità per interagire con lsp e alcune altre cose come i commenti todo.

Apri il file explorer con `<leader>ee`

Nella directory plugins aggiungere un nuovo file con `a` e chiamarlo `trouble.lua`

Aggiungere il seguente codice:

```lua
return {
"folke/trouble.nvim",
dependencies = { "nvim-tree/nvim-web-devicons", "folke/todo-comments.nvim" },
opts = {
focus = true,
},
cmd = "Trouble",
keys = {
{ "<leader>xw", "<cmd>Trouble diagnostics toggle<CR>", desc = "Open trouble workspace diagnostics" },
{ "<leader>xd", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>", desc = "Open trouble document diagnostics" },
{ "<leader>xq", "<cmd>Trouble quickfix toggle<CR>", desc = "Open trouble quickfix list" },
{ "<leader>xl", "<cmd>Trouble loclist toggle<CR>", desc = "Open trouble location list" },
{ "<leader>xt", "<cmd>Trouble todo toggle<CR>", desc = "Open todos in trouble" },
},
}
```

Il codice sopra è stato aggiornato per funzionare con la versione 3 di `trouble.nvim`.

Uscita con `:q` e rientro in Neovim con `nvim`

### Configurazione della formattazione

Usaremo `conform.nvim` per la configurazione della formattazione in Neovim.

Apri il file explorer con `<leader>ee`

Nella directory plugins aggiungere un nuovo file con `a` e chiamarlo `formatting.lua`

Aggiungere il seguente codice:

```lua
return {
"stevearc/conform.nvim",
event = { "BufReadPre", "BufNewFile" },
config = function()
local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        svelte = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        graphql = { "prettier" },
        liquid = { "prettier" },
        lua = { "stylua" },
        python = { "isort", "black" },
      },
      format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      },
    })

    vim.keymap.set({ "n", "v" }, "<leader>mp", function()
      conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      })
    end, { desc = "Format file or range (in visual mode)" })

end,
}
```

Navigare verso `mason.lua` aggiungere le seguenti modifiche ai formatter di installazione automatica:

```lua
return {
"williamboman/mason.nvim",
dependencies = {
"williamboman/mason-lspconfig.nvim",

--- modifica qui:
"WhoIsSethDaniel/mason-tool-installer.nvim",
--- fino a qui

},
config = function()
-- import mason
local mason = require("mason")

    -- import mason-lspconfig
    local mason_lspconfig = require("mason-lspconfig")

    --- modifica qui:
    local mason_tool_installer = require("mason-tool-installer")
    --- fino a qui


    -- enable mason and configure icons
    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    mason_lspconfig.setup({
      -- list of servers for mason to install
      ensure_installed = {
        "tsserver",
        "html",
        "cssls",
        "tailwindcss",
        "svelte",
        "lua_ls",
        "graphql",
        "emmet_ls",
        "prismals",
        "pyright",
      },
    })

    --- modifica qui:
    mason_tool_installer.setup({
      ensure_installed = {
        "prettier", -- prettier formatter
        "stylua", -- lua formatter
        "isort", -- python formatter
        "black", -- python formatter
      },
    })
    --- fino a qui

end,
}
```

Uscita con `:q` e rientro in Neovim con `nvim`

### Setup linting

Stiamo usando `nvim-lint` per impostare l'analisi del codice in Neovim.

Apri il file explorer con `<leader>ee`

Nella directory plugins aggiungere un nuovo file con `a` e chiamarlo `linting.lua`

Aggiungere il seguente codice:

```lua
return {
"mfussenegger/nvim-lint",
event = { "BufReadPre", "BufNewFile" },
config = function()
local lint = require("lint")

    lint.linters_by_ft = {
      javascript = { "eslint_d" },
      typescript = { "eslint_d" },
      javascriptreact = { "eslint_d" },
      typescriptreact = { "eslint_d" },
      svelte = { "eslint_d" },
      python = { "pylint" },
    }

    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint()
      end,
    })

    vim.keymap.set("n", "<leader>l", function()
      lint.try_lint()
    end, { desc = "Trigger linting for current file" })

end,
}
```

Navigare verso `mason.lua` aggiungere le seguenti operazioni per installare automaticamente linters:

```lua
return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    -- import mason
    local mason = require("mason")

    -- import mason-lspconfig
    local mason_lspconfig = require("mason-lspconfig")

    local mason_tool_installer = require("mason-tool-installer")

    -- enable mason and configure icons
    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    mason_lspconfig.setup({
      -- list of servers for mason to install
      ensure_installed = {
        -- "tsserver",
        "html",
        "cssls",
        "tailwindcss",
        "svelte",
        "lua_ls",
        "graphql",
        "emmet_ls",
        "prismals",
        "pyright",
        "intelephense",
        "phpactor",
        "ast_grep",
        "clangd",
        "harper_ls",
        "ast_grep",
        "stimulus_ls",
        "vuels",
      },
    })

    mason_tool_installer.setup({
      ensure_installed = {
        "prettier", -- prettier formatter
        "stylua", -- lua formatter
        "isort", -- python formatter
        "black", -- python formatter

        --- modificare qui:
        "pylint", -- python linter
        "eslint_d", -- js linter
        "blade-formatter", -- Aggiungi blade-formatter qui
        --- fino qui

      },
    })
  end,
}
```

Uscita con `:q` e rientro in Neovim con `nvim`

### Installazione per le funzionalità di Git

#### Plugin di configurazione gitsigns

`gitsigns` è un ottimo plugin per interagire con git in Neovim.

Apri il file explorer con `<leader>ee`

Nella directory plugins aggiungere un nuovo file con `a` e chiamalo `gitsigns.lua`

Aggiungere il seguente codice:

```lua
return {
"lewis6991/gitsigns.nvim",
event = { "BufReadPre", "BufNewFile" },
opts = {
on_attach = function(bufnr)
local gs = package.loaded.gitsigns

      local function map(mode, l, r, desc)
        vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
      end

      -- Navigation
      map("n", "]h", gs.next_hunk, "Next Hunk")
      map("n", "[h", gs.prev_hunk, "Prev Hunk")

      -- Actions
      map("n", "<leader>hs", gs.stage_hunk, "Stage hunk")
      map("n", "<leader>hr", gs.reset_hunk, "Reset hunk")
      map("v", "<leader>hs", function()
        gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
      end, "Stage hunk")
      map("v", "<leader>hr", function()
        gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
      end, "Reset hunk")

      map("n", "<leader>hS", gs.stage_buffer, "Stage buffer")
      map("n", "<leader>hR", gs.reset_buffer, "Reset buffer")

      map("n", "<leader>hu", gs.undo_stage_hunk, "Undo stage hunk")

      map("n", "<leader>hp", gs.preview_hunk, "Preview hunk")

      map("n", "<leader>hb", function()
        gs.blame_line({ full = true })
      end, "Blame line")
      map("n", "<leader>hB", gs.toggle_current_line_blame, "Toggle line blame")

      map("n", "<leader>hd", gs.diffthis, "Diff this")
      map("n", "<leader>hD", function()
        gs.diffthis("~")
      end, "Diff this ~")

      -- Text object
      map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "Gitsigns select hunk")
    end,

},
}
```

Uscita con `:q`

#### Configurazione di lazygit

Assicurati di avere `lazygit` installato.

Installarlo con homebrew:

```bash
brew install jesseduffield/lazygit/lazygit
```

Aprire Neovim con `nvim .`

Nella directory plugins aggiungere un nuovo file con `a` e chiamarlo `lazygit.lua`

Aggiungere il seguente codice:

```lua
return {
  "kdheepak/lazygit.nvim",
  cmd = {
    "LazyGit",
    "LazyGitConfig",
    "LazyGitCurrentFile",
    "LazyGitFilter",
    "LazyGitFilterCurrentFile",
  },
  -- optional for floating window border decoration
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  -- setting the keybinding for LazyGit with 'keys' is recommended in
  -- order to load the plugin when the command is run for the first time
  keys = {
    { "<leader>lg", "<cmd>LazyGit<cr>", desc = "Open lazy git" },
    { "<leader>lr", ":lua CreateGitHubRepo()<CR>", desc = "Create GitHub Repository" }, -- aggiungi questa linea per il comando dell'inizializzazione repo
  },
}
```

Uscita con `:q` e rientro in Neovim con `nvim`

#### Inizializziare una Repository su GitHub

Imstallare GitHub CLI con il seguente comando:

```bash
brew install gh
```

Dopo l'installazione dobbiamo autenticarci, per farlo eseguire il comando:

```bash
gh auth login
```

Seguire le istruzioni per l'autenticazione.

Spostarsi nella directory `nvim/lua` con il `a` creare una nuova directory e chiamarla `custom/`

Nella directory `nvim/lua/custom/` aggiungere un nuovo file con `a` e chiamarlo `github.lua`

Aggiungere il seguente codice:

```lua
local Job = require("plenary.job")

function CreateGitHubRepo()
  local repo_name = vim.fn.input("Nome della nuova repository GitHub: ")
  if repo_name == "" then
    print("Nome repository non valido.")
    return
  end

  local visibility = vim.fn.input("Repository pubblica o privata? (pubblica/privata): ")
  local is_public = (visibility == "pubblica")

  -- Step 1: Inizializza Git se necessario
  Job:new({
    command = "git",
    args = { "rev-parse", "--is-inside-work-tree" },
    on_exit = function(j, return_val)
      if return_val ~= 0 then
        Job
          :new({
            command = "git",
            args = { "init" },
            on_exit = function()
              print("Repository Git locale inizializzata.")

              -- Salta la creazione di README.md, continua con il commit se necessario

              -- Step 4: Crea la repository su GitHub e aggiungi il remote origin
              Job
                :new({
                  command = "gh",
                  args = {
                    "repo",
                    "create",
                    repo_name,
                    is_public and "--public" or "--private",
                    "--source=.",
                    "--remote=origin",
                  },
                  on_exit = function(j, return_val)
                    if return_val == 0 then
                      print("Repository creata con successo su GitHub con il commit iniziale!")
                      -- Step 5: Esegue il primo push
                      Job:new({
                        command = "git",
                        args = { "push", "-u", "origin", "main" },
                        on_exit = function(j, return_val)
                          if return_val == 0 then
                            print("Upstream impostato correttamente per il branch 'main'.")
                          else
                            print("Errore nel push iniziale: " .. table.concat(j:stderr_result(), "\n"))
                          end
                        end,
                      }):start()
                    else
                      print(
                        "Errore nella creazione della repository su GitHub: " .. table.concat(j:stderr_result(), "\n")
                      )
                    end
                  end,
                })
                :start()
            end,
          })
          :start()
      else
        -- Se è già una repository Git, crea la repository su GitHub e aggiunge il remote
        Job:new({
          command = "gh",
          args = {
            "repo",
            "create",
            repo_name,
            is_public and "--public" or "--private",
            "--source=.",
            "--remote=origin",
          },
          on_exit = function(j, return_val)
            if return_val == 0 then
              print("Repository esistente collegata a GitHub!")
              -- Esegue il push iniziale per una repository esistente
              Job:new({
                command = "git",
                args = { "push", "-u", "origin", "main" },
                on_exit = function(j, return_val)
                  if return_val == 0 then
                    print("Upstream impostato correttamente per il branch 'main'.")
                  else
                    print("Errore nel push iniziale: " .. table.concat(j:stderr_result(), "\n"))
                  end
                end,
              }):start()
            else
              print("Errore nel collegamento della repository: " .. table.concat(j:stderr_result(), "\n"))
            end
          end,
        }):start()
      end
    end,
  }):start()
end
```

Uscita con `:q` e rientro in Neovim con `nvim`

### GO LIVE + Terminale

per aggiungere golive in neovim dobbiamo installare a livello globare browser sync

```bash
npm install -g browser-sync
```

dobbiamo aggiungere un file nella directory plugins con `a` e chiamarlo `togglerterm.lua`
la mia configurazione prevede anche la possibilità di aprire più terminali, anche flottanti, con comandi per aprire server come quello di Laravel o di Node.

Aggiungere il seguente codice:

```lua

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

-- Terminale per `browser-sync` (ID 6), in modalità flottante
map(
  "n",
  "<leader>zb",
  ":6TermExec direction=float cmd='browser-sync start --server --files \"**/*.html,**/*.css,**/*.js\"'<CR>",
  "Avvia Browser Sync"
)

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
```

Uscita con `:q` e rientro in Neovim con `nvim`

### Configurazione di GitHub Copilot

GitHub Copilot è un assistente AI che ti aiuta a scrivere codice più velocemente con suggerimenti automatici.

#### Installazione di GitHub Copilot

Apri il file explorer con `<leader>ee`

Nella directory plugins aggiungere un nuovo file con `a` e chiamarlo `copilot.lua`

Aggiungere il seguente codice:

```lua
-- COPILOT GITHUB
return {
  "github/copilot.vim",
  -- event = "InsertEnter", -- carica in automatico
  cmd = "Copilot", -- carica con :Copilot
  config = function()
    vim.g.copilot_filetypes = {
      ["*"] = true, -- abilita su tutti i file
    }
    -- mappa <Tab> per accettare la proposta di Copilot
    vim.api.nvim_set_keymap(
      "i",
      "<Tab>",
      'copilot#Accept("<CR>")',
      { silent = true, expr = true, replace_keycodes = false }
    )
    vim.cmd("Copilot setup")
  end,
}
```

Uscita con `:q` e rientro in Neovim con `nvim`

#### Configurazione Copilot CMP

Questo plugin aggiunge Copilot come source per nvim-cmp.

Apri il file explorer con `<leader>ee`

Nella directory plugins aggiungere un nuovo file con `a` e chiamarlo `copilot-cmp.lua`

Aggiungere il seguente codice:

```lua
-- COPILOT GITUB CMP
return {
  "zbirenbaum/copilot-cmp",
  after = "copilot.vim",
  config = function()
    require("copilot_cmp").setup({
      suggestion = { auto_trigger = true },
      panel = { enabled = false },
    })
  end,
}
```

Uscita con `:q` e rientro in Neovim con `nvim`

#### Configurazione Copilot Chat

Questo plugin ti permette di chiedere a Copilot domande direttamente da Neovim con una UI a chat.

Apri il file explorer con `<leader>ee`

Nella directory plugins aggiungere un nuovo file con `a` e chiamarlo `copilot-chat.lua`

Aggiungere il seguente codice:

```lua
-- COPILOR GITHUB CHAT
return {
  "CopilotC-Nvim/CopilotChat.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "github/copilot.vim",
  },
  build = "make tiktoken",
  cmd = {
    "CopilotChat",
    "CopilotChatClose",
    "CopilotChatNew",
    "CopilotChatSave",
  },
  opts = {
    window = {
      layout = "float",
      border = "rounded",
      -- dimensioni relative alla finestra corrente
      width = 0.7,
      height = 0.7,
    },
    question_header = "## byHYONS™ ",
    answer_header = "## Copilot  ",
    error_header = "## Error ",
    mappings = {
      complete = { detail = "Use @<Tab> or /<Tab> for options.", insert = "<C-j>" },
      close = { normal = "q", insert = "<C-c>" },
      reset = { normal = "<C-x>", insert = "<C-x>" },
      submit_prompt = { normal = "<CR>", insert = "<C-CR>" },
      accept_diff = { normal = "<C-y>", insert = "<C-y>" },
      show_help = { normal = "g?" },
    },
  },
  config = function(_, opts)
    local chat = require("CopilotChat")
    chat.setup(opts)
  end,
}
```

Uscita con `:q` e rientro in Neovim con `nvim`

### Configurazione Noice.nvim

Noice.nvim è un plugin che migliora l'interfaccia dei messaggi e della command line di Neovim, trasformandola in una palette flottante moderna.

Apri il file explorer con `<leader>ee`

Nella directory plugins aggiungere un nuovo file con `a` e chiamarlo `noice.lua`

Aggiungere il seguente codice:

```lua
return {
  "folke/noice.nvim",
  event = "VeryLazy",
  config = function()
    require("noice").setup({
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      presets = {
        bottom_search = false, -- Sposta la barra di ricerca in basso
        command_palette = true, -- Trasforma la linea di comando in una palette flottante
        long_message_to_split = true, -- Invia i messaggi lunghi a uno split
        inc_rename = false, -- Disattiva l'inc-renaming per usare la linea di comando standard
        lsp_doc_border = true, --  Bordo ai documenti LSP
      },
    })
  end,
  dependencies = {
    "MunifTanjim/nui.nvim", -- Necessario per le finestre flottanti di Noice
    "rcarriga/nvim-notify", -- Plugin per notifiche visive in Neovim
  },
}
```

Uscita con `:q` e rientro in Neovim con `nvim`

### Configurazione Oil.nvim

Oil è un file explorer che usa il buffer corrente come directory, permettendo di navigare il filesystem senza aprire una nuova finestra.

Apri il file explorer con `<leader>ee`

Nella directory plugins aggiungere un nuovo file con `a` e chiamarlo `oil.lua`

Aggiungere il seguente codice:

```lua
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
```

Per aprire Oil nella directory corrente usa `:Oil`

Uscita con `:q` e rientro in Neovim con `nvim`

### Configurazione Flash.nvim

Flash è un plugin che migliora la navigazione nel codice, permettendo di saltare a qualsiasi posizione visible con pattern personalizzati.

Apri il file explorer con `<leader>ee`

Nella directory plugins aggiungere un nuovo file con `a` e chiamarlo `flash.lua`

Aggiungere il seguente codice:

```lua
-- FLASH MUTIONS
return {
  "folke/flash.nvim",
  event = "VeryLazy",
  -- -@type Flash.Config
  opts = {
    modes = {
      search = {
        enable = true,
      },
      char = {
        enabled = false,
        jump_labels = false,
      },
    },
  },
  -- stylua: ignore
  keys = {
    { "\\s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    { "\\S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    { "\\r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    { "\\R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  },
}
```

Uscita con `:q` e rientro in Neovim con `nvim`

### Configurazione vim-illuminate

Questo plugin evidenzia automaticamente tutte le occorrenze della parola sotto il cursore, utile per vedere tutti i riferimenti a una variabile o funzione.

Apri il file explorer con `<leader>ee`

Nella directory plugins aggiungere un nuovo file con `a` e chiamarlo `vim-illuminate.lua`

Aggiungere il seguente codice:

```lua
return {
  "RRethy/vim-illuminate",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    -- definisci gli highlight (fuori da configure)
    vim.api.nvim_set_hl(0, "IlluminatedWordText", { bg = "#334477", fg = "NONE" })
    vim.api.nvim_set_hl(0, "IlluminatedWordRead", { bg = "#334477", fg = "NONE" })
    vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { bg = "#334477", fg = "NONE" })

    require("illuminate").configure({
      providers = { "lsp", "treesitter", "regex" },
      delay = 150,
      under_cursor = false, -- evita il "flash" sotto al cursore
      filetypes_denylist = {
        "NvimTree",
        "alpha",
        "dashboard",
        "lazy",
        "mason",
        "TelescopePrompt",
        "help",
      },
      large_file_cutoff = 2000,
      large_file_overrides = { providers = { "treesitter" } },
    })
  end,
}
```

Uscita con `:q` e rientro in Neovim con `nvim`

### Configurazione Snippets (LuaSnip)

LuaSnip è un motore di snippet per Neovim che supporta snippet in formato Lua e VS Code.

Apri il file explorer con `<leader>ee`

Nella directory plugins aggiungere un nuovo file con `a` e chiamarlo `snippets.lua`

Aggiungere il seguente codice:

```lua
return {
  "L3MON4D3/LuaSnip",
  config = function()
    local ls = require("luasnip")
    -- Carica gli snippet in formato Lua
    require("luasnip.loaders.from_lua").lazy_load({
      paths = { vim.fn.expand("~/.config/nvim/snippets") },
    })
    -- Carica snippet in formato VS Code
    require("luasnip.loaders.from_vscode").lazy_load({
      paths = { vim.fn.expand("~/.config/nvim/snippets") },
    })

    -- Configura LuaSnip (opzionale, personalizza a tuo piacimento)
    ls.config.set_config({
      history = true, -- Mantieni la cronologia degli snippet espansi per poterli annullare
      updateevents = "TextChanged,TextChangedI", -- Aggiorna lo snippet durante la digitazione
      enable_autosnippets = true, -- Abilita gli snippet automatici
    })
  end,
}
```

Uscita con `:q` e rientro in Neovim con `nvim`

### Configurazione Neorg

Neorg è un organizer per Neovim (simile a Org-mode di Emacs) che permette di prendere appunti, gestire task, e molto altro.

#### Prerequisiti

Assicurati di avere installato Pandoc per esportare i file:

```bash
brew install pandoc
```

Apri il file explorer con `<leader>ee`

Nella directory plugins aggiungere un nuovo file con `a` e chiamarlo `neorg.lua`

Aggiungere il seguente codice:

```lua
-- Neorg
return {
  "nvim-neorg/neorg",
  version = "*",
  ft = { "norg" }, -- carica aprendo .norg
  cmd = { "Neorg" }, -- chiamando :Neorg
  build = ":Neorg sync-parsers",
  dependencies = {
    "nvim-neorg/lua-utils.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-neotest/nvim-nio",
    "pysan3/pathlib.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    require("neorg").setup({
      load = {
        ["core.defaults"] = {},
        ["core.concealer"] = {},
        ["core.dirman"] = {
          config = {
            workspaces = { notes = "~/neorg" },
            default_workspace = "notes",
          },
        },
        ["core.completion"] = { config = { engine = "nvim-cmp" } },
        ["core.qol.todo_items"] = {},
        ["core.integrations.treesitter"] = {},
        ["core.export"] = {},
      },
    })
  end,
}
```

Uscita con `:q` e rientro in Neovim con `nvim`

### Configurazione nvim-dap e nvim-dap-ui

nvim-dap (Debug Adapter Protocol) è un plugin che permette il debug del codice direttamente in Neovim, simile a un IDE.

#### Prerequisiti per Python

Per il debug Python, installa debugpy:

```bash
pip install debugpy
```

#### Configurazione nvim-dap

Apri il file explorer con `<leader>ee`

Nella directory plugins aggiungere un nuovo file con `a` e chiamarlo `nvim-dap.lua`

Aggiungere il seguente codice:

```lua
return {
  "mfussenegger/nvim-dap",
  event = "VeryLazy",
  config = function()
    require("custom.configs.dap_python") -- configurazione per Python
    -- eventualmente qui puoi caricare altre configurazioni per altri linguaggi
    require("byhyons.core.keymaps") -- se hai mappature dedicate al debug
  end,
}
```

#### Configurazione nvim-dap-ui

Questo plugin fornisce un'interfaccia utente per nvim-dap.

Apri il file explorer con `<leader>ee`

Nella directory plugins aggiungere un nuovo file con `a` e chiamarlo `nvim-dap-ui.lua`

Aggiungere il seguente codice:

```lua
return {
  "rcarriga/nvim-dap-ui",
  event = "VeryLazy",
  dependencies = {
    "mfussenegger/nvim-dap",
    "theHamsta/nvim-dap-virtual-text",
    "nvim-telescope/telescope-dap.nvim",
    "nvim-neotest/nvim-nio",
  },
  opts = {
    controls = {
      element = "repl",
      enabled = false,
      icons = {
        disconnect = "",
        pause = "",
        play = "",
        run_last = "",
        step_back = "",
        step_into = "",
        step_out = "",
        step_over = "",
        terminate = "",
      },
    },
    element_mappings = {},
    expand_lines = true,
    floating = {
      border = "single",
      mappings = { close = { "q", "<Esc>" } },
    },
    force_buffers = true,
    icons = {
      collapsed = "",
      current_frame = "",
      expanded = "",
    },
    layouts = {
      {
        elements = {
          { id = "scopes", size = 0.50 },
          { id = "stacks", size = 0.30 },
          { id = "watches", size = 0.10 },
          { id = "breakpoints", size = 0.10 },
        },
        size = 40,
        position = "left",
      },
      {
        elements = { "repl", "console" },
        size = 10,
        position = "bottom",
      },
    },
    mappings = {
      edit = "e",
      expand = { "<CR>", "<2-LeftMouse>" },
      open = "o",
      remove = "d",
      repl = "r",
      toggle = "t",
    },
    render = { indent = 1, max_value_lines = 100 },
  },
  config = function(_, opts)
    local dap = require("dap")
    require("dapui").setup(opts)

    -- Imposta i segni per il debug
    vim.api.nvim_set_hl(0, "DapStoppedHl", { fg = "#A277FF", bg = "#2A2A2A", bold = true })
    vim.api.nvim_set_hl(0, "DapStoppedLineHl", { bg = "#204028", bold = true })
    vim.fn.sign_define("DapStopped", { text = "", texthl = "DapStoppedHl", linehl = "DapStoppedLineHl", numhl = "" })
    vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DiagnosticSignError", linehl = "", numhl = "" })
    vim.fn.sign_define(
      "DapBreakpointCondition",
      { text = "", texthl = "DiagnosticSignWarn", linehl = "", numhl = "" }
    )
    vim.fn.sign_define(
      "DapBreakpointRejected",
      { text = "", texthl = "DiagnosticSignError", linehl = "", numhl = "" }
    )
    vim.fn.sign_define("DapLogPoint", { text = "", texthl = "DiagnosticSignInfo", linehl = "", numhl = "" })

    dap.listeners.after.event_initialized["dapui_config"] = function()
      require("dapui").open()
    end
    dap.listeners.before.event_terminated["dapui_config"] = function() end
    dap.listeners.before.event_exited["dapui_config"] = function() end
  end,
}
```

#### Configurazione Python per DAP

Crea il file `lua/custom/configs/dap_python.lua` e aggiungi:

```lua
local dap = require("dap")

dap.adapters.python = {
  type = "executable",
  command = "python", -- assicurati che questo punti al python corretto
  args = { "-m", "debugpy.adapter" },
}

dap.configurations.python = {
  {
    type = "python",
    request = "launch",
    name = "Debug current file",
    program = "${file}",
    pythonPath = function()
      local venv = os.getenv("VIRTUAL_ENV")
      if venv then
        return venv .. "/bin/python"
      else
        return "python"
      end
    end,
  },
}
```

Uscita con `:q` e rientro in Neovim con `nvim`

### Configurazione Treesitter Text Objects

Questo plugin aggiunge text objects basati su Treesitter per selezionare funzioni, classi, parametri, ecc.

Apri il file explorer con `<leader>ee`

Nella directory plugins aggiungere un nuovo file con `a` e chiamarlo `nvim-treesitter-text-objects.lua`

Aggiungere il seguente codice:

```lua
return {
  "nvim-treesitter/nvim-treesitter-textobjects",
  lazy = true,
  config = function()
    require("nvim-treesitter.configs").setup({
      textobjects = {
        select = {
          enable = true,

          -- Automatically jump forward to textobj, similar to targets.vim
          lookahead = true,

          keymaps = {
            -- You can use the capture groups defined in textobjects.scm
            ["a="] = { query = "@assignment.outer", desc = "Select outer part of an assignment" },
            ["i="] = { query = "@assignment.inner", desc = "Select inner part of an assignment" },
            ["l="] = { query = "@assignment.lhs", desc = "Select left hand side of an assignment" },
            ["r="] = { query = "@assignment.rhs", desc = "Select right hand side of an assignment" },

            -- works for javascript/typescript files (custom capture I created in after/queries/ecma/textobjects.scm)
            ["a:"] = { query = "@property.outer", desc = "Select outer part of an object property" },
            ["i:"] = { query = "@property.inner", desc = "Select inner part of an object property" },
            ["l:"] = { query = "@property.lhs", desc = "Select left part of an object property" },
            ["r:"] = { query = "@property.rhs", desc = "Select right part of an object property" },

            ["aa"] = { query = "@parameter.outer", desc = "Select outer part of a parameter/argument" },
            ["ia"] = { query = "@parameter.inner", desc = "Select inner part of a parameter/argument" },

            ["ai"] = { query = "@conditional.outer", desc = "Select outer part of a conditional" },
            ["ii"] = { query = "@conditional.inner", desc = "Select inner part of a conditional" },

            ["al"] = { query = "@loop.outer", desc = "Select outer part of a loop" },
            ["il"] = { query = "@loop.inner", desc = "Select inner part of a loop" },

            ["af"] = { query = "@call.outer", desc = "Select outer part of a function call" },
            ["if"] = { query = "@call.inner", desc = "Select inner part of a function call" },

            ["am"] = {
              query = "@function.outer",
              desc = "Select outer part of a method/function definition",
            },
            ["im"] = {
              query = "@function.inner",
              desc = "Select inner part of a method/function definition",
            },

            ["ac"] = { query = "@class.outer", desc = "Select outer part of a class" },
            ["ic"] = { query = "@class.inner", desc = "Select inner part of a class" },
          },
        },
        swap = {
          enable = true,
          swap_next = {
            ["<leader>na"] = "@parameter.inner", -- swap parameters/argument with next
            ["<leader>n:"] = "@property.outer", -- swap object property with next
            ["<leader>nm"] = "@function.outer", -- swap function with next
          },
          swap_previous = {
            ["<leader>pa"] = "@parameter.inner", -- swap parameters/argument with prev
            ["<leader>p:"] = "@property.outer", -- swap object property with prev
            ["<leader>pm"] = "@function.outer", -- swap function with previous
          },
        },
        move = {
          enable = true,
          set_jumps = true, -- whether to set jumps in the jumplist
          goto_next_start = {
            ["]f"] = { query = "@call.outer", desc = "Next function call start" },
            ["]m"] = { query = "@function.outer", desc = "Next method/function def start" },
            ["]c"] = { query = "@class.outer", desc = "Next class start" },
            ["]i"] = { query = "@conditional.outer", desc = "Next conditional start" },
            ["]l"] = { query = "@loop.outer", desc = "Next loop start" },

            ["]s"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
            ["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
          },
          goto_next_end = {
            ["]F"] = { query = "@call.outer", desc = "Next function call end" },
            ["]M"] = { query = "@function.outer", desc = "Next method/function def end" },
            ["]C"] = { query = "@class.outer", desc = "Next class end" },
            ["]I"] = { query = "@conditional.outer", desc = "Next conditional end" },
            ["]L"] = { query = "@loop.outer", desc = "Next loop end" },
          },
          goto_previous_start = {
            ["[f"] = { query = "@call.outer", desc = "Prev function call start" },
            ["[m"] = { query = "@function.outer", desc = "Prev method/function def start" },
            ["[c"] = { query = "@class.outer", desc = "Prev class start" },
            ["[i"] = { query = "@conditional.outer", desc = "Prev conditional start" },
            ["[l"] = { query = "@loop.outer", desc = "Prev loop start" },
          },
          goto_previous_end = {
            ["[F"] = { query = "@call.outer", desc = "Prev function call end" },
            ["[M"] = { query = "@function.outer", desc = "Prev method/function def end" },
            ["[C"] = { query = "@class.outer", desc = "Prev class end" },
            ["[I"] = { query = "@conditional.outer", desc = "Prev conditional end" },
            ["[L"] = { query = "@loop.outer", desc = "Prev loop end" },
          },
        },
      },
    })

    local ts_repeat_move = require("nvim-treesitter.textobjects.repeatable_move")

    -- vim way: ; goes to the direction you were moving.
    vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move)
    vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_opposite)
  end,
}
```

Uscita con `:q` e rientro in Neovim con `nvim`

### Configurazione DevIcons e Mini Icons

Questi plugin aggiungono le icone per i file in Neovim.

Apri il file explorer con `<leader>ee`

Nella directory plugins aggiungere un nuovo file con `a` e chiamarlo `devicons.lua`

Aggiungere il seguente codice:

```lua
-- ICONE
return {
  "nvim-tree/nvim-web-devicons",
  config = function()
    require("nvim-web-devicons").setup({
      default = true,
      color_icons = true,
      strict = true,
      override_by_extension = {
        html = { icon = "", color = "#FFA500", cterm_color = "214", name = "Html" },
        css = { icon = "󰌜", color = "#61AFEF", cterm_color = "81", name = "Css" },
        scss = { icon = "", color = "#c6538c", cterm_color = "171", name = "Scss" },
        less = { icon = "", color = "#1d365d", cterm_color = "059", name = "Less" },
        js = { icon = "󰌞", color = "#F7DF1E", cterm_color = "226", name = "Js" },
        ts = { icon = "󰛦", color = "#3178C6", cterm_color = "039", name = "Ts" },
        md = { icon = "", color = "#f5f5f5", cterm_color = "252", name = "Markdown" },
      },
    })
  end,
}
```

Apri il file explorer con `<leader>ee`

Nella directory plugins aggiungere un nuovo file con `a` e chiamarlo `mini-icons.lua`

Aggiungere il seguente codice:

```lua
-- Per attivare le icone in which-key
return {
  "echasnovski/mini.icons",
  version = false,
  config = function()
    require("mini.icons").setup()
  end,
}
```

Uscita con `:q` e rientro in Neovim con `nvim`

### Configurazione Colorizer

Questo plugin mostra un'anteprima dei colori esadecimali direttamente nel codice.

Apri il file explorer con `<leader>ee`

Nella directory plugins aggiungere un nuovo file con `a` e chiamarlo `colorizer.lua`

Aggiungere il seguente codice:

```lua
-- preview dei colori
return {
  "norcalli/nvim-colorizer.lua",
  config = function()
    require("colorizer").setup({
      "*", -- Attiva per tutti i tipi di file
      css = { rgb_fn = true }, -- Attiva `rgb(...)` nel CSS
      html = { names = false }, -- Disattiva nomi dei colori in HTML
    })
  end,
}
```

Uscita con `:q` e rientro in Neovim con `nvim`

### Configurazione LSP Saga

LSP Saga fornisce un'interfaccia utente migliorata per le funzionalità LSP, come code actions, diagnostici, e navigazione.

Apri il file explorer con `<leader>ee`

Nella directory `plugins/lsp/` aggiungere un nuovo file con `a` e chiamarlo `lspsaga.lua`

Aggiungere il seguente codice:

```lua
return {
  "nvimdev/lspsaga.nvim",
  event = "LspAttach", -- Carica il plugin quando un server LSP si attacca
  dependencies = { "nvim-treesitter/nvim-treesitter" },
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
    })
  end,
}
```

Uscita con `:q` e rientro in Neovim con `nvim`

### Aggiornamento lazygit.lua

Aggiorniamo la configurazione di lazygit per includere le nuove funzionalità di cloning e init.

Navigare verso `lua/byhyons/plugins/lazygit.lua` e modificare il codice così:

```lua
return {
  "kdheepak/lazygit.nvim",
  cmd = {
    "LazyGit",
    "LazyGitConfig",
    "LazyGitCurrentFile",
    "LazyGitFilter",
    "LazyGitFilterCurrentFile",
  },
  -- optional for floating window border decoration
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  -- setting the keybinding for LazyGit with 'keys' is recommended in
  -- order to load the plugin when the command is run for the first time
  keys = {
    { "<leader>g", "", desc = " GitHub" },
    { "<leader>gg", "<cmd>LazyGit<cr>", desc = "Open lazy git" },
    { "<leader>gr", ":lua CreateGitHubRepo()<CR>", desc = "Create GitHub Repository" },
    { "<leader>gc", ":lua require('custom.clone-github').CloneRepoFromLink()<CR>", desc = "Clone Repository via Link" },
    {
      "<leader>gm",
      ":lua require('custom.clone-github').CloneRepoFromList()<CR>",
      desc = "Clone Repository from List",
    },
    {
      "<leader>gi",
      function()
        local output = vim.fn.system("git init " .. vim.fn.getcwd())
        print(output)
      end,
      desc = "Git Init",
    },
  },
}
```

Uscita con `:q` e rientro in Neovim con `nvim`

### Aggiornamento Telescope

Aggiorniamo la configurazione di Telescope per includere il file browser.

Navigare verso `lua/byhyons/plugins/telescope.lua` e modificare le dipendenze così:

```lua
return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "folke/todo-comments.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
  },
  -- ... resto della configurazione
}
```

E aggiungere la keymap per il file browser:

```lua
keymap.set("n", "<leader>fb", "<cmd>Telescope file_browser<cr>", { desc = "Find Browser" })
```

Uscita con `:q` e rientro in Neovim con `nvim`

---

## Keymaps

Ecco una panoramica delle principali scorciatoie da tastiera utilizzate in questa configurazione:

### Leader

| Tasto      | Funzione                         |
| ---------- | -------------------------------- |
| `<leader>` | Spazio - tasto leader principale |

### Navigazione File

| Tasto        | Funzione                          |
| ------------ | --------------------------------- |
| `<leader>ee` | Toggle NvimTree (file explorer)   |
| `<leader>ef` | Toggle NvimTree sul file corrente |
| `<leader>ec` | Collapse NvimTree                 |
| `<leader>er` | Refresh NvimTree                  |

### Ricerca (Telescope)

| Tasto        | Funzione                       |
| ------------ | ------------------------------ |
| `<leader>ff` | Trova file                     |
| `<leader>fr` | Trova file recenti             |
| `<leader>fs` | Trova stringa nel progetto     |
| `<leader>fc` | Trova stringa sotto il cursore |
| `<leader>ft` | Trova todo comments            |
| `<leader>fb` | File browser (Telescope)       |

### Git

| Tasto        | Funzione                                |
| ------------ | --------------------------------------- |
| `<leader>gg` | Apri LazyGit                            |
| `<leader>gr` | Crea repository GitHub                  |
| `<leader>gc` | Clona repository da link                |
| `<leader>gm` | Clona repository dalla tua lista GitHub |
| `<leader>gi` | Inizializza Git nel progetto            |

### Git (Gitsigns)

| Tasto        | Funzione                         |
| ------------ | -------------------------------- |
| `<leader>hs` | Stage hunk                       |
| `<leader>hr` | Reset hunk                       |
| `<leader>hS` | Stage buffer                     |
| `<leader>hR` | Reset buffer                     |
| `<leader>hp` | Preview hunk                     |
| `<leader>hb` | Blame line                       |
| `<leader>hB` | Toggle blame sulla riga corrente |
| `]h`         | Prossimo hunk                    |
| `[h`         | Hunk precedente                  |

### LSP

| Tasto        | Funzione                |
| ------------ | ----------------------- |
| `gd`         | Vai alle definizioni    |
| `gD`         | Vai alla dichiarazione  |
| `gR`         | Mostra riferimenti LSP  |
| `gi`         | Mostra implementazioni  |
| `gy`         | Mostra type definitions |
| `gI`         | Smart rename            |
| `gL`         | Diagnostici del buffer  |
| `gl`         | Diagnostici della riga  |
| `<leader>ca` | Code actions            |
| `K`          | Hover documentation     |
| `[d`         | Diagnostico precedente  |
| `]d`         | Prossimo diagnostico    |
| `<leader>ls` | Restart LSP             |

### Terminale (ToggleTerm)

| Tasto        | Funzione                             |
| ------------ | ------------------------------------ |
| `<leader>zt` | Terminale orizzontale                |
| `<leader>zf` | Terminale flottante                  |
| `<leader>zl` | Server Laravel (`php artisan serve`) |
| `<leader>zn` | Server Node (`npm run dev`)          |
| `<leader>zp` | Esegui file Python                   |
| `<leader>zb` | Browser Sync                         |
| `<leader>zx` | Esci dal terminale senza chiuderlo   |

### Window Management

| Tasto        | Funzione                |
| ------------ | ----------------------- |
| `<leader>sv` | Split verticale         |
| `<leader>sh` | Split orizzontale       |
| `<leader>se` | Equalizza split         |
| `<leader>sx` | Chiudi split            |
| `<leader>sm` | Maximize/minimize split |

### Tab

| Tasto        | Funzione                          |
| ------------ | --------------------------------- |
| `<leader>to` | Nuova tab                         |
| `<leader>tx` | Chiudi tab                        |
| `<leader>tn` | Prossima tab                      |
| `<leader>tp` | Tab precedente                    |
| `<leader>tf` | Apri buffer corrente in nuova tab |

### Varie

| Tasto        | Funzione                                |
| ------------ | --------------------------------------- |
| `<leader>nh` | Clear search highlights                 |
| `<leader>+`  | Incrementa numero                       |
| `<leader>-`  | Decrementa numero                       |
| `<leader>aN` | Esporta file Neorg                      |
| `jk`         | Esci da insert mode                     |
| `s`          | Substitute (con plugin substitute.nvim) |

### Flash.nvim

| Tasto | Funzione          |
| ----- | ----------------- |
| `\s`  | Flash jump        |
| `\S`  | Flash Treesitter  |
| `\r`  | Remote Flash      |
| `\R`  | Treesitter Search |

---

#### FINITO! 🚀

# NEOVIM ❤️

> [!NOTE]
>
> repo: neovim

Il mio parere su Neovim?
Amore a prima vista...

## La mia impostazione e setting di nvim:

### Aprire una finestra del terminale

Aprire una finestra del terminale sul Mac, va bene qualsiasi:
terminale, Alacritty, iTerm2 oppore WezTerm (quello che uso io)...

### Installare Homebrew

Esegui il seguente comando:

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Se necessario, quando richiesto, inserisci la password.
Se non è stato installato XCode Command Line Tools, quando richiesto, premere Invio e homebrew installerà anche questo.

### Aggiungi il percorso solo Apple Macbook Silicon

Eseguire i seguenti due comandi per farlo:

```
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"
```

### Installare WezTerm se necessario

Se non si dispone di un terminale con la possibilità di personalizzare i colori, installare WezTerm oppore iTerm2 con homebrew:

Per WezTerm eseguire il seguente comando:

```
brew install --cask wezterm
```

Per iTerm2 eseguire il seguente comando:

```
brew install --cask iterm2
```

Quindi passare a questo terminale.

### Installare un font Nerd

Io uso `Meslo Nerd Font`.

Per installarlo fare:

```
brew tap homebrew/cask-fonts
```

E poi lo fare:

```
brew install font-meslo-lg-nerd-font
```

### Installare Neovim

Eseguire:

```
brew install neovim
```

### Installare Ripgrep

Eseguire:

```
brew install ripgrep
```

### Installare node

Eseguire:

```
brew install node
```

### Setup della Struttura iniziale dei file

La configurazione sarà localizzata in `~/.config/nvim`.

Configurare la struttura iniziale del file con i seguenti comandi:

Crea la directory di configurazione nvim.

```
mkdir -p ~/.config/nvim
```

`-p` Viene utilizzato anche per creare directory genitori se non esistono già

Spostarsi in questa directory:

```
cd ~/.config/nvim
```

Creare il file principale `init.lua`:

```
touch init.lua
```

Creazione di una directory di amministrazione `lua/byhyons/core`:

_Ogni volta che uso “byhyons” puoi sostituirlo con il tuo nome._

```
mkdir -p lua/byhyons/core
```

Creare una directory plugin (avrà tutte le configurazioni/specs del plugin):

```
mkdir -p lua/byhyons/plugins
```

Creazione del file `lazy.lua` (sarà utilizzato per configurare il gestore del plugin lazy.nvim):

```
touch lua/byhyons/lazy.lua
```

### Impostare le opzioni di base

Assicurati di essere in `~/.config/nvim` apri la configurazione:

`nvim .`

Passare alla cartella principale e premere `%` per creare un file e chiamarlo: `options.lua`

In questo file aggiungi:

```
vim.cmd("let g:netrw_liststyle = 3")
```

Aprire l'esploratore con :Explore e navigare verso il file principale `init.lua`.

Aggiungere le seguenti opzioni per caricare le opzioni di base all'avvio:

```
require("byhyons.core.options")
```

Chiudere Neovim con `:w` e riaprirlo con `nvim .`

Torna indietro a `options.lua` e aggiungi quanto segue per impostare il resto delle opzioni:

```
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

```
require("byhyons.core.options")
```

Aprire l'esploratore con `:Explore` andare al file principale `init.lua` e modificare require in:

```
require("byhyons.core")
```

### Imposta core keymaps

Fare `:e lua/byhyons/core/keymaps.lua`

E aggiungere quanto segue a questo file:

```
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

```
require("byhyons.core.options")
require("byhyons.core.keymaps")
```

Uscita con `:q` e rientra in Neovim con `nvim .`

### Configurazione lazy.nvim

Vai a `lazy.lua` e aggiungi l'inizianizzazione di `lazy.nvim`

```
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

```
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

```
require("byhyons.core")
require("byhyons.lazy")
```

Uscita con `:q` e rientro in Neovim con `nvim`

Ora è possibile vedere l'interfaccia di `lazy.nvim` digitando il comando `:Lazy` e puoi chiuderla con `q`

### Installare la navigazione plenaria & vim-tmux-navigator

Fare `:e lua/byhyons/plugins/init.lua`

Aggiungere quanto segue per installare il navigatore della plenaria e il `vim-tmux-navigatore`:

```
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

```
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

```
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

```
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

```
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

```
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

```
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

```
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

```
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

```
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

```
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

```
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

```
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

```
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

```
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

```
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

```
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

```
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

```
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

```
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

```
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

```
return {
"kylechui/nvim-surround",
event = { "BufReadPre", "BufNewFile" },
version = "\*", -- Use for stability; omit to use `main` branch for the latest features
config = true,
}
```

Uscita con `:q` e rientro in Neovim con `nvim`

### Configurazione di LSP

Apri il file explorer con `<leader>ee`

Nella directory `lua/byhyons/plugins` aggiungere una nuova directory con `a`, chiamarlo `lsp/`

Navigare verso `lazy.lua` e modificarlo in modo che `lazy.nvim` riconosca il nuovo elenco `lsp`. Modificarlo così:

```
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

### Configurazione mason.nvim

`mason.nvim` è utilizzato per installare e gestire tutti i server linguistici necessari per i linguaggi che ci servono.

Apri il file explorer con `<leader>ee`

Nella directory `plugins/lsp` aggiungere un nuovo file con `a` e chiamarlo `mason.lua`

Aggiungere il seguente codice:

```
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
        "pylint", -- python linter
        "eslint_d", -- js linter
        "blade-formatter", -- Aggiungi blade-formatter qui
      },
    })
  end,
}
```

### Configurazione nvim-lspconfig

`nvim-lspconfig` viene utilizzato per configurare i server dei linguaggi.

Apri il file explorer con `<leader>ee`

Nella directory `plugins/lsp` aggiungere un nuovo file con `a` e chiamalo `lspconfig.lua`

Aggiungere il seguente codice:

```
return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
    { "folke/neodev.nvim", opts = {} },
  },
  config = function()
    -- import lspconfig plugin
    local lspconfig = require("lspconfig")

    -- import mason_lspconfig plugin
    local mason_lspconfig = require("mason-lspconfig")

    -- import cmp-nvim-lsp plugin
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    local keymap = vim.keymap -- for conciseness

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf, silent = true }

        -- set keybinds
        opts.desc = "Show LSP references"
        keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

        opts.desc = "Go to declaration"
        keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

        opts.desc = "Show LSP definitions"
        keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

        opts.desc = "Show LSP implementations"
        keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

        opts.desc = "Show LSP type definitions"
        keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

        opts.desc = "See available code actions"
        keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

        opts.desc = "Smart rename"
        keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

        opts.desc = "Show buffer diagnostics"
        keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

        opts.desc = "Show line diagnostics"
        keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

        opts.desc = "Go to previous diagnostic"
        keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

        opts.desc = "Go to next diagnostic"
        keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

        opts.desc = "Show documentation for what is under cursor"
        keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

        opts.desc = "Restart LSP"
        keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
      end,
    })

    -- used to enable autocompletion (assign to every lsp server config)
    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- Change the Diagnostic symbols in the sign column (gutter)
    -- (not in youtube nvim video)
    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    mason_lspconfig.setup_handlers({
      -- default handler for installed servers
      function(server_name)
        lspconfig[server_name].setup({
          capabilities = capabilities,
        })
      end,
      ["svelte"] = function()
        -- configure svelte server
        lspconfig["svelte"].setup({
          capabilities = capabilities,
          on_attach = function(client, bufnr)
            vim.api.nvim_create_autocmd("BufWritePost", {
              pattern = { "*.js", "*.ts" },
              callback = function(ctx)
                -- Here use ctx.match instead of ctx.file
                client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.match })
              end,
            })
          end,
        })
      end,
      ["graphql"] = function()
        -- configure graphql language server
        lspconfig["graphql"].setup({
          capabilities = capabilities,
          filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
        })
      end,
      ["emmet_ls"] = function()
        -- configure emmet language server
        lspconfig["emmet_ls"].setup({
          capabilities = capabilities,
          filetypes = {
            "html",
            "typescriptreact",
            "javascriptreact",
            "css",
            "sass",
            "scss",
            "less",
            "svelte",
            "blade",
          },
        })
      end,
      ["lua_ls"] = function()
        -- configure lua server (with special settings)
        lspconfig["lua_ls"].setup({
          capabilities = capabilities,
          settings = {
            Lua = {
              -- make the language server recognize "vim" global
              diagnostics = {
                globals = { "vim" },
                disable = { "missing-fields" }, -- Disabilita il warning per i campi mancanti
              },
              completion = {
                callSnippet = "Replace",
              },
            },
          },
        })
      end,
      ["vetur-vls"] = function()
        lspconfig["vuels"].setup({
          filetypes = { "vue" },
          settings = {
            vetur = {
              completion = { autoImport = true },
              useWorkspaceDependencies = true,
              validation = {
                template = true,
                script = true,
                style = true,
                templateProps = true,
              },
            },
          },
        })
      end,
      -- Configurazione Laravel:
      ["html"] = function()
        lspconfig["html"].setup({
          capabilities = capabilities,
          filetypes = { "html", "blade" }, -- Includi blade qui
        })
      end,
      ["intelephense"] = function()
        lspconfig["intelephense"].setup({
          capabilities = capabilities,
          settings = {
            intelephense = {
              files = {
                maxSize = 5000000, -- Aumenta la dimensione massima del file se necessario
              },
              environment = {
                shortOpenTag = true,
              },
            },
          },
        })
      end,
      ["phpactor"] = function()
        lspconfig["phpactor"].setup({
          capabilities = capabilities,
        })
      end,
    })
  end,
}
```

Nel codice sotto `mason_lspconfig.setup_handlers` ho configurato i miei linguaggi che utilizzo. Si possono fare configurazioni personalizzate a seconda dei linguaggi che verranno usati.

Navigare verso `nvim-cmp.lua` e fare la seguente modifica per aggiungere `lsp` come fonte di completamento:

```
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

        --- modifica qui:
        { name = "nvim_lsp"},
        --- fino a qui

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

### Installazione di trouble.nvim

Questo è un altro plugin che aggiunge alcune belle funzionalità per interagire con lsp e alcune altre cose come i commenti todo.

Apri il file explorer con `<leader>ee`

Nella directory plugins aggiungere un nuovo file con `a` e chiamarlo `trouble.lua`

Aggiungere il seguente codice:

```
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

```
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

```
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

```
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

```
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

```
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

```
brew install jesseduffield/lazygit/lazygit
```

Aprire Neovim con `nvim .`

Nella directory plugins aggiungere un nuovo file con `a` e chiamarlo `lazygit.lua`

Aggiungere il seguente codice:

```
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

```
brew install gh
```

Dopo l'installazione dobbiamo autenticarci, per farlo eseguire il comando:

```
gh auth login
```

Seguire le istruzioni per l'autenticazione.

Spostarsi nella directory `nvim/lua` con il `a` creare una nuova directory e chiamarla `custom/`

Nella directory `nvim/lua/custom/` aggiungere un nuovo file con `a` e chiamarlo `github.lua`

Aggiungere il seguente codice:

```
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

```
npm install -g browser-sync
```

dobbiamo aggiungere un file nella directory plugins con `a` e chiamarlo `togglerterm.lua`
la mia configurazione prevede anche la possibilità di aprire più terminali, anche flottanti, con comandi per aprire server come quello di Laravel o di Node.

Aggiungere il seguente codice:

```

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

#### FINITO! 🚀

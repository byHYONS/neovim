-- Tree Window
return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  config = function()
    -- Impedisce il caricamento di netrw
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    local nvimtree = require("nvim-tree")

    nvimtree.setup({
      -- Impostazioni della vista
      view = {
        width = 40,
        relativenumber = true,
      },
      -- Renderer per cambiare le icone delle cartelle
      renderer = {
        indent_markers = {
          enable = true,
        },
        icons = {
          webdev_colors = true, -- Usa i colori webdev
          show = {
            file = true,
            folder = true,
            folder_arrow = true,
            git = true,
          },
          glyphs = {
            default = "", -- icona per file generici
            symlink = "",
            folder = {
              arrow_closed = "", -- icona per le cartelle chiuse
              arrow_open = "", -- icona per le cartelle aperte
              default = "", -- icona di default per le cartelle
              open = "",
              empty = "",
              empty_open = "",
              symlink = "",
              symlink_open = "",
            },
            git = {
              unstaged = "✗",
              staged = "✓",
              unmerged = "",
              renamed = "",
              untracked = "", --        ★ ➜ ◌
              deleted = "",
              ignored = "",
            },
          },
        },
      },
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
      -- Definizione della funzione on_attach
      on_attach = function(bufnr)
        -- Richiede l'API all'interno di on_attach
        local api = require("nvim-tree.api")

        -- Funzione per impostare le opzioni delle keymap
        local function opts(desc)
          return {
            desc = "nvim-tree: " .. desc,
            buffer = bufnr,
            noremap = true,
            silent = true,
            nowait = true,
          }
        end

        -- Keymap standard di NvimTree: a, d, r, x, c, p, y, ecc.
        require("nvim-tree.api").map.on_attach.default(bufnr)

        -- Mappature personalizzate
        vim.keymap.set("n", "<CR>", api.node.open.edit, opts("Apri file (stessa finestra)"))
        vim.keymap.set("n", "s", api.node.open.horizontal, opts("Apri file in split orizzontale"))
        vim.keymap.set("n", "S", api.node.open.vertical, opts("Apri file in split verticale"))
        vim.keymap.set("n", "t", api.node.open.tab, opts("Apri file in nuova tab"))
        vim.keymap.set("n", "<BS>", api.node.navigate.parent_close, opts("Vai alla cartella superiore"))
        vim.keymap.set("n", "<Tab>", api.node.open.preview, opts("Apri in anteprima"))
        vim.keymap.set("n", "<2-LeftMouse>", api.node.open.edit, opts("Apri file con doppio click"))
      end,
    })

    --  Colori per le icone Git
    vim.api.nvim_set_hl(0, "NvimTreeGitDeleted", { fg = "#F20587" })
    vim.api.nvim_set_hl(0, "NvimTreeGitNew", { fg = "#00A89D" })
    vim.api.nvim_set_hl(0, "NvimTreeGitDirty", { fg = "#FF8C00" })
    -- Alcuni gruppi Git colorano già le icone,

    -- altri richiedono esplicitamente il gruppo Icon.
    vim.api.nvim_set_hl(0, "NvimTreeGitStagedIcon", { fg = "#A8FFB3" })
    vim.api.nvim_set_hl(0, "NvimTreeGitRenamedIcon", { fg = "#FFD847" })
    vim.api.nvim_set_hl(0, "NvimTreeGitUntrackedIcon", { fg = "#9571ED" })
    vim.api.nvim_set_hl(0, "NvimTreeGitIgnoredIcon", { fg = "#800080" })
  end,
}

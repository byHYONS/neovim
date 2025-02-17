return {
  "nvim-tree/nvim-tree.lua",
  dependencies = "nvim-tree/nvim-web-devicons",
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
              renamed = "➜",
              untracked = "★",
              deleted = "",
              ignored = "◌",
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

        -- Applica le mappature di default di nvim-tree
        api.config.mappings.default_on_attach(bufnr)

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
    vim.api.nvim_set_hl(0, "NvimTreeGitDeleted", { fg = "#E52E2E" })
    vim.api.nvim_set_hl(0, "NvimTreeGitNew", { fg = "#44FFB1" })
    vim.api.nvim_set_hl(0, "NvimTreeGitDirty", { fg = "#F09837" })
    vim.api.nvim_set_hl(0, "NvimTreeGitStaged", { fg = "#77C0FC" })
    vim.api.nvim_set_hl(0, "NvimTreeGitRenamed", { fg = "#FFD847" })
    vim.api.nvim_set_hl(0, "NvimTreeGitUntracked", { fg = "#9571ED" })
    vim.api.nvim_set_hl(0, "NvimTreeGitIgnored", { fg = "#800080" })

    -- Imposta le keymaps globali
    local keymap = vim.keymap -- per maggiore concisione

    keymap.set("n", "<leader>e", "", { desc = " Tree Window" })
    keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" }) -- toggle file explorer
    keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file explorer on current file" }) -- toggle file explorer on current file
    keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" }) -- collapse file explorer
    keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" }) -- refresh file explorer
  end,
}

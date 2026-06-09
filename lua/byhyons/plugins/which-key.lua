-- Popup menu
return {
  "folke/which-key.nvim",
  version = "*",
  event = "VeryLazy",

  config = function()
    -- ##########################################
    --      MONKEY PATCH • Footer WhichKey
    --  =======================================
    --     Modifica il footer in memoria.
    --   NON modifica alcun file del plugin.
    --     Compatibile con Lazy update.
    --     Testata con WhichKey v3.17.0
    -- #########################################
    local Win = require("which-key.win")

    if not rawget(Win, "__byhyons_footer_patch") then
      rawset(Win, "__byhyons_footer_patch", true)

      local original_show = Win.show

      Win.show = function(self, opts)
        if opts and opts.relative == "win" and opts.height == 1 and opts.zindex then
          opts.col = 0.8
          opts.row = opts.row - 1
          opts.border = "single"
          opts.style = "minimal"
        end

        return original_show(self, opts)
      end
    end
    -- ==============================
    --           PATCH END
    -- ==============================

    -- Configurazione
    vim.api.nvim_set_hl(0, "WhichKeyTitle", {
      fg = "#24EAF7",
      bg = "#394263",
      bold = true,
    })

    vim.api.nvim_set_hl(0, "WhichKey", {
      fg = "#C796FF",
      bold = true,
    })

    vim.api.nvim_set_hl(0, "WhichKeyGroup", {
      fg = "#8DD3FA",
      bold = true,
    })

    vim.api.nvim_set_hl(0, "WhichKeyDesc", {
      fg = "#77C0FC",
    })

    vim.api.nvim_set_hl(0, "WhichKeySeparator", {
      fg = "#9399b2",
    })

    require("which-key").setup({
      preset = "helix",
      show_help = true,
      delay = 750,

      icons = {
        mappings = true,
        colors = true,
        breadcrumb = "» ",
        separator = "➜ ",
        group = "",
      },

      plugins = {
        spelling = {
          enabled = false,
        },
      },

      win = {
        border = "rounded",
        padding = { 1, 2 },
        title = true,
        title_pos = "center",
        height = {
          max = math.huge,
        },
        wo = {
          winblend = 0,
        },
      },

      layout = {
        spacing = 5,
        align = "center",
      },

      spec = {
        {
          mode = { "n", "v" },

          { "<leader>a", group = "Menu Nvim UI", icon = { icon = "󰒓", color = "orange" } },
          { "<leader>c", group = "AI - Copilot" },
          { "<leader>d", group = "Debugger" },
          { "<leader>e", group = "Tree Window" },
          { "<leader>f", group = "Search Telescope" },
          { "<leader>g", group = "GitHub", icon = { icon = "", color = "gray" } },
          { "<leader>h", group = "Git View" },
          { "<leader>i", group = "Code Info" },
          { "<leader>k", group = "Test API" },
          { "<leader>l", group = "Lazy LSP" },
          { "<leader>m", group = "DataBase" },
          { "<leader>r", group = "Formatting" },
          { "<leader>s", group = "Search FZF" },
          { "<leader>t", group = "Code Tools", icon = { icon = "󱡠", color = "yellow" } },
          { "<leader>w", group = "Session" },
          { "<leader>x", group = "Diagnostics" },
          { "<leader>z", group = "Terminal" },
          { "<leader>?", group = "Buffer Local Keymaps", icon = { icon = "󱕴", color = "cyan" } },
          { "<leader>rr", group = "CSS px/rem" },
          { "<leader>tl", group = "Laravel Tools" },

          { "[", group = "Prev" },
          { "]", group = "Next" },
          { "\\", group = "Other" },
          { "|", group = "Tab Jamp" },
          { "'", group = "Marks" },
          { '"', group = "Registers" },
          { "!", group = "Run Program" },
          { "v", group = "Visual" },
          { "g", group = "Goto" },
          { "z", group = "Folder" },
        },
      },
    })
  end,

  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
    },
  },
}

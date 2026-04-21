-- Popup menu
return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    preset = "helix",
    delay = 500,
    icons = {
      mappings = true,
      colors = true,
      breadcrumb = " ",
      separator = "󱦰  ",
    },
    plugins = {
      spelling = {
        enabled = false,
      },
    },
    win = {
      height = {
        -- max = math.huge,
      },
    },

    layout = {
      spacing = 5, -- spazio tra gruppi di tasti
      align = "center", -- può essere left, center, none
    },

    spec = {
      {
        mode = { "n", "v" },
        { "v", group = " Visual" },
        { "<leader>a", group = " Menu Nvim UI " },
        { "<leader>c", group = " AI Copilot Chat" },
        { "<leader>d", group = " Debug" },
        { "<leader>e", group = " Tree Window" },
        { "<leader>f", group = " Search Telescope" },
        { "<leader>g", group = " GitHub" },
        { "<leader>h", group = " Git View" },
        { "<leader>i", group = " Code Info" },
        { "<leader>k", group = " Test API" },
        { "<leader>l", group = " Lazy LSP" },
        { "<leader>m", group = " DataBase" },
        { "<leader>r", group = " Formatting" },
        { "<leader>s", group = " Search FZF" },
        { "<leader>t", group = " Code Tools" },
        { "<leader>w", group = " Session" },
        { "<leader>x", group = " Diagnostics" },
        { "[", group = " Prev" },
        { "]", group = " Next" },
        { "\\", group = " Other" },
        { "'", group = " Marks" },
        { '"', group = " Registers" },
        { "!", group = " Run Program" },
        { "g", group = " Goto" },
        { "z", group = " Folder" },
      },
    },
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
}

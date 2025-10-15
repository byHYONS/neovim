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

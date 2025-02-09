return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")
    local lazy_status = require("lazy.status") -- to configure lazy pending updates count

    local colors = {
      blue = "#8DD3FA",
      green = "#3EFFDC",
      violet = "#FF61EF",
      yellow = "#FFD847",
      red = "#E52E2E",
      fg = "#ADFF2F",
      fg_inactive = "#FF9E64",
      bg = "#112638",
      inactive_bg = "#2C3043",
    }

    local my_lualine_theme = {
      normal = {
        a = { bg = colors.blue, fg = colors.bg, gui = "bold" },
        b = { bg = colors.bg, fg = colors.blue },
        c = { bg = colors.bg, fg = colors.fg },
      },
      insert = {
        a = { bg = colors.green, fg = colors.bg, gui = "bold" },
        b = { bg = colors.bg, fg = colors.green },
        c = { bg = colors.bg, fg = colors.fg },
      },
      visual = {
        a = { bg = colors.violet, fg = colors.bg, gui = "bold" },
        b = { bg = colors.bg, fg = colors.violet },
        c = { bg = colors.bg, fg = colors.fg },
      },
      command = {
        a = { bg = colors.yellow, fg = colors.bg, gui = "bold" },
        b = { bg = colors.bg, fg = colors.yellow },
        c = { bg = colors.bg, fg = colors.fg },
      },
      replace = {
        a = { bg = colors.red, fg = colors.bg, gui = "bold" },
        b = { bg = colors.bg, fg = colors.red },
        c = { bg = colors.bg, fg = colors.fg },
      },
      inactive = {
        a = { bg = colors.inactive_bg, fg = colors.fg_inactive, gui = "bold" },
        b = { bg = colors.inactive_bg, fg = colors.fg_inactive },
        c = { bg = colors.inactive_bg, fg = colors.fg_inactive },
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
            color = { fg = "#FF9E64" },
          },
          { "filesize" },
          {
            "location",
            color = { bg = "#6A48A3", fg = "#FFFFFF", gui = "bold" },
            separator = { left = "" },
          },
          {
            "fileformat",
            symbols = {
              unix = "", -- Mostra l'icona Apple per macOS
            },
            color = { fg = "#002B3A", bg = "#FFFFFF" },
            separator = { left = "", right = "" },
          },
          {
            "filetype",
            color = { bg = "#112638", fg = "#E9DEF2" },
          },
        },
      },
    })
  end,
}

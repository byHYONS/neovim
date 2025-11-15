return {
  "nvim-lualine/lualine.nvim",
  config = function()
    local lualine = require("lualine")
    local lazy_status = require("lazy.status") -- to configure lazy pending updates count

    local colors = {
      blue = "#8DD3FA",
      green = "#B7E880",
      violet = "#C796FF",
      purple = "#9571ED",
      yellow = "#FFC569",
      red = "#FF6B7C",
      fg = "#ADFF2F",
      fg_inactive = "#FF9E64",
      bg = "#1E2031",
      inactive_bg = "#2C3043",
      alternative_fg = "#E9DEF2",
      alternative_bg = "#394263",
      package = "#FF77FF",
    }

    local function mode_color()
      local m = vim.api.nvim_get_mode().mode
      if m:find("^n") then
        return colors.blue
      end
      if m:find("^i") then
        return colors.green
      end
      if m:find("^[vV]") or m == "\22" then
        return colors.violet
      end
      if m:find("^R") then
        return colors.red
      end
      if m:find("^c") then
        return colors.yellow
      end
      if m:find("^t") then
        return colors.purple
      end
      return colors.blue
    end

    local my_lualine_theme = {
      normal = {
        a = { bg = colors.blue, fg = colors.bg, gui = "bold" },
        b = { bg = colors.bg, fg = colors.blue },
        c = { bg = colors.bg, fg = colors.blue },
      },
      insert = {
        a = { bg = colors.green, fg = colors.bg, gui = "bold" },
        b = { bg = colors.bg, fg = colors.green },
        c = { bg = colors.bg, fg = colors.green },
      },
      visual = {
        a = { bg = colors.violet, fg = colors.bg, gui = "bold" },
        b = { bg = colors.bg, fg = colors.violet },
        c = { bg = colors.bg, fg = colors.violet },
      },
      command = {
        a = { bg = colors.yellow, fg = colors.bg, gui = "bold" },
        b = { bg = colors.bg, fg = colors.yellow },
        c = { bg = colors.bg, fg = colors.yellow },
      },
      replace = {
        a = { bg = colors.red, fg = colors.bg, gui = "bold" },
        b = { bg = colors.bg, fg = colors.red },
        c = { bg = colors.bg, fg = colors.red },
      },
      terminal = {
        a = { bg = colors.purple, fg = colors.bg, gui = "bold" },
        b = { bg = colors.bg, fg = colors.purple },
        c = { bg = colors.bg, fg = colors.purple },
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
        lualine_c = {
          {
            "filename",
            path = 0, -- 0 = solo nome (1 = relativo, 2 = assoluto, 3 = nome + cartella padre)
            symbols = {
              modified = " ●",
              readonly = " ",
              unnamed = "[No Name]",
            },
            color = function()
              if vim.bo.modified then
                return { fg = colors.fg_inactive, gui = "italic" }
              else
                return { fg = colors.fg, gui = "bold" }
              end
            end,
          },
        },
        lualine_x = {
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
            color = { fg = colors.package },
          },
          { "filesize" },
          {
            "encoding",
            color = function()
              return { bg = colors.alternative_bg, fg = mode_color(), gui = "bold" }
            end,
            separator = { left = "" },
          },
          {
            "fileformat",
            symbols = {
              unix = "",
            },
            color = function()
              return { fg = colors.inactive_bg, bg = mode_color() }
            end,
            separator = { left = "", right = "" },
          },
          {
            "filetype",
            color = { bg = colors.bg, fg = colors.alternative_fg, gui = "bold" },
          },
        },
      },
    })
  end,
}

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

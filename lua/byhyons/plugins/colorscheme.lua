return {
  "folke/tokyonight.nvim",
  priority = 1000,
  config = function()
    local fg = "#E9DEF2"
    local bg_search = "#335533"
    local fg_visual = "#424242"
    local bg_visual = "#F8DDEA"
    local border_bar = "#F09837"
    -- local bg_visual = "#334477"

    require("tokyonight").setup({
      style = "night",

      on_colors = function(colors)
        colors.fg = fg -- Colore del testo principale
        colors.bg_search = bg_search -- Background per la ricerca
        --     colors.bg_visual = bg_visual -- Background per la modalità visual
      end,

      on_highlights = function(hl)
        hl.Visual = {
          fg = fg_visual,
          bg = bg_visual,
        }
        hl.PmenuThumb = { bg = border_bar }
      end,
    })

    vim.opt.pumblend = 10
    vim.opt.winblend = 10

    vim.cmd("colorscheme tokyonight")
  end,
}

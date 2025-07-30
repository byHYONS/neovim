return {
  "folke/tokyonight.nvim",
  priority = 1000,
  config = function()
    local transparent = true -- set to true if you would like to enable transparency

    local bg = "#011628"
    local bg_dark = "#011423"
    local bg_highlight = "#143652"
    local bg_search = "#335533"
    local bg_visual = "#334477"
    local fg = "#E9DEF2"
    local fg_dark = "#B4D0E9"
    local fg_gutter = "#ADFF2F"
    local border = "#547998"
    local cursorline_bg = "#022039" -- Colore leggermente più chiaro del background
    local border_bar = "#F09837"
    local popup_border = "#009BB2"
    local cl_opz = "#44FFB1"
    local lbl_inactive = "#214969"
    local lbl_active = "#CDD6F4"
    local border_error = "#E52E2E"
    local border_debug = "#A277FF"
    local border_trace = "#800080"

    require("tokyonight").setup({
      style = "night",
      transparent = transparent,
      styles = {
        sidebars = transparent and "transparent" or "dark",
        floats = transparent and "transparent" or "dark",
      },
      on_colors = function(colors)
        -- colors.bg_dark = transparent and colors.none or bg_dark -- Background secondario per elementi come sidebar, statusline o elementi “in profondità”
        colors.bg = bg -- Background principale
        colors.bg_dark = bg_dark -- Background secondario per elementi come sidebar, statusline o elementi “in profondità”
        colors.bg_float = bg_dark -- Background delle finestre galleggianti
        colors.bg_highlight = bg_highlight -- Background per evidenziazione (es.: evidenziazioni di testo selezionato o di ricerca)
        colors.bg_popup = bg_dark -- Background per i popup
        colors.bg_search = bg_search -- Background per la ricerca
        colors.bg_sidebar = transparent and "none" or bg_dark -- Background per le sidebar (pannelli laterali)
        colors.bg_statusline = transparent and "none" or bg_dark -- Background della statusline
        colors.bg_visual = bg_visual -- Background per la modalità visual
        colors.border = border -- Colore dei bordi
        colors.fg = fg -- Colore del testo principale
        colors.fg_dark = fg_dark -- Versione più scura del testo, usata per elementi secondari
        colors.fg_float = fg -- Colore del testo nelle finestre galleggianti
        colors.fg_gutter = fg_gutter -- Colore dei numeri di riga o del gutter
        colors.fg_sidebar = fg_dark -- Colore del testo nelle sidebar
      end,
      on_highlights = function(hl)
        hl.CursorLine = { bg = cursorline_bg } -- Imposta lo sfondo della cursorline
        hl.PmenuThumb = { bg = border_bar } -- Colore barra di scorrimento
        hl.FloatBorder = { bg = bg_dark, fg = popup_border } -- Colore dei bordi
        hl.PmenuSbar = { bg = cursorline_bg } -- Sfondo barra di scorrimento
        hl.IndentBlanklineChar = { fg = lbl_inactive }
        hl.IndentBlanklineContextChar = { fg = lbl_active }
        hl.VertSplit = { fg = cl_opz } --WARN: Colore separatore ??
        hl.PmenuSel = { bg = bg_highlight, fg = fg_dark } --WARN: Elemento selezionato ??

        if transparent then
          hl.NoiceCmdlinePopup = { bg = bg_dark }
          hl.NoiceCmdlinePopupBorder = { fg = cl_opz }
          hl.NoiceSearchBorder = { fg = border_bar }

          hl.NotifyINFOBody = { bg = bg_dark }
          hl.NotifyWARNBody = { bg = bg_dark }
          hl.NotifyERRORBody = { bg = bg_dark }
          hl.NotifyDEBUGBody = { bg = bg_dark }
          hl.NotifyTRACEBody = { bg = bg_dark }

          hl.NotifyINFOBorder = { bg = bg_dark, fg = popup_border }
          hl.NotifyWARNBorder = { bg = bg_dark, fg = border_bar }
          hl.NotifyERRORBorder = { bg = bg_dark, fg = border_error }
          hl.NotifyDEBUGBorder = { bg = bg_dark, fg = border_debug }
          hl.NotifyTRACEBorder = { bg = bg_dark, fg = border_trace }

          hl.NormalFloat = { bg = bg_dark, fg = fg }
          hl.TelescopeNormal = { bg = "none" }
          hl.TelescopeBorder = { bg = "none", fg = popup_border }
          hl.FloatShadow = { bg = bg_dark }

          hl.WhichKeyGroup = { fg = fg_gutter }
          hl.WhichKeyDesc = { fg = fg_dark }
          hl.WhichKeySeparator = { fg = popup_border }
          hl.Folded = { bg = bg_visual, fg = border }
        end

        vim.opt.pumblend = 10
        vim.opt.winblend = 10
      end,
    })

    vim.cmd("colorscheme tokyonight")
  end,
}

local M = {}

M.setup = function()
  -- Definisco i colori personalizzati per il popup
  vim.cmd([[
    highlight Pmenu guibg=#001424 guifg=#ffffff  " Sfondo del popup
    highlight PmenuSel guibg=#013754 guifg=#ffffff  " Elemento selezionato
    highlight FloatBorder guifg=#009BB2 guibg=#001424 " Bordi arrotondati per il popup con colore della cornice
    highlight VertSplit guifg=#FFFFFF  " Colore del separatore
    highlight PmenuThumb guibg=#F09837  " Colore della barra di scorrimento
    highlight PmenuSbar guibg=#001424  " Sfondo della barra di scorrimento
  ]])

  -- Aggiungo trasparenza e padding al popup
  vim.opt.pumblend = 10 -- Livello di trasparenza
  vim.opt.winblend = 10 -- Trasparenza per le finestre galleggianti
end

return M

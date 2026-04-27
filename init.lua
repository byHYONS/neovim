-- =============================================
-- -- Configurazione Neovim
-- =============================================

require("byhyons.core")
require("byhyons.lazy")
-- gestione colori sintassi:
require("configs.highlight").setup()
-- gestione keymaps:
require("configs.keymaps").setup()
-- Rileva il tipo di file e applica configurazioni specifiche
require("configs.filetype")

require("custom.github")

require("custom.neorg-exporter")

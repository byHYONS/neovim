require("byhyons.core")
require("byhyons.lazy")
-- gestione colori sintassi:
require("byhyons.highlight").setup()
-- Carica gli highlight del popup
require("byhyons.popup-highlight").setup()

require("byhyons.keymaps").setup()

require("filetype")

require("custom.github")
vim.api.nvim_set_keymap("n", "<leader>lr", ":lua CreateGitHubRepo()<CR>", { noremap = true, silent = true })

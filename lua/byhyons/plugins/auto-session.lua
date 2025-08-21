return {
  "rmagatti/auto-session",
  version = "*",
  config = function()
    local auto_session = require("auto-session")

    auto_session.setup({
      auto_restore_enabled = false,
      auto_session_suppress_dirs = { "~/", "~/Dev/", "~/Downloads", "~/Documents", "~/Desktop/" },
      session_lens = {
        buftypes_to_ignore = {},
        load_on_setup = true,
        theme_conf = { border = true },
        previewer = false,
      },
    })

    local keymap = vim.keymap

    keymap.set("n", "<leader>w", "", { desc = " Session" })
    keymap.set("n", "<leader>wr", "<cmd>SessionRestore<CR>", { desc = "Restore Session" }) -- restore last workspace session for current directory
    keymap.set("n", "<leader>ws", "<cmd>SessionSave<CR>", { desc = "Save Session" }) -- save workspace session for current working directory
    keymap.set("n", "<leader>wt", require("auto-session.session-lens").search_session, { desc = "Search Session" })
  end,
}

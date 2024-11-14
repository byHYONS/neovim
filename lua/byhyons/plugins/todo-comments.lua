return {
  "folke/todo-comments.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local todo_comments = require("todo-comments")

    -- set keymaps
    local keymap = vim.keymap -- for conciseness

    keymap.set("n", "]t", function()
      todo_comments.jump_next()
    end, { desc = "Next todo comment" })

    keymap.set("n", "[t", function()
      todo_comments.jump_prev()
    end, { desc = "Previous todo comment" })

    -- setup with color and icon configuration
    todo_comments.setup({
      signs = true,
      sign_priority = 8,
      keywords = {
        FIX = { icon = " ", color = "error", alt = { "FIXME", "BUG", "FIXIT", "ISSUE" } },
        TODO = { icon = " ", color = "todo_color" },
        HACK = { icon = " ", color = "hack_color" },
        WARN = { icon = " ", color = "warn_color", alt = { "WARNING", "XXX" } },
        PERF = { icon = " ", color = "perf_color", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
        INFO = { icon = " ", alt = { "INFO" } },
        TEST = { icon = "⏲ ", color = "test_color", alt = { "TESTING", "PASSED", "FAILED" } },
        CODE = { icon = " ", color = "code_color" },
        NOTE = { icon = " ", color = "note_color", alt = { "NOTE" } },
      },
      gui_style = {
        fg = "NONE",
        bg = "BOLD",
      },
      merge_keywords = true,
      highlight = {
        multiline = true,
        multiline_pattern = "^.",
        multiline_context = 10,
        before = "",
        keyword = "wide",
        after = "fg",
        pattern = [[.*<(KEYWORDS)\s*:]],
        comments_only = true,
        max_line_len = 400,
        exclude = {},
      },
      colors = {
        error = { "DiagnosticError", "ErrorMsg", "#8B0000" }, -- Rosso per errori
        todo_color = "#ADFF2F", -- Verde chiaro per TODO
        hack_color = "#F2CB05", -- Giallo per HACK
        warn_color = "#FF6B1A", -- Arancione per WARN
        perf_color = "#F20587", -- Fucsia per PERF
        test_color = "#800080", -- Viola scuro per TEST
        info_color = { "DiagnosticInfo", "#B48EAD" }, -- Viola per INFO
        hint = { "DiagnosticHint", "#40E0D0" }, -- Turchese per NOTE
        note_color = "#5F9EA0", -- Verdeacqua per NOTE
        code_color = "#6495ED", -- blue per INFO
      },
      search = {
        command = "rg",
        args = {
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
        },
        pattern = [[\b(KEYWORDS):]],
      },
    })
  end,
}

-- INFO: Informazioni sul codice
-- CODE: Codice commentato o info codice
-- NOTE: Annotazioni in generale
-- TODO: Cose ancora da fare
-- HACK: Soluzioni temporanee o non ideali
-- WARN: Possibili problemi o situazioni che possono causare errori
-- PERF: Aree di codice da ottimizzare per migliorare prestazioni
-- TEST: Riguarda le verifiche o i test da eseguire sul codice
-- FIX:  Segnala problemi o bug noti nel codice che richiedono correzioni

return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    preview_config = {
      border = "rounded",
    },
    signs = {
      add = { hl = "GitSignsAdd", text = "┃", numhl = "" },
      change = { hl = "GitSignsChange", text = "║", numhl = "" },
      delete = { hl = "GitSignsDelete", text = "", numhl = "" },
      topdelete = { hl = "GitSignsDelete", text = "", numhl = "" },
      changedelete = { hl = "GitSignsChange", text = "│", numhl = "" },
      untracked = { hl = "GitSignsAdd", text = "▍", numhl = "" },
    },
    signs_staged = {
      add = { hl = "GitSignsStagedAdd", text = "┊", numhl = "" },
      change = { hl = "GitSignsStagedChange", text = "┆", numhl = "" },
      delete = { hl = "GitSignsStagedDelete", text = "─", numhl = "" },
      topdelete = { hl = "GitSignsStagedDelete", text = "─", numhl = "" },
      changedelete = { hl = "GitSignsStagedChangeDelete", text = "¦", numhl = "" },
      untracked = { hl = "GitSignsStagedAdd", text = "¦", numhl = "" },
    },

    current_line_blame = true,
    current_line_blame_opts = {
      virt_text_pos = "eol",
      delay = 500,
      ignore_whitespace = false,
    },
    current_line_blame_formatter = "   <author>, <author_time:%R>",
  },

  config = function(_, opts)
    require("gitsigns").setup(opts)
    -- override highlight colors
    vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = "#009BB2" })
    vim.api.nvim_set_hl(0, "GitSignsChange", { fg = "#FF8C00" })
    vim.api.nvim_set_hl(0, "GitSignsChangeDelete", { fg = "#F20587" })
    vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = "#F20587" })

    -- staged: stessi colori degli unstaged
    vim.api.nvim_set_hl(0, "GitSignsStagedAdd", { fg = "#009BB2" })
    vim.api.nvim_set_hl(0, "GitSignsStagedChange", { fg = "#FF8C00" })
    vim.api.nvim_set_hl(0, "GitSignsStagedDelete", { fg = "#F20587" })
    vim.api.nvim_set_hl(0, "GitSignsStagedChangeDelete", { fg = "#F20587" })
  end,
}
-- 00A89D

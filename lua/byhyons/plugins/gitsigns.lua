return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    signs = {
      add = { hl = "GitSignsAdd", text = "▍", numhl = "" },
      change = { hl = "GitSignsChange", text = "▍", numhl = "" },
      delete = { hl = "GitSignsDelete", text = "", numhl = "" }, -- ▸
      topdelete = { hl = "GitSignsDelete", text = "", numhl = "" }, -- ▾
      changedelete = { hl = "GitSignsChange", text = "▍", numhl = "" },
      untracked = { hl = "GitSignsAdd", text = "▍", numhl = "" },
    },

    current_line_blame = true,
    current_line_blame_opts = {
      virt_text_pos = "eol",
      delay = 500,
      ignore_whitespace = false,
    },
    current_line_blame_formatter = "   <author>, <author_time:%R>",

    on_attach = function(bufnr)
      local gs = package.loaded.gitsigns

      local function map(mode, l, r, desc)
        vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
      end

      -- Navigation  
      map("n", "]h", gs.next_hunk, "Next Hunk")
      map("n", "[h", gs.prev_hunk, "Prev Hunk")

      -- Actions
      map("n", "<leader>h", "", " Git View")
      map("n", "<leader>hs", gs.stage_hunk, "Stage hunk")
      map("n", "<leader>hr", gs.reset_hunk, "Reset hunk")
      map("v", "<leader>hs", function()
        gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
      end, "Stage hunk")
      map("v", "<leader>hr", function()
        gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
      end, "Reset hunk")

      map("n", "<leader>hS", gs.stage_buffer, "Stage buffer")
      map("n", "<leader>hR", gs.reset_buffer, "Reset buffer")

      map("n", "<leader>hu", gs.undo_stage_hunk, "Undo stage hunk")

      map("n", "<leader>hp", gs.preview_hunk, "Preview hunk")

      map("n", "<leader>hb", function()
        gs.blame_line({ full = true })
      end, "Blame line")
      map("n", "<leader>hB", gs.toggle_current_line_blame, "Toggle line blame")

      map("n", "<leader>hd", gs.diffthis, "Diff this")
      map("n", "<leader>hD", function()
        gs.diffthis("~")
      end, "Diff this ~")

      -- Text object
      map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "Gitsigns select hunk")
    end,
  },
  config = function(_, opts)
    require("gitsigns").setup(opts)
    -- override highlight colors
    vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = "#009BB2" }) -- verde
    vim.api.nvim_set_hl(0, "GitSignsChange", { fg = "#547998" }) -- arancione
    vim.api.nvim_set_hl(0, "GitSignsChangeDelete", { fg = "#547998" }) -- arancione
    vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = "#FE4363" }) -- rosso
  end,
}

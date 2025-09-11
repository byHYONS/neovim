-- TOOL LARAVEL
return {
  "adalessa/laravel.nvim",
  commit = "54aa4e2", -- commit agosto 2025
  dependencies = {
    "tpope/vim-dotenv",
    "nvim-telescope/telescope.nvim",
    "MunifTanjim/nui.nvim",
    "kevinhwang91/promise-async",
  },
  cmd = { "Laravel" },
  event = { "VeryLazy" },
  config = true,
}

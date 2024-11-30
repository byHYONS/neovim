return {
  "kdheepak/lazygit.nvim",
  cmd = {
    "LazyGit",
    "LazyGitConfig",
    "LazyGitCurrentFile",
    "LazyGitFilter",
    "LazyGitFilterCurrentFile",
  },
  -- optional for floating window border decoration
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  -- setting the keybinding for LazyGit with 'keys' is recommended in
  -- order to load the plugin when the command is run for the first time
  keys = {
    { "<leader>lg", "<cmd>LazyGit<cr>", desc = "Open lazy git" },
    { "<leader>lr", ":lua CreateGitHubRepo()<CR>", desc = "Create GitHub Repository" },
    { "<leader>lc", ":lua require('custom.clone-github').CloneRepoFromLink()<CR>", desc = "Clone Repository via Link" },
    {
      "<leader>lm",
      ":lua require('custom.clone-github').CloneRepoFromList()<CR>",
      desc = "Clone Repository from List",
    },
  },
}

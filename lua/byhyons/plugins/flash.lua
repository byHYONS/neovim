-- Flash mutions
return {
  "folke/flash.nvim",
  event = "VeryLazy",
  -- -@type Flash.Config
  opts = {
    modes = {
      search = {
        enable = true,
      },
      char = {
        enabled = false,
        jump_labels = false,
      },
    },
  },
}

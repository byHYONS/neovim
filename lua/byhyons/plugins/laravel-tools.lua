-- Laravel IDE Tools
return {
  "adibhanna/laravel.nvim",
  name = "adibhanna-laravel.nvim",

  ft = { "php", "blade" },

  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
  },

  config = function()
    require("laravel").setup({
      notifications = false,
      debug = false,
      keymaps = false,
      sail = {
        enabled = true,
        auto_detect = true,
      },
    })
  end,
}

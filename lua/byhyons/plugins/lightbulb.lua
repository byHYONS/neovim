-- Per segnalare Code Action in Lulaline
return {
  "kosayoda/nvim-lightbulb",
  event = "LspAttach",

  opts = {
    sign = {
      enabled = false,
    },

    virtual_text = {
      enabled = false,
    },

    status_text = {
      enabled = true,
      text = "󰌶", -- 󰌵 󱠂
      text_unavailable = "",
    },

    autocmd = {
      enabled = true,
    },
  },
}

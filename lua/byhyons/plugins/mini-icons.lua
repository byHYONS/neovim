-- Per attivare le icone in which-key
return {
  "echasnovski/mini.icons",
  version = false,
  config = function()
    require("mini.icons").setup()
  end,
}

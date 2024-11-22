local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node

local base = 16 -- Definisci il valore base per rem

return {
  s("px2rem", {
    t("calc("),
    i(1, "value_in_px"), -- Inserisci il valore in px
    t(" / " .. base .. "rem)"),
  }),
  s("rem2px", {
    t("calc("),
    i(1, "value_in_rem"), -- Inserisci il valore in rem
    t(" * " .. base .. "px)"),
  }),
}

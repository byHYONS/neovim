return {
   "kylechui/nvim-surround",
   version = "*",
   event = { "BufReadPre", "BufNewFile" },
   -- event = "VeryLazy",
   -- config = true,
   config = function()
      require("nvim-surround").setup({
         surrounds = {
            ["*"] = {
               add = function()
                  return { "/* ", " */" }
               end,
            },
            ["#"] = {
               add = function()
                  return { "## ", " ##" }
               end,
            },
         },
      })
   end,
}

-- ys + movimento (es. iw, f), $) + carattere da INSERIRE
-- ds + movimento + carattere da ELIMINARE
-- cs + movimento + coarattere da SOSTITUIRE + nuovo carattere
-- yss + crattere -> su intera linea
-- dss cancella su intera linea
-- ysis + carattere -> intero paragrafo
-- ysip + carattere -> intero paragrafo
-- dopo selezione i consente di immettere prima a sinistra poi a destra
-- ysa cherca il carattere {[(x)]} ysa + [ + " -> {"[(x)]"}
-- "V" S + carattere da INSERIRE
-- ysiw + t per scrivere tag (cst, dst)
-- ysiw + f per scrivere funzione

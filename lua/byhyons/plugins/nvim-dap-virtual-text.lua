-- DAP • Inline Debug Text
return {
  "theHamsta/nvim-dap-virtual-text",
  event = "VeryLazy",

  dependencies = {
    "mfussenegger/nvim-dap",
  },

  opts = {
    enabled = true,                        -- Abilita il plugin
    enabled_commands = true,               -- Crea i comandi :DapVirtualTextEnable ecc.
    highlight_changed_variables = true,    -- Evidenzia le variabili che cambiano valore (MOLTO UTILE)
    highlight_new_as_changed = false,
    show_stop_reason = true,               -- Mostra perché il debug si è fermato (es. exception)
    commented = true,                      -- Mette il valore come commento alla fine della riga
    only_first_definition = true,          -- Mostra solo alla prima definizione se ci sono più riferimenti
    all_references = false,                -- Evita confusione se la variabile appare molte volte

    display_callback = function(variable, _, _, _, options)
      if options.virt_text_pos == "inline" then
        return " = " .. variable.value
      end

      return variable.name .. " = " .. variable.value
    end,
  },
}

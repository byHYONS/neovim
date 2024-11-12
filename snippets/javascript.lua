-- Snippets Javascrip:
local ls = require("luasnip") -- Carica il modulo LuaSnip
local s = ls.snippet -- Abbreviazione per la funzione che crea snippet
local i = ls.insert_node -- Abbreviazione per creare un nodo di inserimento
local t = ls.text_node -- Abbreviazione per creare un nodo di testo

return {
  -- Snippet per console.log
  s("jlog", {
    t("console.log("),
    i(1, '"$1"'),
    t(");"),
    i(0),
  }),

  -- Snippet per if statement
  s("jif", {
    t("if ("), -- Inserisce "if ("
    i(1, "condition"), -- Primo nodo di inserimento, per la condizione
    t(") {"), -- Chiude la parentesi della condizione e apre il blocco
    t({ "", "\t" }), -- Nuova riga con indentazione
    i(2, "statement"), -- Secondo nodo di inserimento per il corpo dell'if
    t({ "", "}" }), -- Chiude il blocco if
  }),

  -- Snippet per for loop
  s("jfor", {
    t("for (let "), -- Inserisce "for (let "
    i(1, "i"), -- Primo nodo di inserimento per la variabile del loop
    t(" = 0; "), -- Assegnazione iniziale della variabile
    i(2, "i < n"), -- Secondo nodo di inserimento per la condizione
    t("; "), -- Punteggiatura tra le parti del for
    i(3, "i++"), -- Terzo nodo di inserimento per l'incremento
    t(") {"), -- Apre il blocco del for
    t({ "", "\t" }), -- Nuova riga con indentazione
    i(4, "statement"), -- Quarto nodo di inserimento per il corpo del for
    t({ "", "}" }), -- Chiude il blocco for
  }),
}

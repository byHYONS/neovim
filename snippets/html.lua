local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node

return {
  -- Snippet per un blocco div
  s("div", {
    t("<div>"),
    t({ "", "\t" }),
    i(1, "content"), -- Nodo di inserimento per il contenuto del div
    t({ "", "</div>" }),
  }),

  -- Snippet per un link
  s("a", {
    t('<a href="'),
    i(1, "url"),
    t('">'),
    i(2, "link text"),
    t("</a>"),
  }),

  -- Snippet per un paragrafo Lorem Ipsum
  s("lorem", {
    t(
      "Lorem ipsum dolor, sit amet consectetur adipisicing elit. Atque maiores nulla, impedit quisquam deserunt repellendus, asperiores cum neque, inventore corporis blanditiis sed dolores. Repellat blanditiis, eveniet assumenda distinctio voluptatem quo."
    ),
  }),
  s("lorem10", {
    t("Lorem, ipsum dolor sit amet consectetur adipisicing elit. Veritatis, porro!"),
  }),
  s("lorem25", {
    t(
      "Lorem ipsum, dolor sit amet consectetur adipisicing elit. Nobis dolore quam error voluptatum excepturi minima nostrum ullam architecto labore itaque, est, corporis tempora, quibusdam adipisci?"
    ),
  }),
  s("lorem50", {
    t(
      "Lorem ipsum dolor sit amet consectetur, adipisicing elit. Quaerat accusamus commodi at quae obcaecati, facere ratione? Quibusdam dignissimos soluta inventore aliquid porro. Officia totam voluptatum quaerat a nobis quia nesciunt modi, error possimus, nostrum, consequatur commodi maiores deserunt accusantium adipisci minus ex? Minus quibusdam sunt cumque iste nemo sequi molestiae."
    ),
  }),
}

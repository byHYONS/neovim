return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-buffer", -- source for text in buffer
    "hrsh7th/cmp-path", -- source for file system paths
    {
      "L3MON4D3/LuaSnip",
      -- follow latest release.
      version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
      -- install jsregexp (optional!).
      build = "make install_jsregexp",
    },
    "saadparwaiz1/cmp_luasnip", -- for autocompletion
    "rafamadriz/friendly-snippets", -- useful snippets
    "onsails/lspkind.nvim", -- vs-code like pictograms
  },
  config = function()
    local cmp = require("cmp")

    local luasnip = require("luasnip")

    local lspkind = require("lspkind")

    -- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
    require("luasnip.loaders.from_vscode").lazy_load()

    cmp.setup({
      completion = {
        completeopt = "menu,menuone,preview,noselect",
      },
      snippet = { -- configure how nvim-cmp interacts with snippet engine
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
        ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-v>"] = cmp.mapping.complete(), -- show completion suggestions
        ["<Esc>"] = cmp.mapping.abort(), -- close completion window
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback() -- Use the default behavior
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback() -- Use the default behavior
          end
        end, { "i", "s" }),
      }),
      -- sources for autocompletion
      sources = cmp.config.sources({
        { name = "vim-dadbod-completion" },
        { name = "nvim_lsp" },
        { name = "copilot" },
        { name = "luasnip" }, -- snippets
        { name = "buffer" }, -- text within current buffer
        { name = "path" }, -- file system paths
      }),

      -- configure lspkind for vs-code like pictograms in completion menu
      formatting = {
        format = lspkind.cmp_format({
          maxwidth = 50,
          ellipsis_char = "...",
        }),
      },
      -- Configure window appearance
      window = {
        completion = cmp.config.window.bordered({
          border = "rounded", -- Angoli arrotondati
          winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder", -- Evidenziazione per bordo e sfondo
          side_padding = 1, -- Margini laterali
        }),
        documentation = cmp.config.window.bordered({
          border = "rounded", -- Angoli arrotondati anche per la documentazione
          winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder",
        }),
      },
    })
    -- Abilita il completamento per i file SQL
    cmp.setup.filetype("sql", {
      sources = cmp.config.sources({
        { name = "vim-dadbod-completion" },
        { name = "nvim_lsp" },
        { name = "buffer" },
      }),
    })
  end,
}

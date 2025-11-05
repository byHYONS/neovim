-- TAILWINDCSS - TAILWIND
return {
  cmd = { "tailwindcss-language-server", "--stdio" },

  filetypes = {
    -- HTML & template engines
    "aspnetcorerazor",
    "astro",
    "astro-markdown",
    "blade",
    "clojure",
    "django-html",
    "htmldjango",
    "edge",
    "eelixir",
    "elixir",
    "ejs",
    "erb",
    "eruby",
    "gohtml",
    "gohtmltmpl",
    "haml",
    "handlebars",
    "hbs",
    "html",
    "htmlangular",
    "html-eex",
    "heex",
    "jade",
    "leaf",
    "liquid",
    "markdown",
    "mdx",
    "mustache",
    "njk",
    "nunjucks",
    "php",
    "razor",
    "slim",
    "twig",

    -- CSS
    "css",
    "less",
    "postcss",
    "sass",
    "scss",
    "stylus",
    "sugarss",

    -- JS/TS
    "javascript",
    "javascriptreact",
    "reason",
    "rescript",
    "typescript",
    "typescriptreact",

    -- Mixed
    "vue",
    "svelte",
    "templ",
  },

  init_options = { userLanguages = {} },

  settings = {
    tailwindCSS = {
      validate = true,
      lint = {
        cssConflict = "warning",
        invalidApply = "error",
        invalidScreen = "error",
        invalidVariant = "error",
        invalidConfigPath = "error",
        invalidTailwindDirective = "error",
        recommendedVariantOrder = "warning",
      },
      classAttributes = { "class", "className", "class:list", "classList", "ngClass" },
      includeLanguages = {
        eelixir = "html-eex",
        elixir = "phoenix-heex",
        eruby = "erb",
        heex = "phoenix-heex",
        htmlangular = "html",
        templ = "html",
      },
    },
  },

  -- Mantieni tabSize coerente con Neovim
  before_init = function(_, config)
    config.settings = config.settings or {}
    config.settings.editor = config.settings.editor or {}
    config.settings.editor.tabSize = config.settings.editor.tabSize or vim.lsp.util.get_effective_tabstop()
  end,

  workspace_required = true,

  root_dir = function(bufnr, on_dir)
    local util = require("lspconfig.util")
    local fname = vim.api.nvim_buf_get_name(bufnr)

    local root_files = {
      "tailwind.config.js",
      "tailwind.config.cjs",
      "tailwind.config.mjs",
      "tailwind.config.ts",
      "postcss.config.js",
      "postcss.config.cjs",
      "postcss.config.mjs",
      "postcss.config.ts",
      "theme/static_src/tailwind.config.js",
      "theme/static_src/tailwind.config.cjs",
      "theme/static_src/tailwind.config.mjs",
      "theme/static_src/tailwind.config.ts",
      "theme/static_src/postcss.config.js",
      ".git", -- fallback per Tailwind v4
    }

    root_files = util.insert_package_json(root_files, "tailwindcss", fname)
    root_files = util.root_markers_with_field(root_files, { "mix.lock", "Gemfile.lock" }, "tailwind", fname)

    local found = vim.fs.find(root_files, { path = fname, upward = true })[1]
    on_dir(vim.fs.dirname(found))
  end,
}

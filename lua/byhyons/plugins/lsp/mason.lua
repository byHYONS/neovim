-- MASON SERVER LSP
return {
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "ast_grep",
        "bashls",
        "clangd",
        "cssls",
        "emmet_ls",
        "gopls",
        "graphql",
        "html",
        "jsonls",
        "intelephense",
        "lua_ls",
        "phpactor",
        "prismals",
        "pyright",
        "rust_analyzer",
        "sqls",
        "svelte",
        "tailwindcss",
        "ts_ls",
        "vue_ls",
        "vtsls",
      },
    },
    dependencies = {
      {
        "williamboman/mason.nvim",
        opts = {
          ui = {
            icons = {
              package_installed = "✓",
              package_pending = "➜",
              package_uninstalled = "✗",
            },
          },
        },
      },
      "neovim/nvim-lspconfig",
    },
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = {
        "blade-formatter",
        "black", -- python formatter
        "debugpy", -- DAP python
        "eslint_d", -- js linter
        "flake8",
        "isort", -- python formatter
        "jq", -- Per manipolare dati JSON
        "js-debug-adapter", -- DAP javascript
        "mypy",
        "phpstan",
        "php-cs-fixer",
        "php-debug-adapter", -- DAP php
        "prettier", -- prettier formatter
        "pylint", -- python linter
        "shfmt", -- bash formatter
        "sqlfmt",
        "stylua", -- lua formatter
      },
    },
    dependencies = {
      "williamboman/mason.nvim",
    },
  },
}

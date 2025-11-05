-- MASON SERVER LSP
return {
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "vtsls",
        "vue_ls",
        "ts_ls",
        "bashls",
        "html",
        "emmet_ls",
        "cssls",
        "tailwindcss",
        "lua_ls",
        "graphql",
        "svelte",
        "intelephense",
        "phpactor",
        "prismals",
        "pyright",
        "clangd",
        "jsonls",
        "sqls",
        "ast_grep",
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
        "shfmt", -- bash formatter
        "prettier", -- prettier formatter
        "stylua", -- lua formatter
        "isort", -- python formatter
        "black", -- python formatter
        "pylint", -- python linter
        "eslint_d", -- js linter
        "blade-formatter",
        "mypy",
        "debugpy",
        "flake8",
        "php-cs-fixer",
        "phpstan",
        "sqlfmt",
        "jq", -- Per manipolare dati JSON
      },
    },
    dependencies = {
      "williamboman/mason.nvim",
    },
  },
}

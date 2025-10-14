return {
  "williamboman/mason.nvim",
  dependencies = {
    "neovim/nvim-lspconfig",
    -- "williamboman/mason-lspconfig.nvim",
    "mason-org/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    -- 1) mason core
    require("mason").setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    require("mason-lspconfig").setup({
      ensure_installed = {
        "bashls",
        "html",
        "emmet_ls",
        "cssls",
        "tailwindcss",
        "lua_ls",
        "ts_ls",
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
    })

    require("mason-tool-installer").setup({
      ensure_installed = {
        "shfmt", -- bash formatter
        "prettier", -- prettier formatter
        "biome",
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
      integrations = {
        ["mason-lspconfig"] = false,
      },
    })
  end,
}

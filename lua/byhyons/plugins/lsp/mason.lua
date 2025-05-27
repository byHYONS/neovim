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
        "ts_ls",
        "vue_ls",
        "html",
        "cssls",
        "tailwindcss",
        "svelte",
        "lua_ls",
        "graphql",
        "emmet_ls",
        "prismals",
        "pyright",
        "intelephense",
        "phpactor",
        "ast_grep",
        "clangd",
        "harper_ls",
        "stimulus_ls",
        "jsonls",
        "sqls",
      },
      automatic_enable = false,
    })

    require("mason-tool-installer").setup({
      ensure_installed = {
        "prettier", -- prettier formatter
        "stylua", -- lua formatter
        "isort", -- python formatter
        "black", -- python formatter
        "pylint", -- python linter
        "eslint_d", -- js linter
        "blade-formatter", -- Aggiungi blade-formatter qui
        "mypy",
        "debugpy",
        "flake8",
        "phpcs",
        "sqlfmt",
        "jq", -- Per manipolare dati JSON
      },
      integrations = {
        ["mason-lspconfig"] = false,
      },
    })
  end,
}

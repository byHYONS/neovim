return {
  "neovim/nvim-lspconfig",
  after = "mason-org/mason-lspconfig.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
    { "folke/neodev.nvim", opts = {} },
  },
  config = function()
    local lspconfig = require("lspconfig")
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    -- js ts vuejs
    local mason_path = vim.fn.stdpath("data") .. "/mason/packages"
    local ts_path = mason_path .. "/typescript-language-server/node_modules/typescript/lib"
    local vue_ts_plugin = "/Users/byhyons/.nvm/versions/node/v20.19.3/lib/node_modules/@vue/typescript-plugin"

    -- php laravel blade
    local util = require("lspconfig").util
    local php_root = util.root_pattern("artisan", "composer.json", ".git")

    -- Keymaps e segni diagnostici
    local keymap = vim.keymap
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        local opts = { buffer = ev.buf, silent = true }
        opts.desc = "Show LSP references"
        keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)
        opts.desc = "Go to declaration"
        keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        opts.desc = "Show definitions"
        keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
        opts.desc = "Show implementations"
        keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)
        opts.desc = "Show type definitions"
        keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)
        opts.desc = "Code actions"
        keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
        opts.desc = "Smart rename"
        keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        opts.desc = "Buffer diagnostics"
        keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)
        opts.desc = "Line diagnostics"
        keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
        opts.desc = "Prev diagnostic"
        keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
        opts.desc = "Next diagnostic"
        keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
        opts.desc = "Hover doc"
        keymap.set("n", "K", vim.lsp.buf.hover, opts)
        opts.desc = "Restart LSP"
        keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
      end,
    })

    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    for type, icon in pairs(signs) do
      vim.fn.sign_define("DiagnosticSign" .. type, { text = icon, texthl = "DiagnosticSign" .. type })
    end

    -- === CONFIGURAZIONE MANUALE DEI SERVER ===

    -- 1) TypeScript / ts_ls
    lspconfig.ts_ls.setup({
      capabilities = capabilities,
      filetypes = {
        "typescript",
        "typescriptreact",
        "javascript",
        "javascriptreact",
        "vue",
      },
      init_options = {
        typescript = {
          tsdk = ts_path,
        },
        plugins = {
          {
            name = "@vue/typescript-plugin",
            location = vue_ts_plugin,
            languages = { "vue" },
          },
        },
      },
    })

    -- 2) Volar (Vue 3)
    lspconfig.volar.setup({
      capabilities = capabilities,
      filetypes = { "vue" },
      init_options = {
        typescript = { tsdk = ts_path },
        vue = { hybridMode = false },
      },
      settings = {
        volar = {
          takeOverMode = false,
          experimental = {
            templateInterpolationService = true,
            styleInterpolationService = true,
          },
        },
      },
    })

    -- 3) Svelte
    lspconfig.svelte.setup({
      capabilities = capabilities,
      on_attach = function(client, bufnr)
        vim.api.nvim_create_autocmd("BufWritePost", {
          pattern = { "*.js", "*.ts" },
          callback = function(ctx)
            client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.match })
          end,
        })
      end,
    })

    -- 4) GraphQL
    lspconfig.graphql.setup({
      capabilities = capabilities,
      filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
    })

    -- 5) Emmet
    lspconfig.emmet_ls.setup({
      capabilities = capabilities,
      filetypes = {
        "html",
        "typescriptreact",
        "javascriptreact",
        "vue",
        "php",
        "blade",
        "python",
        "css",
        "sass",
        "scss",
        "less",
        "svelte",
      },
    })

    -- 6) Lua
    lspconfig.lua_ls.setup({
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = { globals = { "vim" }, disable = { "missing-fields" } },
          completion = { callSnippet = "Replace" },
        },
      },
    })

    -- 7) JSON
    lspconfig.jsonls.setup({
      capabilities = capabilities,
      filetypes = { "json", "jsonc" },
      settings = { json = { validate = { enable = true } } },
    })

    -- 8) html
    lspconfig.html.setup({
      capabilities = capabilities,
      filetypes = { "html", "blade", "vue" },
    })

    -- 9) cssls
    lspconfig.cssls.setup({
      capabilities = capabilities,
      filetypes = {
        "css",
        "scss",
        "less",
        "vue",
      },
    })

    -- 10) tailwindcss
    lspconfig.tailwindcss.setup({
      capabilities = capabilities,
      filetypes = {
        "html",
        "css",
        "typescript",
        "javascript",
        "vue",
      },
    })

    -- 11) PHP
    lspconfig.intelephense.setup({
      capabilities = capabilities,
      settings = {
        intelephense = {
          files = { maxSize = 5000000 },
          environment = { shortOpenTag = true },
        },
      },
    })

    lspconfig.phpactor.setup({ capabilities = capabilities })

    -- 12) python
    lspconfig.pyright.setup({
      capabilities = capabilities,
      settings = {
        python = {
          analysis = {
            autoSearchPaths = true,
            useLibraryCodeForTypes = true,
            diagnosticMode = "workspace",
            typeCheckingMode = "off",
          },
        },
      },
    })

    -- 13) sql
    lspconfig.sqls.setup({
      capabilities = capabilities,
      settings = {
        sqls = {
          connections = {
            { driver = "mysql", dataSourceName = "root:root@tcp(127.0.0.1:8889)/mysql" },
            { driver = "sqlite3", dataSourceName = "/path/to/your/sqlite.db" },
            { driver = "postgresql", dataSourceName = "postgres://user:password@localhost:5432/" },
          },
        },
      },
    })
  end,
}

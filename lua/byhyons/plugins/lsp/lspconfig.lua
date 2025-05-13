return {
  "neovim/nvim-lspconfig",
  after = "mason-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
    { "folke/neodev.nvim", opts = {} },
  },
  config = function()
    local lspconfig = require("lspconfig")
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    local keymap = vim.keymap

    -- Keymaps e segni diagnostici
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

    lspconfig.graphql.setup({
      capabilities = capabilities,
      filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
    })

    lspconfig.emmet_ls.setup({
      capabilities = capabilities,
      filetypes = {
        "html",
        "typescriptreact",
        "javascriptreact",
        "css",
        "sass",
        "scss",
        "less",
        "svelte",
        "blade",
      },
    })

    lspconfig.lua_ls.setup({
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = { globals = { "vim" }, disable = { "missing-fields" } },
          completion = { callSnippet = "Replace" },
        },
      },
    })

    lspconfig.volar.setup({
      capabilities = capabilities,
      filetypes = { "vue", "typescript", "javascript", "javascriptreact", "typescriptreact" },
      init_options = { vue = { hybridMode = false } },
      settings = {
        volar = {
          takeOverMode = true,
          experimental = { templateInterpolationService = false, styleInterpolationService = false },
        },
      },
    })

    lspconfig.jsonls.setup({
      capabilities = capabilities,
      filetypes = { "json", "jsonc" },
      settings = { json = { validate = { enable = true } } },
    })

    lspconfig.html.setup({
      capabilities = capabilities,
      filetypes = { "html", "blade" },
    })

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

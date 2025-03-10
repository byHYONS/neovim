return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
    { "folke/neodev.nvim", opts = {} },
  },
  config = function()
    -- import lspconfig plugin
    local lspconfig = require("lspconfig")

    -- import mason_lspconfig plugin
    local mason_lspconfig = require("mason-lspconfig")

    -- import cmp-nvim-lsp plugin
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    local keymap = vim.keymap -- for conciseness

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf, silent = true }

        -- set keybinds
        opts.desc = "Show LSP references"
        keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

        opts.desc = "Go to declaration"
        keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

        opts.desc = "Show LSP definitions"
        keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

        opts.desc = "Show LSP implementations"
        keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

        opts.desc = "Show LSP type definitions"
        keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

        opts.desc = "See available code actions"
        keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

        opts.desc = "Smart rename"
        keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

        opts.desc = "Show buffer diagnostics"
        keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

        opts.desc = "Show line diagnostics"
        keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

        opts.desc = "Go to previous diagnostic"
        keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

        opts.desc = "Go to next diagnostic"
        keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

        opts.desc = "Show documentation for what is under cursor"
        keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

        opts.desc = "Restart LSP"
        keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
      end,
    })

    -- used to enable autocompletion (assign to every lsp server config)
    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- Change the Diagnostic symbols in the sign column (gutter)
    -- (not in youtube nvim video)
    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    mason_lspconfig.setup_handlers({
      -- default handler for installed servers
      function(server_name)
        lspconfig[server_name].setup({
          capabilities = capabilities,
        })
      end,
      ["svelte"] = function()
        -- configure svelte server
        lspconfig["svelte"].setup({
          capabilities = capabilities,
          on_attach = function(client, bufnr)
            vim.api.nvim_create_autocmd("BufWritePost", {
              pattern = { "*.js", "*.ts" },
              callback = function(ctx)
                -- Here use ctx.match instead of ctx.file
                client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.match })
              end,
            })
          end,
        })
      end,
      ["graphql"] = function()
        -- configure graphql language server
        lspconfig["graphql"].setup({
          capabilities = capabilities,
          filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
        })
      end,
      ["emmet_ls"] = function()
        -- configure emmet language server
        lspconfig["emmet_ls"].setup({
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
      end,
      ["lua_ls"] = function()
        -- configure lua server (with special settings)
        lspconfig["lua_ls"].setup({
          capabilities = capabilities,
          settings = {
            Lua = {
              -- make the language server recognize "vim" global
              diagnostics = {
                globals = { "vim" },
                disable = { "missing-fields" }, -- Disabilita il warning per i campi mancanti
              },
              completion = {
                callSnippet = "Replace",
              },
            },
          },
        })
      end,
      -- Configurazione server per vue.js
      ["volar"] = function()
        lspconfig["volar"].setup({
          capabilities = capabilities,
          filetypes = { "vue", "typescript", "javascript", "javascriptreact", "typescriptreact" },
          init_options = {
            vue = {
              hybridMode = false, --  Disabilita Hybrid Mode (ora Volar gestirà TypeScript nei file Vue)
            },
            typescript = {
              tsdk = "/Users/byhyons/.nvm/versions/node/v20.16.0/lib/node_modules/typescript/lib",
            },
          },
          settings = {
            volar = {
              takeOverMode = true, --  Fa gestire tutto a Volar, compreso TypeScript
              experimental = {
                templateInterpolationService = false,
                styleInterpolationService = false,
              },
            },
          },
        })
        -- Configurazione JSON Language Server
        lspconfig.jsonls.setup({
          capabilities = capabilities,
          filetypes = { "json", "jsonc" }, -- Supporta JSON standard e con commenti (JSONC)
          settings = {
            json = {
              validate = { enable = true },
            },
          },
        })
      end,
      -- Configurazione Laravel:
      ["html"] = function()
        lspconfig["html"].setup({
          capabilities = capabilities,
          filetypes = { "html", "blade" },
        })
      end,
      ["intelephense"] = function()
        lspconfig["intelephense"].setup({
          capabilities = capabilities,
          settings = {
            intelephense = {
              files = {
                maxSize = 5000000, -- Aumenta la dimensione massima del file se necessario
              },
              environment = {
                shortOpenTag = true,
              },
            },
          },
        })
      end,
      ["phpactor"] = function()
        lspconfig["phpactor"].setup({
          capabilities = capabilities,
        })
      end,
      -- Configurazione per Python (pyright)
      ["pyright"] = function()
        lspconfig["pyright"].setup({
          capabilities = capabilities,
          settings = {
            python = {
              analysis = {
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                diagnosticMode = "workspace",
                typeCheckingMode = "off", -- Puoi scegliere "basic" o "strict" in base alle tue esigenze
              },
            },
          },
        })
      end,
      -- Configurazione per SQL
      ["sqls"] = function()
        lspconfig["sqls"].setup({
          capabilities = capabilities,
          settings = {
            sqls = {
              connections = {
                {
                  driver = "mysql",
                  dataSourceName = "root:root@tcp(127.0.0.1:8889)/mysql",
                },
                {
                  driver = "sqlite3",
                  dataSourceName = "/path/to/your/sqlite.db",
                },
                {
                  driver = "postgresql",
                  dataSourceName = "postgres://user:password@localhost:5432/",
                },
              },
            },
          },
        })
      end,
    })
  end,
}

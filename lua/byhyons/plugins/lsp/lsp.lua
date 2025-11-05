return {
  "hrsh7th/cmp-nvim-lsp",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    { "antosha417/nvim-lsp-file-operations", config = true },
    { "folke/lazydev.nvim", opts = {} },
  },
  config = function()
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    local capabilities = cmp_nvim_lsp.default_capabilities()

    vim.lsp.config("*", {
      capabilities = capabilities,
    })

    -- ==============================
    --  Keymaps e segni diagnostici
    -- ==============================
    local keymap = vim.keymap
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        local opts = { buffer = ev.buf, silent = true }
        opts.desc = "Smart rename"
        keymap.set("n", "gI", vim.lsp.buf.rename, opts)
        opts.desc = "Show LSP references"
        keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)
        opts.desc = "Show definitions"
        keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
        opts.desc = "Go to declaration"
        keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        opts.desc = "Show implementations"
        keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)
        opts.desc = "Show type definitions"
        keymap.set("n", "gy", "<cmd>Telescope lsp_type_definitions<CR>", opts)
        opts.desc = "Code actions"
        keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
        opts.desc = "Buffer diagnostics"
        keymap.set("n", "gL", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)
        opts.desc = "Line diagnostics"
        keymap.set("n", "gl", vim.diagnostic.open_float, opts)
        opts.desc = "Prev diagnostic"
        keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
        opts.desc = "Next diagnostic"
        keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
        opts.desc = "Hover doc"
        keymap.set("n", "K", vim.lsp.buf.hover, opts)
        opts.desc = " Lazy LSP"
        keymap.set("n", "<leader>l", "", opts)
        opts.desc = "Restart LSP"
        keymap.set("n", "<leader>ls", ":LspRestart<CR>", opts)
      end,
    })

    -- ======================
    --   ICONS DIAGNOSTICI
    -- ======================
    local severity = vim.diagnostic.severity

    vim.diagnostic.config({
      virtual_text = true,
      signs = {
        text = {
          [severity.ERROR] = " ",
          [severity.WARN] = " ",
          [severity.HINT] = "󰠠 ",
          [severity.INFO] = " ",
        },
      },
    })
  end,
}

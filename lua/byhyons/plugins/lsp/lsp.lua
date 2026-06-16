-- ############################################
-- ##                                        ##
-- ##       LSP CONFIG / KEYMAP LSP          ##
-- ##                                        ##
-- ############################################

local helpers = require("byhyons.core.helpers")

-- ==============================
--  CMP • autocompletamento
-- ==============================
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
    helpers.remove_default_lsp_keymaps()
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        -- Mostra gli Inlay Hints
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        if client and client:supports_method("textDocument/inlayHint") then
          vim.lsp.inlay_hint.enable(true, { bufnr = ev.buf })
        end
        -- Keymaps
        local opts = { buffer = ev.buf, silent = true }
        opts.desc = "Smart Rename"
        opts.nowait = true
        keymap.set("n", "gr", vim.lsp.buf.rename, opts)
        opts.nowait = nil
        opts.desc = "Show LSP References"
        keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)
        opts.desc = "Show Definitions"
        keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
        opts.desc = "Go to Declaration"
        keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        opts.desc = "Show Implementations"
        keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)
        opts.desc = "Show Type Tefinitions"
        keymap.set("n", "gy", "<cmd>Telescope lsp_type_definitions<CR>", opts)
        opts.desc = "Code Actions"
        keymap.set({ "n", "v" }, "gA", vim.lsp.buf.code_action, opts)
        opts.desc = "Document Symbols"
        keymap.set("n", "gO", helpers.telescope_document_symbols, opts)
        opts.desc = "Buffer Diagnostics"
        keymap.set("n", "gL", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)
        opts.desc = "Line Diagnostics"
        keymap.set("n", "gl", vim.diagnostic.open_float, opts)
        opts.desc = "Prev Diagnostic"
        keymap.set("n", "[d", function()
          vim.diagnostic.jump({ count = -1 })
        end, opts)
        opts.desc = "Next Diagnostic"
        keymap.set("n", "]d", function()
          vim.diagnostic.jump({ count = 1 })
        end, opts)
        opts.desc = "Hover Doc"
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

    vim.api.nvim_set_hl(0, "DiagnosticSignError", { fg = "#FF6B7C" })
    vim.api.nvim_set_hl(0, "DiagnosticSignWarn", { fg = "#FFC569" })
    vim.api.nvim_set_hl(0, "DiagnosticSignInfo", { fg = "#4DA6FF" })
    vim.api.nvim_set_hl(0, "DiagnosticSignHint", { fg = "#A0A0FF" })
    vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", { fg = "#FF6B7C" })
    vim.api.nvim_set_hl(0, "DiagnosticVirtualTextWarn", { fg = "#FFC569" })
    vim.api.nvim_set_hl(0, "DiagnosticVirtualTextInfo", { fg = "#4DA6FF" })
    vim.api.nvim_set_hl(0, "DiagnosticVirtualTextHint", { fg = "#A0A0FF" })

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
      float = {
        border = "rounded",
        source = "if_many",
        header = "",
        prefix = "",
      },
    })
  end,
}

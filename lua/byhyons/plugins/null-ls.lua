return {
  "jose-elias-alvarez/null-ls.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        -- Formatter per SQL
        null_ls.builtins.formatting.sqlfmt,
        -- Formatter per JSON e XML
        null_ls.builtins.formatting.prettier.with({
          filetypes = { "svg", "xml", "json" }, -- Formatta SVG e XML
        }),
      },
    })

    vim.api.nvim_create_user_command("Format", function()
      vim.lsp.buf.format({ async = true })
    end, {})

    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = { "*.svg", "*.xml", "*.json", "*.sql" },
      callback = function()
        vim.lsp.buf.format({ async = false })
      end,
    })
  end,
}

return {
  "nvimtools/none-ls.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local null_ls = require("null-ls") -- <- QUI il nome giusto
    local formatting = null_ls.builtins.formatting
    local diagnostics = null_ls.builtins.diagnostics

    null_ls.setup({
      sources = {
        formatting.blade_formatter,
        formatting.phpcsfixer,
        diagnostics.phpstan,
        formatting.sqlfmt,
        formatting.black,

        -- NOTE: biome non è ancora suppurtato da none-ls (ex null-ls)
        -- diagnostics.biome.with({
        --   filetypes = { "javascript", "typescript", "vue" },
        -- }),
        -- formatting.biome.with({
        --   filetypes = { "javascript", "typescript", "vue" },
        -- }),

        formatting.prettier.with({
          filetypes = { "javascript", "typescript", "vue" },
        }),
        formatting.prettier.with({
          filetypes = {
            "css",
            "scss",
            "less",
            "html",
            "json",
            "yaml",
            "markdown",
            "markdown_inline",
            "svg",
            "xml",
          },
        }),
      },
      on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_buf_create_user_command(bufnr, "Format", function()
            vim.lsp.buf.format({ bufnr = bufnr })
          end, { desc = "Format current buffer" })

          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({ bufnr = bufnr })
            end,
            desc = "Auto-format buffer",
          })
        end
      end,
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

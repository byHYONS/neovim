local lint = require("lint")

lint.linters_by_ft = {
  javascript = { "eslint" },
  typescript = { "eslint" },
  vue = { "eslint" },
  javascriptreact = { "eslint_d" },
  typescriptreact = { "eslint_d" },
  svelte = { "eslint_d" },
  python = { "pylint", "mypy", "flake8" },
  php = { "phpcs" },
}

local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
  group = lint_augroup,
  callback = function()
    lint.try_lint()
  end,
})

vim.keymap.set("n", "<leader>g", function()
  lint.try_lint()
end, { desc = "Trigger linting for current file" })

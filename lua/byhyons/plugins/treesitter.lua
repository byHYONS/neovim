-- TREESITTER • Migliora colori, indentazione e comprensione della struttura del codice tramite Treesitter.
return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  dependencies = {
    "windwp/nvim-ts-autotag",
  },
  config = function()
    -- Configurazione del parser Blade
    ---@class ParserInfo
    local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
    parser_config.blade = {
      install_info = {
        url = "https://github.com/EmranMR/tree-sitter-blade",
        files = { "src/parser.c" },
        branch = "main",
      },
      filetype = "blade",
    }

    -- import nvim-treesitter plugin
    local treesitter = require("nvim-treesitter.configs")

    -- configure treesitter
    treesitter.setup({ -- enable syntax highlighting
      highlight = {
        enable = true,
        priority = 80,
      },
      -- enable indentation
      indent = { enable = true },
      -- enable autotagging (w/ nvim-ts-autotag plugin)
      autotag = {
        enable = true,
      },
      -- ensure these language parsers are installed
      ensure_installed = {
        "bash",
        "blade",
        "c",
        "cpp",
        "css",
        "dockerfile",
        "gitignore",
        "go",
        "graphql",
        "html",
        "http",
        "json",
        "javascript",
        "lua",
        "markdown",
        "markdown_inline",
        "prisma",
        "php",
        "php_only",
        "python",
        "query",
        "rust",
        "scss",
        "sql",
        "svelte",
        "typescript",
        "tsx",
        "vim",
        "vimdoc",
        "yaml",
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
    })
  end,
}

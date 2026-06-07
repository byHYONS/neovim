-- LETEX • LanguageTool LSP Server
return {
  filetypes = {
    "markdown",
    "norg",
    "tex",
    "text",
    "gitcommit",
  },

  settings = {
    ltex = {
      language = "auto",

      additionalRules = {
        enablePickyRules = true,
        motherTongue = "it-IT",
      },

      dictionary = {
        ["it-IT"] = {
          "Neovim",
          "Lualine",
          "Treesitter",
          "Tokyonight",
          "Copilot",
          "Markdown",
          "README",
          "GitHub",
          "Laravel",
          "Vue",
          "JavaScript",
          "TypeScript",
          "frontend",
          "backend",
          "serverless",
          "repository",
          "commit",
          "branch",
          "plugin",
          "buffer",
          "layout",
        },

        ["en-US"] = {
          "Neovim",
          "Lualine",
          "Treesitter",
          "Tokyonight",
          "Hyons",
          "byHYONS",
          "Copilot",
          "Neorg",
        },
      },
    },
  },
}

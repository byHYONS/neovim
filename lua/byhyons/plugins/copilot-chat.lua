-- COPILOT GITHUB CHAT
return {
  "CopilotC-Nvim/CopilotChat.nvim",

  dependencies = {
    "nvim-lua/plenary.nvim",
    "github/copilot.vim",
    {
      "MeanderingProgrammer/render-markdown.nvim",
      ft = { "markdown", "copilot-chat" },
      opts = {
        file_types = { "markdown", "copilot-chat" },
      },
    },
  },

  build = "make tiktoken",

  cmd = {
    "CopilotChat",
    "CopilotChatClose",
    "CopilotChatNew",
    "CopilotChatSave",
  },

  opts = {
    system_prompt = [[
Sei un assistente di programmazione.

Regole:
- Rispondi SEMPRE in italiano.
- Mantieni le spiegazioni concise.
- Quando analizzi codice, mostra prima il problema e poi la soluzione.
- Quando proponi modifiche, fornisci esempi concreti.
- Non usare inglese salvo nomi tecnici o codice.
]],

    window = {
      layout = "vertical",
      width = 0.38,
      border = "single",
    },

    headers = {
      user = "~ Tu  ",
      assistant = "~ Copilot  ",
      tool = "~ Tool 󰊳 ",
    },

    mappings = {
      complete = { detail = "Use @<Tab> or /<Tab> for options.", insert = "<C-j>" },
      close = { normal = "q", insert = "<C-c>" },
      reset = { normal = "<C-x>", insert = "<C-x>" },
      submit_prompt = { normal = "<CR>", insert = "<C-CR>" },
      accept_diff = { normal = "<C-y>", insert = "<C-y>" },
      show_help = { normal = "g?" },
    },
  },

  config = function(_, opts)
    require("CopilotChat").setup(opts)

    vim.api.nvim_create_autocmd("FileType", {
      pattern = "copilot-chat",
      callback = function()
        vim.opt_local.number = false
        vim.opt_local.relativenumber = false
        vim.opt_local.signcolumn = "no"
        vim.opt_local.foldcolumn = "0"
        vim.opt_local.wrap = true
        vim.opt_local.linebreak = true
        vim.opt_local.conceallevel = 2
      end,
    })
  end,
}

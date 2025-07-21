-- COPILOR GITHUB CHAT
return {
  "CopilotC-Nvim/CopilotChat.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "github/copilot.vim",
  },
  build = "make tiktoken",
  cmd = {
    "CopilotChat",
    "CopilotChatClose",
    "CopilotChatNew",
    "CopilotChatSave",
  },
  opts = {
    window = {
      layout = "float",
      border = "rounded",
      -- dimensioni relative alla finestra corrente
      width = 0.5,
      height = 0.6,
    },
    question_header = "## byHYONS™ ",
    answer_header = "## Copilot  ",
    error_header = "## Error ",
    mappings = {
      complete = { detail = "Use @<Tab> or /<Tab> for options.", insert = "<Tab>" },
      close = { normal = "q", insert = "<C-c>" },
      reset = { normal = "<C-x>", insert = "<C-x>" },
      submit_prompt = { normal = "<CR>", insert = "<C-CR>" },
      accept_diff = { normal = "<C-y>", insert = "<C-y>" },
      show_help = { normal = "g?" },
    },
  },
  config = function(_, opts)
    local chat = require("CopilotChat")
    chat.setup(opts)
  end,
  event = "VeryLazy",
}

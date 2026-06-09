-- DAP • ui debagger
return {
  "rcarriga/nvim-dap-ui",
  event = "VeryLazy",

  dependencies = {
    "mfussenegger/nvim-dap",
    "nvim-neotest/nvim-nio",
  },

  opts = {
    controls = {
      element = "console",
      enabled = true,
      icons = {
        pause = "",
        play = "",
        step_into = "",
        step_over = "",
        step_out = "",
        step_back = "",
        run_last = "",
        terminate = "",
        disconnect = "",
      },
    },

    floating = {
      border = "rounded",
      mappings = {
        close = { "q", "<Esc>" },
      },
    },

    layouts = {
      {
        elements = {
          { id = "scopes", size = 0.45 },
          { id = "stacks", size = 0.25 },
          { id = "watches", size = 0.15 },
          { id = "breakpoints", size = 0.15 },
        },
        size = 45,
        position = "left",
      },
      {
        elements = {
          { id = "console", size = 0.60 },
          { id = "repl", size = 0.40 },
        },
        size = 13,
        position = "bottom",
      },
    },

    mappings = {
      edit = "e",
      expand = { "<CR>", "<2-LeftMouse>" },
      open = "o",
      remove = "d",
      repl = "r",
      toggle = "t",
    },

    render = {
      indent = 1,
      max_value_lines = 100,
    },
  },

  config = function(_, opts)
    local dap = require("dap")
    local dapui = require("dapui")

    dapui.setup(opts)

    vim.api.nvim_set_hl(0, "DapStoppedHl", {
      fg = "#A277FF",
      bg = "#2A2A2A",
      bold = true,
    })

    vim.api.nvim_set_hl(0, "DapStoppedLineHl", {
      bg = "#204028",
      bold = true,
    })

    vim.fn.sign_define("DapStopped", {
      text = "",
      texthl = "DapStoppedHl",
      linehl = "DapStoppedLineHl",
      numhl = "",
    })

    vim.fn.sign_define("DapBreakpoint", {
      text = "",
      texthl = "DiagnosticSignError",
      linehl = "",
      numhl = "",
    })

    vim.fn.sign_define("DapBreakpointCondition", {
      text = "",
      texthl = "DiagnosticSignWarn",
      linehl = "",
      numhl = "",
    })

    vim.fn.sign_define("DapBreakpointRejected", {
      text = "",
      texthl = "DiagnosticSignError",
      linehl = "",
      numhl = "",
    })

    vim.fn.sign_define("DapLogPoint", {
      text = "",
      texthl = "DiagnosticSignInfo",
      linehl = "",
      numhl = "",
    })

    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()
    end

    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close()
    end

    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close()
    end
  end,
}

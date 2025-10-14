-- IdentBlankLine
return {
  -- Guide d'indentazione statiche - scope disattivato
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = "VeryLazy",
    opts = {
      indent = { char = "│", highlight = { "IblIndent" } },
      scope = { enabled = false }, -- lo scope lo fa mini.indentscope
      exclude = {
        filetypes = {
          "help",
          "alpha",
          "dashboard",
          "starter",
          "neo-tree",
          "NvimTree",
          "oil",
          "Trouble",
          "lazy",
          "mason",
          "notify",
          "toggleterm",
          "terminal",
          "spectre_panel",
          "TelescopePrompt",
          "TelescopeResults",
          "noice",
          "Outline",
          "qf",
          "checkhealth",
          "dap-repl",
          "dapui_scopes",
          "dapui_stacks",
          "dapui_watches",
          "dapui_breakpoints",
          "gitcommit",
        },
        buftypes = { "terminal", "nofile", "prompt", "quickfix" },
      },
    },
    config = function(_, opts)
      local hooks = require("ibl.hooks")
      -- colore guide normali (grigio scuro)
      hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
        vim.api.nvim_set_hl(0, "IblIndent", { fg = "#384161", nocombine = true })
      end)
      require("ibl").setup(opts)
    end,
  },

  -- Linea di scope animata
  {
    "echasnovski/mini.indentscope",
    version = "*",
    event = "VeryLazy",
    init = function()
      -- disabilita l’animazione nei buffer UI
      vim.api.nvim_create_autocmd("FileType", {
        pattern = {
          "help",
          "alpha",
          "dashboard",
          "starter",
          "neo-tree",
          "NvimTree",
          "oil",
          "Trouble",
          "lazy",
          "mason",
          "notify",
          "toggleterm",
          "terminal",
          "spectre_panel",
          "TelescopePrompt",
          "TelescopeResults",
          "noice",
          "Outline",
          "qf",
          "checkhealth",
          "dap-repl",
          "dapui_scopes",
          "dapui_stacks",
          "dapui_watches",
          "dapui_breakpoints",
          "gitcommit",
        },
        callback = function()
          vim.b.miniindentscope_disable = true
        end,
      })
    end,
    config = function()
      -- colore della linea scope #547998 #0C4869 #A3B6C9 #009BB2 #384161
      vim.api.nvim_set_hl(0, "MiniIndentscopeSymbol", { fg = "#009BB2", nocombine = true })

      local mis = require("mini.indentscope")
      mis.setup({
        symbol = "┃",
        options = { try_as_border = true },
        draw = {
          delay = 35,
          animation = mis.gen_animation.quadratic({
            easing = "out",
            duration = 45,
            unit = "step",
          }),
        },
      })
    end,
  },
}

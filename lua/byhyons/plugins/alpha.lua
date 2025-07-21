return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    -- Set header
    dashboard.section.header.val = {
      "                                                     ",
      "                                                     ",
      "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
      "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
      "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
      "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
      "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
      "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
      "                                                     ",
      "                   ┓   ┓┏┓┏┏┓┳┓┏┓™                   ",
      "                   ┣┓┓┏┣┫┗┫┃┃┃┃┗┓                    ",
      "                   ┗┛┗┫┛┗┗┛┗┛┛┗┗┛                    ",
      "                      ┛                              ",
      "                                                     ",
      "                                                     ",
    }

    -- Set menu
    dashboard.section.buttons.val = {
      dashboard.button("e", "  • New File", "<cmd>ene<CR>"),
      dashboard.button("ee", "  • Toggle file explorer", "<cmd>NvimTreeToggle<CR>"),
      dashboard.button("ff", "󰱼  • Find File", "<cmd>Telescope find_files<CR>"),
      dashboard.button("fs", "  • Find Word", "<cmd>Telescope live_grep<CR>"),
      dashboard.button("wr", "󰁯  • Restore Session For Current Directory", "<cmd>SessionRestore<CR>"),
      dashboard.button(
        "wt",
        "  • Search Sessions",
        "<cmd>lua require('auto-session.session-lens').search_session()<CR>"
      ),
      dashboard.button("L", "⚙︎  • Lazy", "<cmd>Lazy<CR>"),
      dashboard.button("M", "⍶  • Mason", "<cmd>Mason<CR>"),
      dashboard.button("N", "Ⓝ  • Neorg", "<cmd>Neorg<CR>"),
      dashboard.button("q", "⏻  • Quit NVIM", "<cmd>qa<CR>"),
    }

    -- Send config to alpha
    alpha.setup(dashboard.opts)

    -- Disable folding on alpha buffer
    vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
  end,
}

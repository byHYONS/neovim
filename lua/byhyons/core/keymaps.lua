-- ############################################
-- ##                                        ##
-- ##     KEYMAP FOR THIS NVIM CONFIG        ##
-- ##                                        ##
-- ############################################

local helpers = require("byhyons.core.helpers")

-- <leader> -> space
vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("n", "<leader>", "", { desc = " Menu " })

-- ==========================================
--        GOTO g
-- ==========================================
keymap.set("n", "gS", "<cmd>w<CR>", { desc = "Save File & Formatting" })
keymap.set("n", "gs", "<cmd>noautocmd w<CR>", { desc = "Save File No Formatting" })
keymap.set("n", "gf", "<cmd>Oil --float<CR>", { desc = "Find File Oil Manager" })
keymap.set("n", "g<", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
keymap.set("n", "g>", "<cmd>MaximizerToggle<CR>", { desc = "Maximize/minimize a split" })

-- ==========================================
--        TAB JAMP |
-- ==========================================
-- TAB JUMP
keymap.set("n", "|1", "1gt", { desc = "Go To Tab 1" })
keymap.set("n", "|2", "2gt", { desc = "Go To Tab 2" })
keymap.set("n", "|3", "3gt", { desc = "Go To Tab 3" })
keymap.set("n", "|4", "4gt", { desc = "Go To Tab 4" })
keymap.set("n", "|5", "5gt", { desc = "Go To Tab 5" })
keymap.set("n", "|6", "6gt", { desc = "Go To Tab 6" })
keymap.set("n", "|7", "7gt", { desc = "Go To Tab 7" })
keymap.set("n", "|8", "8gt", { desc = "Go To Tab 8" })
keymap.set("n", "|9", "9gt", { desc = "Go To Tab 9" })
-- reset search
keymap.set("n", "||", ":nohl<CR>", { desc = "Cancel Selection" })

-- ==========================================
--        MENU NVIM <leader>a
-- ==========================================
keymap.set("n", "<leader>aa", "<cmd>Alpha<CR> <cmd>NvimTreeClose<CR>", { desc = "ToGo Menu Alpha" })
keymap.set("n", "<leader>ae", "<cmd>qa<CR>", { desc = "Exit" })
keymap.set("n", "<leader>aq", "<cmd>qa!<CR>", { desc = "Exit Without Saving" })
keymap.set("n", "<leader>al", "<cmd>Lazy<CR>", { desc = "Menu Lazy" })
keymap.set("n", "<leader>am", "<cmd>Mason<CR>", { desc = "Menu Mason" })
keymap.set("n", "<leader>as", "<cmd>ShowkeysToggle<CR>", { desc = "Showkeys Toggle" })
keymap.set("n", "<leader>aw", "<cmd>MarkdownPreviewToggle<CR>", { desc = "Veiw Markdown" })
-- NEORG
keymap.set("n", "<leader>an", ":Neorg<CR>", { desc = "Neorg" })
-- HEX Viewre Bin
keymap.set("n", "<leader>aB", "::HexToggle<CR>", { desc = "Toggle Viewr Bin" })

-- ==========================================
--        COPILOT <leader>c
-- ==========================================
keymap.set("n", "<leader>cc", "<cmd>Copilot<CR>", { desc = "Open Suggestion" })
keymap.set("n", "<leader>cC", "<cmd>CopilotChat<CR>", { desc = "Open Chat" })
keymap.set("n", "<leader>cx", "<cmd>CopilotChatClose<CR>", { desc = "Close Chat" })
keymap.set("n", "<leader>c?", "<cmd>CopilotChatModels<CR>", { desc = "Select Model" })
keymap.set("i", "<S-Tab>", "<Plug>(copilot-dismiss)", { desc = "Cancel Suggestion" })
keymap.set("n", "<leader>cz", helpers.toggle_copilot, { desc = "Toggle On/Off" })

-- ==========================================
--        DEBUGGER <leader>d
-- ==========================================
keymap.set("n", "<leader>db", helpers.dap_toggle_breakpoint, { desc = "Toggle Breakpoint" })
keymap.set("n", "<leader>dd", helpers.dap_continue, { desc = "Play / Continue" })
keymap.set("n", "<leader>du", helpers.dap_ui_toggle, { desc = "Toggle Debug UI" })
keymap.set("n", "<leader>dt", helpers.dap_terminate, { desc = "Stop Debug" })

-- ==========================================
--        TREE WINDOW <leader>e
-- ==========================================
keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" }) -- toggle file explorer
keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle Reveal Current File" }) -- toggle file explorer on current file
keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" }) -- collapse file explorer
keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" }) -- refresh file explorer

-- ==========================================
--        TELESCOPE <leader>f
-- ==========================================
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find files in cwd" })
keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Find recent files" })
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor" })
keymap.set("n", "<leader>fT", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })
keymap.set("n", "<leader>fb", "<cmd>Telescope file_browser<cr>", { desc = "Find Browser" })
keymap.set("n", "<leader>fM", "<cmd>Telescope marks<CR>", { desc = "Telescope Marks" })
keymap.set("n", "<leader>fR", "<cmd>Telescope registers<CR>", { desc = "Telescope Registers" })
keymap.set("n", "<leader>fS", helpers.telescope_document_symbols, { desc = "Find Symbols" })

-- ==========================================
--        GITHUB <leader>g
-- ==========================================
-- GitHub
keymap.set("n", "<leader>gg", "<cmd>LazyGit<CR>", {
  desc = "Open LazyGit",
})
keymap.set("n", "<leader>gr", "<cmd>lua CreateGitHubRepo()<CR>", {
  desc = "Create GitHub Repository",
})
keymap.set("n", "<leader>gc", "<cmd>lua require('custom.clone-github').CloneRepoFromLink()<CR>", {
  desc = "Clone Repository via Link",
})
keymap.set("n", "<leader>gm", "<cmd>lua require('custom.clone-github').CloneRepoFromList()<CR>", {
  desc = "Clone Repository from List",
})
keymap.set("n", "<leader>gi", function()
  local output = vim.fn.system({ "git", "init", vim.fn.getcwd() })
  print(output)
end, { desc = "Git Init" })

-- ==========================================
--        GIT VIEW <leader>h
-- ==========================================
-- navigation
keymap.set("n", "]h", helpers.gitsigns_next_hunk, { desc = "Next Hunk" })
keymap.set("n", "[h", helpers.gitsigns_prev_hunk, { desc = "Prev Hunk" })
-- stage
keymap.set("n", "<leader>hs", helpers.gitsigns_stage_hunk, { desc = "Stage Hunk" })
keymap.set("n", "<leader>hr", helpers.gitsigns_reset_hunk, { desc = "Reset Hunk" })
keymap.set("n", "<leader>hS", helpers.gitsigns_stage_buffer, { desc = "Stage Buffer" })
keymap.set("n", "<leader>hR", helpers.gitsigns_reset_buffer, { desc = "Reset Buffer" })
-- hunk
keymap.set("v", "<leader>hs", helpers.gitsigns_stage_hunk_visual, { desc = "Stage Hunk" })
keymap.set("v", "<leader>hr", helpers.gitsigns_reset_hunk_visual, { desc = "Reset Hunk" })
keymap.set("n", "<leader>hp", helpers.gitsigns_preview_hunk, { desc = "Preview Hunk" })
keymap.set("n", "<leader>ho", helpers.gitsigns_setloclist, { desc = "Open Hunks List" })
-- blame
keymap.set("n", "<leader>hb", helpers.gitsigns_blame_line, { desc = "Blame Line" })
keymap.set("n", "<leader>hB", helpers.gitsigns_toggle_blame, { desc = "Toggle Line Blame" })
-- diff
keymap.set("n", "<leader>hd", helpers.gitsigns_diff_this, { desc = "Diff This" })
keymap.set("n", "<leader>hD", helpers.gitsigns_diff_this_previous, { desc = "Diff This Previous" })
-- other
keymap.set("n", "<leader>hi", helpers.gitsigns_preview_hunk_inline, {
  desc = "Preview Hunk Inline",
})
keymap.set({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", { desc = "Select Hunk" })
keymap.set("n", "<leader>hw", helpers.gitsigns_toggle_word_diff, { desc = "Word Diff" })
keymap.set("n", "<leader>hc", function()
  vim.cmd("wincmd h")
  vim.cmd("diffoff!")
  vim.cmd("close")
end, {
  desc = "Close Diff",
})

-- ==========================================
--        INFO CODE <leader>i
-- ==========================================
-- Keybindings per lspsaga
keymap.set("n", "<leader>if", "<cmd>Lspsaga finder<CR>", { desc = "LSP Finder" }) -- LSP Finder
keymap.set("n", "<leader>id", "<cmd>Lspsaga peek_definition<CR>", { desc = "Peek Definition" }) -- Peek Definition
keymap.set("n", "<leader>it", "<cmd>Lspsaga peek_type_definition<CR>", { desc = "Peek Type Definition" }) -- Peek Type Definition
keymap.set("n", "<leader>ih", "<cmd>Lspsaga hover_doc<CR>", { desc = "Hover Documentation" }) -- Hover Documentation
keymap.set("n", "<leader>ia", "<cmd>Lspsaga code_action<CR>", { desc = "Code Action" }) -- Code Action
keymap.set("n", "<leader>il", "<cmd>Lspsaga outline<CR>", { desc = "Outline" }) -- Outline
-- Aggiungi le keybindings per la call hierarchy
keymap.set("n", "<leader>ii", "<cmd>Lspsaga incoming_calls<CR>", { desc = "Incoming Calls" }) -- Incoming Calls
keymap.set("n", "<leader>io", "<cmd>Lspsaga outgoing_calls<CR>", { desc = "Outgoing Calls" }) -- Outgoing Calls

-- ==========================================
--        KULALA API <leader>k
-- ==========================================
-- Test API
keymap.set("n", "<leader>kr", function()
  require("kulala").run()
end, { desc = "Run Request" })
keymap.set("n", "<leader>kc", function()
  require("kulala").close()
end, { desc = "Close Response" })
keymap.set("n", "<leader>ks", function()
  require("kulala").show_stats()
end, { desc = "Show Stats" })
keymap.set("n", "<leader>ki", function()
  require("kulala").inspect()
end, { desc = "Inspect Request" })

-- ==========================================
--        mySQL UI <leader>m
-- ==========================================
-- Integrazione mySQL
keymap.set("n", "<leader>mq", "<cmd>w<CR>", { desc = "Esegui query nel buffer SQL" })
keymap.set("n", "<leader>mc", "<cmd>DBUIAddConnection<CR>", { desc = "Aggiungi database" })
keymap.set("n", "<leader>md", "<cmd>bdelete<CR>", { desc = "Cancella buffer" })
-- DataBase
keymap.set("n", "<leader>mu", function()
  vim.cmd("tabnew")
  vim.defer_fn(function()
    vim.cmd("DBUIToggle")
  end, 300)
end, {
  desc = "Open Database UI",
})
keymap.set("n", "<leader>ma", function()
  vim.cmd("wincmd j")
  vim.cmd("normal! j")
  vim.cmd("normal! za")
end, {
  desc = "Open Table",
})

-- ==========================================
--        FORMATTING <leader>r
-- ==========================================
-- Formatting
keymap.set({ "n", "v" }, "<leader>rf", function()
  require("conform").format({
    lsp_fallback = true,
    async = false,
    timeout_ms = 1000,
  })
end, { desc = "Formatting File" })
-- CSS px/rem
keymap.set("n", "<leader>rrx", "<cmd>PxToRemCursor<CR>", { desc = "Convert px to rem Cursor" })
keymap.set("n", "<leader>rrxl", "<cmd>PxToRemLine<CR>", { desc = "Convert px to rem Line" })
keymap.set("n", "<leader>rrr", "<cmd>PxToRem<CR>", { desc = "Convert px to rem" })
keymap.set("n", "<leader>rrp", "<cmd>RemToPx<CR>", { desc = "Convert rem to px" })
keymap.set("n", "<leader>rrt", "<cmd>TogglePxRem<CR>", { desc = "Toggle px/rem" })

-- ==========================================
--        SEARCH FZF <leader>s
-- ==========================================
keymap.set("n", "<leader>sp", "<cmd>FzfLua files<cr>", { desc = "Search in Project" })
keymap.set("n", "<leader>sh", "<cmd>lua require('fzf-lua').files({ cwd = '~' })<cr>", { desc = "Search in Home" })
keymap.set("n", "<leader>sF", helpers.fzf_search_in_folder, { desc = "Search in Folder" })
keymap.set("n", "<leader>sl", "<cmd>FzfLua live_grep_native<cr>", { desc = "Live Grep Project" })
keymap.set(
  "n",
  "<leader>sL",
  "<cmd>lua require('fzf-lua').live_grep_native({ cwd = '/' })<cr>",
  { desc = "Live Grep Systems" }
)
keymap.set("n", "<leader>sg", "<cmd>FzfLua git_status<cr>", { desc = "Git Status" })
keymap.set("n", "<leader>sG", helpers.fzf_git_log, { desc = "Git Log" })
keymap.set("n", "<leader>sb", "<cmd>FzfLua buffers<cr>", { desc = "Open Buffers" })
keymap.set(
  "n",
  "<leader>sf",
  "<cmd>lua require('fzf-lua').combine({ pickers = 'oldfiles;git_files' })<CR>",
  { desc = "Recent Files" }
)
keymap.set("n", "<leader>sP", "<cmd>FzfLua global<CR>", { desc = "Global Picker" })
keymap.set("n", "<leader>ss", "<cmd>FzfLua resume<CR>", { desc = "Resume Search" })

-- ==========================================
--        TOOL CODE <leader>t
-- ==========================================
-- Laravel Neovim
keymap.set("n", "<leader>ta", "<cmd>Laravel artisan<CR>", { desc = "Laravel: Artisan" })
keymap.set("n", "<leader>tr", "<cmd>Laravel routes<CR>", { desc = "Laravel: Routes" })
keymap.set("n", "<leader>tm", "<cmd>LaravelMake<CR>", { desc = "Laravel: Make" })
--Laravel Tools
keymap.set("n", "<leader>tlc", "<cmd>LaravelController<CR>", { desc = "Search: Controller" })
keymap.set("n", "<leader>tlm", "<cmd>LaravelModel<CR>", { desc = "Search: Model" })
keymap.set("n", "<leader>tlv", "<cmd>LaravelView<CR>", { desc = "Search: View" })
keymap.set("n", "<leader>tlr", "<cmd>LaravelRoute<CR>", { desc = "Search: Route" })
-- Open Posting in Terminal
keymap.set("n", "<leader>tA", helpers.open_posting, { desc = "Terminal: Open API" })
-- Open Sqlit in Terminal
keymap.set("n", "<leader>tS", helpers.open_sqlit, { desc = "Terminal: Open SQLite" })
-- Open Gemini in Terminal Float
keymap.set("n", "<leader>tG", helpers.open_gemini_terminal, { desc = "Terminal: Gemini" })

-- ==========================================
--        SESSION <leader>w
-- ==========================================
-- Maximize Buffer
keymap.set("n", "<leader>wm", "<cmd>MaximizerToggle<CR>", { desc = "Maximize Buffer" })
-- Sessione
keymap.set("n", "<leader>wr", "<cmd>SessionRestore<CR>", { desc = "Restore Session" }) -- restore last workspace session for current directory
keymap.set("n", "<leader>ws", "<cmd>SessionSave<CR>", { desc = "Save Session" }) -- save workspace session for current working directory
keymap.set("n", "<leader>wt", function()
  require("auto-session.session-lens").search_session({})
end, { desc = "Search Session" })
-- window management
keymap.set("n", "<leader>wv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>wh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>we", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>wx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window
-- Open new tab
keymap.set("n", "<leader>wn", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>wf", "<cmd>tabnew %<CR>", { desc = "Current buffer in new tab" }) --  move current buffer to new tabrent buffer to new tab

-- ==========================================
--        DIAGNOSTICS <leader>x
-- ==========================================
-- Diagnostics
keymap.set("n", "<leader>xw", "<cmd>Trouble diagnostics toggle<CR>", {
  desc = "Workspace Diagnostics",
})
keymap.set("n", "<leader>xd", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>", {
  desc = "Document Diagnostics",
})
keymap.set("n", "<leader>xq", "<cmd>Trouble quickfix toggle<CR>", {
  desc = "Quickfix List",
})
keymap.set("n", "<leader>xl", "<cmd>Trouble loclist toggle<CR>", {
  desc = "Location List",
})
keymap.set("n", "<leader>xt", "<cmd>Trouble todo toggle<CR>", {
  desc = "Todo Comments",
})

-- ==========================================
--        TERMINALS <leader>z
-- ==========================================
keymap.set("n", "<leader>zo", "<cmd>tabnew<CR>:terminal<CR><Cmd>startinsert<CR>", { desc = "Open Wide Terminal" })
keymap.set("n", "<leader>zt", ":1ToggleTerm direction=horizontal<CR>", { desc = "Term Toggle" })
keymap.set("n", "<leader>zf", ":2ToggleTerm direction=float<CR>", { desc = "Term Float Toggle" })
keymap.set("n", "<leader>zL", ":3TermExec direction=float cmd='php artisan serve'<CR>", { desc = "On Server Laravel" })
keymap.set("n", "<leader>zN", ":4TermExec direction=float cmd='npm run dev'<CR>", { desc = "On Server Node" })
keymap.set("n", "<leader>zr", helpers.save_and_run_python, { desc = "Output Python" })
keymap.set("n", "<leader>zp", ":5TermExec direction=float cmd='python3 %'<CR>", { desc = "TermFloat Python" })
keymap.set("t", "<leader>zq", helpers.close_python_terminal, { desc = "Off Output" })
keymap.set(
  "n",
  "<leader>zG",
  ":6TermExec direction=float cmd='browser-sync start --server --files \"**/*.html,**/*.css,**/*.js\"'<CR>",
  { desc = "Go Live" }
)
keymap.set("n", "<leader>zd", helpers.reset_all_terminals, { desc = "Reset All Terms" })
keymap.set("n", "<leader>zx", function()
  vim.cmd("wincmd j")
  vim.defer_fn(function()
    vim.cmd("startinsert")
  end, 30)
end, { desc = "Focus Term" })
keymap.set("n", "<leader>zj", helpers.open_floating_job_terminal, { desc = "Term Float Job" })
keymap.set("n", "<leader>zJ", helpers.toggle_floating_job_terminal, { desc = "View Job Terminal" })

-- ==========================================
--        GENERAL SHORTCUTS
-- ==========================================
-- Insert exit
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })
-- i-crement/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement
-- Delete without yanking
keymap.set("v", "X", [["_d]], { desc = "Delete without yanking" })
-- Join lines without moving cursor
keymap.set("n", "J", "mzJ`z", { desc = "Join lines keep cursor" })
-- Keep search results centered
keymap.set("n", "n", "nzzzv", { desc = "Next search result centered" })
keymap.set("n", "N", "Nzzzv", { desc = "Previous search result centered" })
-- Keep selection when indenting
keymap.set("v", "<", "<gv", { desc = "Unindent and keep selection" })
keymap.set("v", ">", ">gv", { desc = "Indent and keep selection" })

-- ==========================================
--        OTHER \
-- ==========================================
-- Flash
keymap.set({ "n", "x", "o" }, "\\s", function()
  require("flash").jump()
end, { desc = "Flash" })
keymap.set({ "n", "x", "o" }, "\\S", function()
  require("flash").treesitter()
end, { desc = "Flash Treesitter" })
keymap.set("o", "\\r", function()
  require("flash").remote()
end, { desc = "Remote Flash" })
keymap.set({ "o", "x" }, "\\R", function()
  require("flash").treesitter_search()
end, { desc = "Treesitter Search" })
keymap.set("c", "<C-s>", function()
  require("flash").toggle()
end, { desc = "Toggle Flash Search" })

-- ==========================================
--        SHORTCUTS CTRL
-- ==========================================
-- Aggiungi le keybindings per la navigazione nelle finestre di anteprima
keymap.set("n", "<C-e>", "<cmd>Lspsaga scroll_down<CR>", { desc = "Scroll Down" }) -- Scroll Down
keymap.set("n", "<C-y>", "<cmd>Lspsaga scroll_up<CR>", { desc = "Scroll Up" }) -- Scroll Up
-- Uscire da modalità terminale
keymap.set("t", "<C-x>", "<C-\\><C-n>", { noremap = true, silent = true })
keymap.set("t", "<Esc>", "<C-\\><C-n>", {
  noremap = true,
  silent = true,
  desc = "Exit Terminal Mode",
})

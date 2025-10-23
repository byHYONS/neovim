vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

keymap.set("n", "<leader>", "", { desc = " Menu" })

keymap.set("n", "gs", "<cmd>w<CR>", { desc = "Save File" })
keymap.set("n", "gS", "<cmd>noautocmd w<CR>", { desc = "Save File Without Formatting" })
keymap.set("n", "gf", "<cmd>Oil --float<CR>", { desc = "Find File Oil Manager" })

keymap.set("n", "<leader>a", "", { desc = " Menu Neovim UI" })
keymap.set("n", "<leader>aa", "<cmd>Alpha<CR> <cmd>NvimTreeClose<CR>", { desc = "ToGo Menu Alpha" })
keymap.set("n", "<leader>ae", "<cmd>qa<CR>", { desc = "Exit" })
keymap.set("n", "<leader>aq", "<cmd>qa!<CR>", { desc = "Exit Without Saving" })
keymap.set("n", "<leader>al", "<cmd>Lazy<CR>", { desc = "Menu Lazy" })
keymap.set("n", "<leader>am", "<cmd>Mason<CR>", { desc = "Menu Mason" })
keymap.set("n", "<leader>as", "<cmd>ShowkeysToggle<CR>", { desc = "Showkeys Toggle" })
keymap.set("n", "<leader>aw", "<cmd>MarkdownPreviewToggle<CR>", { desc = "Veiw Markdown" })
-- NEORG
keymap.set("n", "<leader>an", ":Neorg<CR>", { desc = "Neorg" })

-- Insert exit
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

keymap.set("n", "|", "", { desc = " Tab Jump" })
keymap.set("n", "||", ":nohl<CR>", { desc = "Cancel Selection" })

-- i-crement/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>wv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>wh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>we", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>wx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

-- Open new tab
keymap.set("n", "<leader>wn", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>wf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tabrent buffer to new tab

-- Keybindings per lspsaga
keymap.set("n", "<leader>i", "", { desc = " Code Info" })
-- Definisci le keybindings di lspsaga sotto <leader>i
keymap.set("n", "<leader>if", "<cmd>Lspsaga lsp_finder<CR>", { desc = "LSP Finder" }) -- LSP Finder
keymap.set("n", "<leader>id", "<cmd>Lspsaga peek_definition<CR>", { desc = "Peek Definition" }) -- Peek Definition
keymap.set("n", "<leader>it", "<cmd>Lspsaga peek_type_definition<CR>", { desc = "Peek Type Definition" }) -- Peek Type Definition
keymap.set("n", "<leader>ih", "<cmd>Lspsaga hover_doc<CR>", { desc = "Hover Documentation" }) -- Hover Documentation
keymap.set("n", "<leader>ia", "<cmd>Lspsaga code_action<CR>", { desc = "Code Action" }) -- Code Action
keymap.set("n", "<leader>il", "<cmd>Lspsaga outline<CR>", { desc = "Outline" }) -- Outline

-- Aggiungi le nuove keybindings per la diagnostica
keymap.set("n", "<leader>is", "<cmd>Lspsaga show_cursor_diagnostics<CR>", { desc = "Show Cursor Diagnostics" }) -- Show Cursor Diagnostics
keymap.set("n", "<leader>in", "<cmd>Lspsaga diagnostic_jump_next<CR>", { desc = "Jump to Next Diagnostic" }) -- Jump to Next Diagnostic
keymap.set("n", "<leader>ip", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { desc = "Jump to Previous Diagnostic" }) -- Jump to Previous Diagnostic

-- Aggiungi le keybindings per la call hierarchy
keymap.set("n", "<leader>ii", "<cmd>Lspsaga incoming_calls<CR>", { desc = "Incoming Calls" }) -- Incoming Calls
keymap.set("n", "<leader>io", "<cmd>Lspsaga outgoing_calls<CR>", { desc = "Outgoing Calls" }) -- Outgoing Calls

-- Aggiungi le keybindings per la navigazione nelle finestre di anteprima
keymap.set("n", "<C-e>", "<cmd>Lspsaga scroll_down<CR>", { desc = "Scroll Down" }) -- Scroll Down
keymap.set("n", "<C-y>", "<cmd>Lspsaga scroll_up<CR>", { desc = "Scroll Up" }) -- Scroll Up

-- Uscire da modalità terminale
keymap.set("t", "<C-x>", "<C-\\><C-n>", { noremap = true, silent = true })

-- INFO: kaymaps for dap:
-- Keymaps nvim-dap
-- ### Breakpoints ###
keymap.set("n", "<leader>d", "", { desc = " Debug" })
keymap.set("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", { desc = "Toggle Breakpoint" })
keymap.set(
  "n",
  "<leader>dc",
  "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>",
  { desc = "Conditional Breakpoint" }
)
keymap.set(
  "n",
  "<leader>dl",
  "<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>",
  { desc = "Log Point" }
)
keymap.set("n", "<leader>dx", "<cmd>lua require'dap'.clear_breakpoints()<cr>", { desc = "Clear Breakpoints" })
keymap.set("n", "<leader>dy", "<cmd>Telescope dap list_breakpoints<cr>", { desc = "List Breakpoints" })

-- ### Esecuzione ###
keymap.set("n", "<leader>dd", "<cmd>lua require'dap'.continue()<cr>", { desc = "Continue" })
keymap.set("n", "<leader>dj", "<cmd>lua require'dap'.step_over()<cr>", { desc = "Step Over" })
keymap.set("n", "<leader>dk", "<cmd>lua require'dap'.step_into()<cr>", { desc = "Step Into" })
keymap.set("n", "<leader>do", "<cmd>lua require'dap'.step_out()<cr>", { desc = "Step Out" })

-- ### Controllo della sessione ###
keymap.set(
  "n",
  "<leader>dX",
  "<cmd>lua require('dap').disconnect(); require('dapui').close()<cr>",
  { desc = "Disconnect" }
)
keymap.set(
  "n",
  "<leader>dt",
  "<cmd>lua require('dap').terminate(); require('dapui').close()<cr>",
  { desc = "Terminate" }
)

-- ### REPL e Run Last ###
keymap.set("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", { desc = "Toggle REPL" })
keymap.set("n", "<leader>dll", "<cmd>lua require'dap'.run_last()<cr>", { desc = "Run Last" })

-- ### UI Widgets ###
keymap.set("n", "<leader>dh", function()
  require("dap.ui.widgets").hover()
end, { desc = "Hover Widget" })
keymap.set("n", "<leader>d?", function()
  local widgets = require("dap.ui.widgets")
  widgets.centered_float(widgets.scopes)
end, { desc = "Centered Float Scopes" })

-- ### Integrazione con Telescope ###
keymap.set("n", "<leader>df", "<cmd>Telescope dap frames<cr>", { desc = "DAP Frames" })
keymap.set("n", "<leader>dg", "<cmd>Telescope dap commands<cr>", { desc = "DAP Commands" })
keymap.set("n", "<leader>de", function()
  require("telescope.builtin").diagnostics({ default_text = ":E:" })
end, { desc = "DAP Diagnostics" })

-- Integrazione mySQL
keymap.set("n", "<leader>m", "", { desc = " Database" })
keymap.set("n", "<leader>mq", "<cmd>w<CR>", { desc = "Esegui query nel buffer SQL" })
keymap.set("n", "<leader>mc", "<cmd>DBUIAddConnection<CR>", { desc = "Aggiungi database" })
keymap.set("n", "<leader>md", "<cmd>bdelete<CR>", { desc = "Cancella buffer" })

-- Laravel Neovim
keymap.set("n", "<leader>t", "", { desc = " Code Tools" })
keymap.set("n", "<leader>ta", "<cmd>Laravel artisan<CR>", { desc = "Laravel: Artisan" })
keymap.set("n", "<leader>tr", "<cmd>Laravel routes<CR>", { desc = "Laravel: Routes" })

-- CHAT COPILOT
-- Copilot Chat sotto <leader>c
keymap.set("n", "<leader>c", "", { desc = " AI Copilot Chat" })
keymap.set("n", "<leader>co", "<cmd>Copilot<CR>", { desc = "Open Copilot" })
keymap.set("n", "<leader>cO", "<cmd>CopilotChat<CR>", { desc = "Open Chat" })
keymap.set("n", "<leader>cc", "<cmd>CopilotChatClose<CR>", { desc = "Close Chat" })
keymap.set("n", "<leader>cs", "<cmd>CopilotChatSave<CR>", { desc = "Save History" })
-- Code-related actions
keymap.set("n", "<leader>ce", "<cmd>CopilotChatExplain<CR>", { desc = "Explain Code" })
keymap.set("n", "<leader>cr", "<cmd>CopilotChatReview<CR>", { desc = "Review Code" })
keymap.set("n", "<leader>ct", "<cmd>CopilotChatTests<CR>", { desc = "Gen Tests" })
keymap.set("n", "<leader>cm", "<cmd>CopilotChatCommit<CR>", { desc = "Commit Message" })
-- Settings & helpers
keymap.set("n", "<leader>c?", "<cmd>CopilotChatModels<CR>", { desc = "Select Model" })
keymap.set("n", "<leader>c!", "<cmd>CopilotChatAgents<CR>", { desc = "Select Agent" })
keymap.set("i", "<S-Tab>", "<Plug>(copilot-dismiss)", { desc = "Cancella Suggerimento" })
keymap.set("n", "<leader>cx", function()
  copilot_enabled = not copilot_enabled
  if copilot_enabled then
    vim.cmd("Copilot disable")
    print("Copilot disabilitato")
  else
    vim.cmd("Copilot enable")
    print("Copilot abilitato")
  end
end, { desc = "Copilot Toggle" })

-- FZF
keymap.set("n", "<leader>s", "", { desc = " Search FZF" })
keymap.set("n", "<leader>sp", "<cmd>FzfLua files<cr>", { desc = "Search in Project" })
keymap.set("n", "<leader>sh", "<cmd>lua require('fzf-lua').files({ cwd = '~' })<cr>", { desc = "Search in Home" })
keymap.set(
  "n",
  "<leader>sd",
  "<cmd>lua local path=vim.fn.input('Cerca in cartella: ', vim.loop.cwd(), 'dir') if vim.fn.isdirectory(path)==1 then require('fzf-lua').files({cwd=path}) else vim.notify('Cartella non valida: '..path, vim.log.levels.ERROR) end<cr>",
  { desc = "Search in Folder" }
)
keymap.set("n", "<leader>sl", "<cmd>FzfLua live_grep_native<cr>", { desc = "Live Grep Project" })
keymap.set(
  "n",
  "<leader>sL",
  "<cmd>lua require('fzf-lua').live_grep_native({ cwd = '/' })<cr>",
  { desc = "Live Grep in Systems" }
)
keymap.set("n", "<leader>su", "<cmd>FzfLua undo<cr>", { desc = "Undo Tree" })
keymap.set("n", "<leader>sg", "<cmd>FzfLua git_status<cr>", { desc = "Git Status" })
keymap.set("n", "<leader>sb", "<cmd>FzfLua buffers<cr>", { desc = "Open Buffers" })
keymap.set("n", "<leader>sy", "<cmd>FzfLua registers<cr>", { desc = "Registers Yank" })
keymap.set(
  "n",
  "<leader>sc",
  "<cmd>lua require('fzf-lua').combine({ pickers = 'oldfiles;git_files' })<CR>",
  { desc = "Combine Files" }
)
keymap.set("n", "<leader>sP", "<cmd>FzfLua global<CR>", { desc = "Global Picker" })
keymap.set("n", "<leader>ss", "<cmd>FzfLua resume<CR>", { desc = "Resume Search" })

-- Terminale
keymap.set("n", "<leader>zx", function()
  vim.cmd("wincmd j")
  vim.defer_fn(function()
    vim.cmd("startinsert")
  end, 30)
end, { desc = "Focus Terminale" })

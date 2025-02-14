vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

keymap.set("n", "<leader>a", "", { desc = " Menu Neovim" })
keymap.set("n", "<leader>aa", "<cmd>Alpha<CR>", { desc = "ToGo Menu Alpha" })
keymap.set("n", "<leader>ae", "<cmd>qa<CR>", { desc = "Exit" })
keymap.set("n", "<leader>aq", "<cmd>qa!<CR>", { desc = "Exit Without Saving" })
keymap.set("n", "<leader>as", "<cmd>w<CR>", { desc = "Save file" })
keymap.set("n", "<leader>al", "<cmd>Lazy<CR>", { desc = "Menu Lazy" })
keymap.set("n", "<leader>am", "<cmd>Mason<CR>", { desc = "Menu Mason" })

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

keymap.set("n", "<leader><leader>", ":nohl<CR>", { desc = "Clear search highlights" })

-- i-crement/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>s", "", { desc = " Split Window" })
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

-- Open new tab
keymap.set("n", "<leader>t", "", { desc = " Menu Tab" })
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tabrent buffer to new tab

-- Open CHATGPT
keymap.set("n", "<leader>i", "", { desc = " Code Info" })
keymap.set("n", "<leader>ic", "<cmd>ChatGPT<CR>", { desc = "Open chatGPT" })

-- Keybindings per lspsaga
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
keymap.set("n", "<leader>c", "", { desc = " Debug" })
keymap.set("n", "<leader>cb", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", { desc = "Toggle Breakpoint" })
keymap.set(
  "n",
  "<leader>cc",
  "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>",
  { desc = "Conditional Breakpoint" }
)
keymap.set(
  "n",
  "<leader>cl",
  "<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>",
  { desc = "Log Point" }
)
keymap.set("n", "<leader>cx", "<cmd>lua require'dap'.clear_breakpoints()<cr>", { desc = "Clear Breakpoints" })
keymap.set("n", "<leader>cy", "<cmd>Telescope dap list_breakpoints<cr>", { desc = "List Breakpoints" })

-- ### Esecuzione ###
keymap.set("n", "<leader>cd", "<cmd>lua require'dap'.continue()<cr>", { desc = "Continue" })
keymap.set("n", "<leader>cj", "<cmd>lua require'dap'.step_over()<cr>", { desc = "Step Over" })
keymap.set("n", "<leader>ck", "<cmd>lua require'dap'.step_into()<cr>", { desc = "Step Into" })
keymap.set("n", "<leader>co", "<cmd>lua require'dap'.step_out()<cr>", { desc = "Step Out" })

-- ### Controllo della sessione ###
keymap.set(
  "n",
  "<leader>cX",
  "<cmd>lua require('dap').disconnect(); require('dapui').close()<cr>",
  { desc = "Disconnect" }
)
keymap.set(
  "n",
  "<leader>ct",
  "<cmd>lua require('dap').terminate(); require('dapui').close()<cr>",
  { desc = "Terminate" }
)

-- ### REPL e Run Last ###
keymap.set("n", "<leader>cr", "<cmd>lua require'dap'.repl.toggle()<cr>", { desc = "Toggle REPL" })
keymap.set("n", "<leader>cll", "<cmd>lua require'dap'.run_last()<cr>", { desc = "Run Last" })

-- ### UI Widgets ###
keymap.set("n", "<leader>ch", function()
  require("dap.ui.widgets").hover()
end, { desc = "Hover Widget" })
keymap.set("n", "<leader>c?", function()
  local widgets = require("dap.ui.widgets")
  widgets.centered_float(widgets.scopes)
end, { desc = "Centered Float Scopes" })

-- ### Integrazione con Telescope ###
keymap.set("n", "<leader>cf", "<cmd>Telescope dap frames<cr>", { desc = "DAP Frames" })
keymap.set("n", "<leader>cg", "<cmd>Telescope dap commands<cr>", { desc = "DAP Commands" })
keymap.set("n", "<leader>ce", function()
  require("telescope.builtin").diagnostics({ default_text = ":E:" })
end, { desc = "DAP Diagnostics" })

-- Integrazione mySQL
keymap.set("n", "<leader>m", "", { desc = " Database" })
keymap.set("n", "<leader>mq", "<cmd>w<CR>", { desc = "Esegui query nel buffer SQL" })
keymap.set("n", "<leader>mc", "<cmd>DBUIAddConnection<CR>", { desc = "Aggiungi database" })
keymap.set("n", "<leader>md", "<cmd>bdelete<CR>", { desc = "Cancella buffer" })

vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tabrent buffer to new tab

-- Keybindings per lspsaga
-- Definisci le keybindings di lspsaga sotto <leader>i
keymap.set("n", "<leader>if", "<cmd>Lspsaga lsp_finder<CR>", { desc = "LSP Finder" }) -- LSP Finder
keymap.set("n", "<leader>id", "<cmd>Lspsaga peek_definition<CR>", { desc = "Peek Definition" }) -- Peek Definition
keymap.set("n", "<leader>it", "<cmd>Lspsaga peek_type_definition<CR>", { desc = "Peek Type Definition" }) -- Peek Type Definition
keymap.set("n", "<leader>ih", "<cmd>Lspsaga hover_doc<CR>", { desc = "Hover Documentation" }) -- Hover Documentation
keymap.set("n", "<leader>ic", "<cmd>Lspsaga code_action<CR>", { desc = "Code Action" }) -- Code Action
keymap.set("n", "<leader>ir", "<cmd>Lspsaga rename<CR>", { desc = "Rename" }) -- Rename
keymap.set("n", "<leader>iR", "<cmd>Lspsaga rename ++project<CR>", { desc = "Rename Project" }) -- Rename Project
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

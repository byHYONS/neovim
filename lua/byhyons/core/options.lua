-- ############################################
-- ##                                        ##
-- ##               OPTIONS                  ##
-- ##                                        ##
-- ############################################

vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

opt.relativenumber = true
opt.number = true

-- tabs & indentation
opt.tabstop = 2 -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.softtabstop = 2 -- Insert mode tab width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one

opt.wrap = false
opt.laststatus = 3 -- 0 nessuna Barra Stato, 1 BS solo con più finestre, 2 BS per ogni split, 3 unica BS
vim.opt.isfname:append("@-@") -- unisce parole separate da simbili

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

opt.cursorline = true

-- turn on termguicolors for tokyonight colorscheme to work
opt.termguicolors = true
opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes" -- show sign column so that text doesn't shift

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- turn off swapfile
opt.swapfile = false

-- conferma operazioni
opt.confirm = true

-- mantiene il cursore 10 righe sotto e sopra
opt.scrolloff = 10

-- visualizza caretteri invisibili
opt.list = true
opt.listchars = {
  tab = "» ",
  trail = "·",
  nbsp = "␣",
}

-- Block lampeggiante in normal/visual/command, cursor a barra lampeggiante in insert
vim.opt.guicursor = table.concat({
  -- Normal, Visual, Command: block che lampeggerà
  "n-v-c:block-blinkon1-blinkoff500-blinkwait200",
  -- Insert: cursore verticale (25% width) lampeggiante
  "i:ver25-blinkon1-blinkoff500-blinkwait200",
  -- Replace: barra orizzontale (20% height) lampeggiante
  "r:hor20-blinkon1-blinkoff500-blinkwait200",
}, ",")

-- Feedback visivo per yank
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  callback = function()
    vim.hl.on_yank()
  end,
})

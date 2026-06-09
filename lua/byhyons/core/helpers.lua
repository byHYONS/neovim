-- ############################################
-- ##                                        ##
-- ##               HELPERS                  ##
-- ##                                        ##
-- ############################################

local M = {}

-- =====================================
--      HELPER FOR COPILOT
-- =====================================
local copilot_enabled = true

function M.toggle_copilot()
  copilot_enabled = not copilot_enabled
  if copilot_enabled then
    vim.cmd("Copilot enable")
    print("Copilot abilitato")
  else
    vim.cmd("Copilot disable")
    print("Copilot disabilitato")
  end
end

-- =====================================
--      HELPER FOR TERMINAL
-- =====================================
local pythonTerm = nil

function M.save_and_run_python()
  vim.cmd("write")

  local Terminal = require("toggleterm.terminal").Terminal
  local cmdM = "python3 " .. vim.fn.expand("%") .. "; exec bash"

  if pythonTerm then
    vim.cmd("normal! <C-w>J")
    pythonTerm:send("\n" .. cmdM)

    vim.defer_fn(function()
      vim.cmd("startinsert")
    end, 200)
  else
    pythonTerm = Terminal:new({
      cmd = cmdM,
      direction = "horizontal",
    }):toggle()
  end
end

function M.close_python_terminal()
  if pythonTerm then
    vim.cmd("stopinsert")
    pythonTerm:close()

    if pythonTerm.bufnr and vim.api.nvim_buf_is_valid(pythonTerm.bufnr) then
      vim.api.nvim_buf_delete(pythonTerm.bufnr, { force = true })
    end

    pythonTerm = nil
  end
end

function M.reset_all_terminals()
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_get_option_value("filetype", { buf = buf }) == "toggleterm" then
      vim.api.nvim_buf_delete(buf, { force = true })
    end
  end
end

-- =====================================
--      HELPER FOR GITSINGS
-- =====================================
function M.gitsigns_next_hunk()
  require("gitsigns").nav_hunk("next")
end

function M.gitsigns_prev_hunk()
  require("gitsigns").nav_hunk("prev")
end

function M.gitsigns_stage_hunk()
  require("gitsigns").stage_hunk()
end

function M.gitsigns_reset_hunk()
  require("gitsigns").reset_hunk()
end

function M.gitsigns_stage_hunk_visual()
  require("gitsigns").stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
end

function M.gitsigns_reset_hunk_visual()
  require("gitsigns").reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
end

function M.gitsigns_stage_buffer()
  require("gitsigns").stage_buffer()
end

function M.gitsigns_reset_buffer()
  require("gitsigns").reset_buffer()
end

function M.gitsigns_preview_hunk()
  require("gitsigns").preview_hunk()
end

function M.gitsigns_blame_line()
  require("gitsigns").blame_line({ full = true })
end

function M.gitsigns_toggle_blame()
  require("gitsigns").toggle_current_line_blame()
end

function M.gitsigns_diff_this()
  require("gitsigns").diffthis()
end

function M.gitsigns_diff_this_previous()
  require("gitsigns").diffthis("~")
end

function M.gitsigns_toggle_word_diff()
  require("gitsigns").toggle_word_diff()
end

function M.gitsigns_setloclist()
  require("gitsigns").setloclist()
end

function M.gitsigns_preview_hunk_inline()
  require("gitsigns").preview_hunk_inline()
end

-- =====================================
--      HELPER FOR  TERMINAL APPS
-- =====================================
-- LazyGit
vim.api.nvim_create_autocmd("FileType", {
  pattern = "lazygit",
  callback = function(event)
    vim.keymap.set("t", "<Esc>", "<Esc>", {
      buffer = event.buf,
      noremap = true,
      silent = true,
      desc = "LazyGit: keep Esc inside app",
    })
  end,
})

-- SQLite
function M.open_sqlit()
  vim.cmd("tabnew")
  vim.cmd("terminal sqlit")
  vim.cmd("startinsert")

  vim.keymap.set("t", "<Esc>", "<Esc>", {
    buffer = true,
    noremap = true,
    silent = true,
    desc = "SQLite: keep Esc inside app",
  })

  vim.keymap.set("t", "<C-x>", "<C-\\><C-n>", {
    buffer = true,
    noremap = true,
    silent = true,
    desc = "Exit Terminal Mode",
  })
end
-- Posting
function M.open_posting()
  vim.cmd("tabnew")
  vim.cmd("terminal posting")
  vim.cmd("startinsert")

  vim.keymap.set("t", "<Esc>", "<Esc>", {
    buffer = true,
    noremap = true,
    silent = true,
    desc = "Posting: keep Esc inside app",
  })

  vim.keymap.set("t", "<C-x>", "<C-\\><C-n>", {
    buffer = true,
    noremap = true,
    silent = true,
    desc = "Exit Terminal Mode",
  })
end

-- =====================================
--      HELPER FOR GEMINI TERMINAL
-- =====================================
local gemini_term = nil

function M.open_gemini_terminal()
  local Terminal = require("toggleterm.terminal").Terminal

  if not gemini_term then
    gemini_term = Terminal:new({
      cmd = "gemini",
      dir = vim.fn.getcwd(),
      direction = "float",
      hidden = true,
      close_on_exit = false,
      start_in_insert = true,
      float_opts = {
        border = "curved",
      },
    })
  end

  gemini_term:toggle()
end

-- =====================================
--      HELPER FOR DEBBUGER
-- =====================================
function M.dap_toggle_breakpoint()
  require("dap").toggle_breakpoint()
end

function M.dap_continue()
  require("dap").continue()
end

function M.dap_ui_toggle()
  require("dapui").toggle()
end

function M.dap_terminate()
  require("dap").terminate()

  pcall(function()
    require("dapui").close()
  end)
end

-- =====================================
--      HELPER FOR SEARCH FZF
-- =====================================
function M.fzf_search_in_folder()
  local path = vim.fn.input("Cerca in cartella: ", vim.fn.getcwd(), "dir")

  if vim.fn.isdirectory(path) == 1 then
    require("fzf-lua").files({
      cwd = path,
    })
  else
    vim.notify("Cartella non valida: " .. path, vim.log.levels.ERROR)
  end
end

function M.fzf_git_log()
  vim.cmd("FzfLua git_bcommits")
end

-- =====================================
--     REMOVE DEFOULT KEYMAPS LSP
-- =====================================
function M.remove_default_lsp_keymaps()
  local maps = {
    "grn",
    "grt",
    "gri",
    "grr",
    "gra",
  }

  for _, key in ipairs(maps) do
    pcall(vim.keymap.del, "n", key)
  end
end

-- =====================================
--    HELPER FOR SYMBOL IN TELESCOPE
-- =====================================
function M.telescope_document_symbols()
  local bufnr = vim.api.nvim_get_current_buf()
  local filename = vim.api.nvim_buf_get_name(bufnr)

  local kind_map = {
    File = { icon = "󰈙", hl = "TelescopeSymbolFile" },
    Module = { icon = "󰆧", hl = "TelescopeSymbolModule" },
    Namespace = { icon = "󰅪", hl = "TelescopeSymbolNamespace" },
    Package = { icon = "󰏗", hl = "TelescopeSymbolPackage" },
    Class = { icon = "󰠱", hl = "TelescopeSymbolClass" },
    Method = { icon = "󰡱", hl = "TelescopeSymbolMethod" },
    Function = { icon = "󰊕", hl = "TelescopeSymbolFunction" },
    Constructor = { icon = "󱌣", hl = "TelescopeSymbolConstructor" },
    Variable = { icon = "󰆧", hl = "TelescopeSymbolVariable" },
    Constant = { icon = "󰏿", hl = "TelescopeSymbolConstant" },
    String = { icon = "󰉿", hl = "TelescopeSymbolString" },
    Number = { icon = "󰎠", hl = "TelescopeSymbolNumber" },
    Boolean = { icon = "󰨙", hl = "TelescopeSymbolBoolean" },
    Array = { icon = "󰅪", hl = "TelescopeSymbolArray" },
    Object = { icon = "󰅩", hl = "TelescopeSymbolObject" },
    Key = { icon = "󰌋", hl = "TelescopeSymbolKey" },
    Field = { icon = "󰜢", hl = "TelescopeSymbolField" },
    Property = { icon = "󰜢", hl = "TelescopeSymbolProperty" },
    Enum = { icon = "󰕘", hl = "TelescopeSymbolEnum" },
    Interface = { icon = "󰜰", hl = "TelescopeSymbolInterface" },
    Operator = { icon = "󰆕", hl = "TelescopeSymbolOperator" },
  }

  vim.api.nvim_set_hl(0, "TelescopeSymbolClass", { fg = "#FFD847" })
  vim.api.nvim_set_hl(0, "TelescopeSymbolMethod", { fg = "#A8FFB3" })
  vim.api.nvim_set_hl(0, "TelescopeSymbolFunction", { fg = "#C796FF" })
  vim.api.nvim_set_hl(0, "TelescopeSymbolVariable", { fg = "#F20587" })
  vim.api.nvim_set_hl(0, "TelescopeSymbolString", { fg = "#FF9E64" })
  vim.api.nvim_set_hl(0, "TelescopeSymbolConstant", { fg = "#77C0FC" })
  vim.api.nvim_set_hl(0, "TelescopeSymbolField", { fg = "#00A89D" })
  vim.api.nvim_set_hl(0, "TelescopeSymbolProperty", { fg = "#4DA6FF" })
  vim.api.nvim_set_hl(0, "TelescopeSymbolInterface", { fg = "#FF77FF" })
  vim.api.nvim_set_hl(0, "TelescopeSymbolDefault", { fg = "#8DD3FA" })

  local params = { textDocument = vim.lsp.util.make_text_document_params(bufnr) }
  local responses = vim.lsp.buf_request_sync(bufnr, "textDocument/documentSymbol", params, 1000)

  if not responses then
    vim.notify("Nessun document symbol trovato", vim.log.levels.WARN)
    return
  end

  local items = {}

  local function add_symbol(symbol, depth)
    local kind = vim.lsp.protocol.SymbolKind[symbol.kind] or "Symbol"
    local range = symbol.selectionRange or symbol.range or symbol.location and symbol.location.range

    if not range then
      return
    end

    table.insert(items, {
      name = symbol.name,
      kind = kind,
      depth = depth or 0,
      filename = filename,
      lnum = range.start.line + 1,
      col = range.start.character + 1,
      text = symbol.name,
    })

    if symbol.children then
      for _, child in ipairs(symbol.children) do
        add_symbol(child, (depth or 0) + 1)
      end
    end
  end

  for _, response in pairs(responses) do
    local result = response.result
    if result then
      for _, symbol in ipairs(result) do
        add_symbol(symbol, 0)
      end
    end
  end

  if vim.tbl_isempty(items) then
    vim.notify("Nessun document symbol trovato", vim.log.levels.WARN)
    return
  end

  local pickers = require("telescope.pickers")
  local finders = require("telescope.finders")
  local conf = require("telescope.config").values
  local actions = require("telescope.actions")
  local action_state = require("telescope.actions.state")
  local entry_display = require("telescope.pickers.entry_display")

  local displayer = entry_display.create({
    separator = " ",
    items = {
      { width = 2 },
      { width = 45 },
      { width = 18 },
    },
  })

  pickers
    .new({}, {
      prompt_title = "LSP Document Symbols",
      finder = finders.new_table({
        results = items,
        entry_maker = function(entry)
          local meta = kind_map[entry.kind] or { icon = "󰘦", hl = "TelescopeSymbolDefault" }
          local indent = string.rep("  ", entry.depth)

          return {
            value = entry,
            filename = entry.filename,
            lnum = entry.lnum,
            col = entry.col,
            text = entry.text,
            ordinal = entry.name .. " " .. entry.kind,
            display = function()
              return displayer({
                { meta.icon, meta.hl },
                indent .. entry.name,
                { entry.kind:lower(), meta.hl },
              })
            end,
          }
        end,
      }),
      sorter = conf.generic_sorter({}),
      previewer = conf.grep_previewer({}),
      attach_mappings = function(prompt_bufnr)
        actions.select_default:replace(function()
          local selection = action_state.get_selected_entry()
          actions.close(prompt_bufnr)

          if selection then
            vim.api.nvim_win_set_cursor(0, {
              selection.value.lnum,
              selection.value.col - 1,
            })
          end
        end)

        return true
      end,
    })
    :find()
end

return M

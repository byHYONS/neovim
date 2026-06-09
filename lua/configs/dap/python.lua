-- DAP • Python (debugpy)
-- Documentazione: https://codeberg.org/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation#python
local M = {}

function M.setup(_)
  local debugpy_path = vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python"

  -- Inizializza nvim-dap-python che configura automaticamente l'adapter "python"
  local dap_python = require("dap-python")
  dap_python.setup(debugpy_path)

  local dap = require("dap")

  -- Funzione per trovare il path di Python nel progetto (venv)
  local function get_python_path()
    local cwd = vim.fn.getcwd()
    if vim.fn.executable(cwd .. "/venv/bin/python") == 1 then
      return cwd .. "/venv/bin/python"
    elseif vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then
      return cwd .. "/.venv/bin/python"
    else
      return "python3"
    end
  end

  dap.configurations.python = {
    {
      -- Lancia il file corrente
      type = "python",
      request = "launch",
      name = "Launch file",
      program = "${file}",
      pythonPath = get_python_path,
      console = "integratedTerminal",
      justMyCode = true,
    },
    {
      -- Lancia con argomenti
      type = "python",
      request = "launch",
      name = "Launch file with arguments",
      program = "${file}",
      args = function()
        local args_string = vim.fn.input("Arguments: ")
        return vim.split(args_string, " +")
      end,
      pythonPath = get_python_path,
      console = "integratedTerminal",
      justMyCode = true,
    },
    {
      -- Lancia un modulo (es: python -m my_module)
      type = "python",
      request = "launch",
      name = "Launch module",
      module = function()
        return vim.fn.input("Module name: ")
      end,
      pythonPath = get_python_path,
      console = "integratedTerminal",
      justMyCode = true,
    },
    {
      -- Si collega a un processo esistente (molto utile e citato nella wiki)
      type = "python",
      request = "attach",
      name = "Attach to process",
      processId = require("dap.utils").pick_process,
      pythonPath = get_python_path,
    },
    {
      -- Collegamento remoto (es: debugger in esecuzione su un server)
      type = "python",
      request = "attach",
      name = "Attach remote (localhost:5678)",
      connect = {
        host = "127.0.0.1",
        port = 5678,
      },
      justMyCode = true,
    },
  }

  -- Estensione per i test: permette di debuggare i singoli test con la stessa config
  dap_python.test_runner = "pytest" -- o "unittest"
end

return M

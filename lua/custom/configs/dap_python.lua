local dap = require("dap")

dap.adapters.python = {
  type = "executable",
  command = "python", -- assicurati che questo punti al python corretto
  args = { "-m", "debugpy.adapter" },
}

dap.configurations.python = {
  {
    type = "python",
    request = "launch",
    name = "Debug current file",
    program = "${file}",
    pythonPath = function()
      local venv = os.getenv("VIRTUAL_ENV")
      if venv then
        return venv .. "/bin/python"
      else
        return "python"
      end
    end,
  },
}

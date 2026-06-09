-- DAP • linguages
local M = {}

function M.setup()
  local dap = require("dap")

  require("configs.dap.python").setup(dap)
  require("configs.dap.php").setup(dap)
  require("configs.dap.javascript").setup(dap)
end

return M

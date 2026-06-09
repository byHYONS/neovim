-- DAP • PHP (Xdebug)
local M = {}

function M.setup(dap)
  local php_debug_path = vim.fn.stdpath("data") .. "/mason/packages/php-debug-adapter/extension/out/phpDebug.js"

  dap.adapters.php = {
    type = "executable",
    command = "node",
    args = { php_debug_path },
  }

  dap.configurations.php = {
    -- 1. Web Server (Laravel, MAMP, etc.)
    -- Ora che hai messo xdebug.mode=debug nel php.ini, questo "sentirà" le chiamate dal browser
    {
      type = "php",
      request = "launch",
      name = "Listen for Xdebug",
      port = 9003,
    },
    -- 2. Script CLI Corrente (Vanilla PHP)
    {
      type = "php",
      request = "launch",
      name = "Launch Current Script",
      program = "${file}",
      cwd = "${workspaceFolder}",
      port = 9003,
      runtimeExecutable = "php",
      -- Teniamo questi parametri come "sicurezza" extra per il CLI
      runtimeArgs = {
        "-dxdebug.mode=debug",
        "-dxdebug.start_with_request=yes",
        "-dxdebug.client_port=9003",
        "-dxdebug.client_host=127.0.0.1",
      },
    },
    -- 3. Laravel Artisan (Specifico per comandi tipo: php artisan inspire)
    {
      type = "php",
      request = "launch",
      name = "Launch Artisan (Laravel)",
      program = "${workspaceFolder}/artisan",
      args = function()
        local argument_string = vim.fn.input("Arguments: ")
        return vim.split(argument_string, " ")
      end,
      cwd = "${workspaceFolder}",
      port = 9003,
      runtimeExecutable = "php",
      runtimeArgs = {
        "-dxdebug.mode=debug",
        "-dxdebug.start_with_request=yes",
        "-dxdebug.client_port=9003",
        "-dxdebug.client_host=127.0.0.1",
      },
    },
  }
end

return M

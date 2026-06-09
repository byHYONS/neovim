-- DAP • JavaScript / TypeScript / Vue
local M = {}

function M.setup(dap)
  local js_debug_path = vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js"

  -- Adapters
  for _, adapter in ipairs({ "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" }) do
    dap.adapters[adapter] = {
      type = "server",
      host = "localhost",
      port = "${port}",
      executable = {
        command = "node",
        args = { js_debug_path, "${port}" },
      },
    }
  end

  local common_browser_config = {
    {
      type = "pwa-chrome",
      request = "launch",
      name = "Launch Chrome (localhost:5173 - Vue/Vite)",
      url = "http://localhost:5173",
      webRoot = "${workspaceFolder}",
      sourceMaps = true,
      skipFiles = { "<node_internals>/**/*.js", "node_modules/**/*.js" },
      sourceMapPathOverrides = {
        ["webpack:///./src/*"] = "${workspaceFolder}/src/*",
        ["webpack:///src/*"] = "${workspaceFolder}/src/*",
        ["webpack:///*"] = "*",
        ["webpack:///./*"] = "*",
        ["meteor://💻app/*"] = "${workspaceFolder}/*",
      },
    },
    {
      type = "pwa-chrome",
      request = "launch",
      name = "Launch Chrome (Laravel/Vite)",
      url = function()
        return vim.fn.input("URL: ", "http://127.0.0.1:8000")
      end,
      webRoot = "${workspaceFolder}",
      sourceMaps = true,
      skipFiles = { "<node_internals>/**/*.js", "node_modules/**/*.js" },
    },
    {
      type = "pwa-chrome",
      request = "launch",
      name = "Launch Chrome (Current File - Vanilla JS)",
      file = "${file}",
      webRoot = "${workspaceFolder}",
      sourceMaps = true,
    },
    {
      type = "pwa-chrome",
      request = "attach",
      name = "Attach Chrome (Port 9222)",
      port = 9222,
      webRoot = "${workspaceFolder}",
    },
  }

  local node_config = {
    {
      type = "pwa-node",
      request = "launch",
      name = "Launch Current File (Node.js)",
      program = "${file}",
      cwd = "${workspaceFolder}",
    },
    {
      type = "pwa-node",
      request = "attach",
      name = "Attach to Process (Node.js)",
      processId = require("dap.utils").pick_process,
      cwd = "${workspaceFolder}",
    },
  }

  -- Combined configurations
  local js_config = {}
  for _, v in ipairs(node_config) do table.insert(js_config, v) end
  for _, v in ipairs(common_browser_config) do table.insert(js_config, v) end

  dap.configurations.javascript = js_config
  dap.configurations.typescript = js_config
  dap.configurations.javascriptreact = js_config
  dap.configurations.typescriptreact = js_config

  -- Specific for Vue (usually the same as JS/TS but sometimes needs extra mapping)
  dap.configurations.vue = js_config
end

return M

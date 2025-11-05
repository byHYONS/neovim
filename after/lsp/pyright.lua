-- PYRIGHT – PYTHON
-- Percorso: ~/.config/nvim/after/lsp/pyright.lua

-- Helper: trova un python “valido” dall’ambiente virtuale o dal progetto
local function detect_python(bufnr)
  local root = vim.fs.root(bufnr or 0, {
    "pyproject.toml",
    "requirements.txt",
    "Pipfile",
    "setup.py",
    ".git",
  }) or vim.fn.getcwd() -- niente vim.loop: evita warning di lua_ls

  -- 1) variabile d'ambiente VIRTUAL_ENV
  if vim.env.VIRTUAL_ENV and #vim.env.VIRTUAL_ENV > 0 then
    local p = vim.env.VIRTUAL_ENV .. "/bin/python"
    if vim.fn.executable(p) == 1 then
      return p
    end
  end

  -- 2) .venv locale (pip/poetry/uv)
  local local_venv = root .. "/.venv/bin/python"
  if vim.fn.executable(local_venv) == 1 then
    return local_venv
  end

  -- 3) fallback: “python3” nel PATH
  return vim.fn.exepath("python3")
end

-- Comando: aggiorna al volo il pythonPath di pyright (senza mutare client.config)
local function set_python_path(command)
  local path = command.args
  local clients = vim.lsp.get_clients({ bufnr = vim.api.nvim_get_current_buf(), name = "pyright" })
  for _, client in ipairs(clients) do
    client:notify("workspace/didChangeConfiguration", {
      settings = { python = { pythonPath = path } },
    })
  end
end

return {
  cmd = { "pyright-langserver", "--stdio" },
  filetypes = { "python" },
  root_markers = {
    "pyproject.toml",
    "setup.py",
    "setup.cfg",
    "requirements.txt",
    "Pipfile",
    "pyrightconfig.json",
    ".git",
  },

  -- All'avvio, se troviamo un venv, comunichiamo il pythonPath via didChangeConfiguration
  on_init = function(client, _)
    local py = detect_python(0)
    if py and #py > 0 then
      client:notify("workspace/didChangeConfiguration", {
        settings = { python = { pythonPath = py } },
      })
    end
  end,

  on_attach = function(client, bufnr)
    -- Organize Imports
    vim.api.nvim_buf_create_user_command(bufnr, "LspPyrightOrganizeImports", function()
      client.request("workspace/executeCommand", {
        command = "pyright.organizeimports",
        arguments = { vim.uri_from_bufnr(bufnr) },
      }, nil, bufnr)
    end, { desc = "Organize Imports" })

    -- Set python path “on the fly”
    vim.api.nvim_buf_create_user_command(bufnr, "LspPyrightSetPythonPath", set_python_path, {
      desc = "Reconfigura pyright con il python fornito",
      nargs = 1,
      complete = "file",
    })
  end,

  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        diagnosticMode = "openFilesOnly",
        typeCheckingMode = "off",
      },
    },
  },
}

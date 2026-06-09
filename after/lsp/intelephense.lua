-- INTELEPHENSE - PHP - LARAVEL
local uv = vim.uv or vim.loop

local function safe_cwd()
  ---@diagnostic disable-next-line: undefined-field
  if uv and type(uv.cwd) == "function" then
    ---@diagnostic disable-next-line: undefined-field
    return uv.cwd()
  end

  return vim.fn.getcwd()
end

local function get_intelephense_license()
  local path = vim.fn.expand("~/.config/intelephense/license.txt")
  local file = io.open(path, "r")

  if not file then
    return nil
  end

  local content = file:read("*a")
  file:close()

  return content:gsub("%s+", "")
end

return {
  cmd = { "intelephense", "--stdio" },
  filetypes = { "php", "blade" },

  init_options = {
    licenceKey = get_intelephense_license(),
  },

  root_dir = function(bufnr)
    return vim.fs.root(bufnr or 0, { "artisan", "composer.json", ".git" }) or safe_cwd()
  end,

  settings = {
    intelephense = {
      environment = {
        includepaths = { "vendor/laravel/framework/src" },
        shortopentag = true,
      },
      files = {
        maxsize = 5 * 1024 * 1024,
        associations = { "*.php", "*.phtml", "*.blade.php" },
      },
      diagnostics = {
        enable = true,
        undefinedfunctions = false,
      },
      format = { enable = true },
      telemetry = { enabled = false },
    },
  },

  flags = { debounce_text_changes = 150 },
}

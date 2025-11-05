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

return {
  cmd = { "intelephense", "--stdio" },
  filetypes = { "php", "blade" },

  licenceKey = vim.fn.expand("~/.config/intelephense/license.txt"),

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

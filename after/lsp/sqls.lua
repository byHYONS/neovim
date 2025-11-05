-- SQLS - SQL
local config_path = vim.fn.expand("~/.config/sqls/config.yml")

return {
  cmd = { "sqls", "-config", config_path },
  filetypes = { "sql", "mysql", "sqlite", "postgres" },
  root_markers = { "config.yml", ".git" },
  settings = {},
}

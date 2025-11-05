-- BASHLS - BASH
return {
  cmd = { "bash-language-server", "start" },
  filetypes = { "bash", "sh" },
  root_markers = { ".git" },
  settings = {
    bashIde = {
      globPattern = vim.env.GLOB_PATTERN or "*@(.sh|.inc|.bash|.command)",
    },
  },
  -- disattiva su file .env (e varianti comuni)
  on_attach = function(client, bufnr)
    local name = vim.api.nvim_buf_get_name(bufnr)
    if name:match("/%.env") or name:match("%.env$") or name:match("%.env%.[^/]+$") then
      client.stop()
    end
  end,
}

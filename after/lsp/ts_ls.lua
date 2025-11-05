-- TS_LS - JAVASCRIPT - TYPESCRIPT
local TSDK = vim.fn.stdpath("data") .. "/mason/packages/typescript-language-server/node_modules/typescript/lib"
local VUE_TS_PLUGIN = vim.fn.expand("~/.nvm/versions/node/v20.19.3/lib/node_modules/@vue/typescript-plugin")

if vim.fn.isdirectory(VUE_TS_PLUGIN) == 0 then
  local pattern = vim.fn.expand("~/.nvm/versions/node/*/lib/node_modules/@vue/typescript-plugin")
  local matches = vim.fn.glob(pattern, false, true)
  local found = (#matches > 0) and matches[1] or nil
  if found and vim.fn.isdirectory(found) == 1 then
    VUE_TS_PLUGIN = found
  end
end

return {
  cmd = { "typescript-language-server", "--stdio" },
  filetypes = {
    "typescript",
    "typescriptreact",
    "javascript",
    "javascriptreact",
    "vue",
  },
  init_options = {
    hostInfo = "neovim",
    typescript = {
      tsdk = TSDK,
    },
    plugins = {
      {
        name = "@vue/typescript-plugin",
        location = VUE_TS_PLUGIN,
        languages = { "vue" },
      },
    },
  },
}

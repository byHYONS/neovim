-- LUA_LS — LUA
return {
  cmd = { "lua-language-server" },
  filetypes = { "lua" },

  on_init = function(client)
    if client.workspace_folders and client.workspace_folders[1] then
      local path = client.workspace_folders[1].name

      ---@class HyonLuv
      ---@field fs_stat fun(path: string): table|nil
      ---@type HyonLuv|nil
      local luv = (vim and (vim.uv or vim.loop)) --[[@as HyonLuv|nil]]

      local has_luarc = false
      if luv then
        if luv.fs_stat(path .. "/.luarc.json") ~= nil then
          has_luarc = true
        elseif luv.fs_stat(path .. "/.luarc.jsonc") ~= nil then
          has_luarc = true
        end
      end

      if path ~= vim.fn.stdpath("config") and has_luarc then
        return
      end
    end

    -- Assicuriamoci che le tabelle esistano
    client.config = client.config or {}
    client.config.settings = client.config.settings or {}

    client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua or {}, {
      runtime = {
        version = "LuaJIT",
        path = { "lua/?.lua", "lua/?/init.lua" },
      },
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME,
          -- Includere i runtime di tutti i plugin:
        },
      },
      diagnostics = {
        globals = { "vim" },
        disable = { "missing-fields" },
      },
      completion = { callSnippet = "Replace" },
      telemetry = { enable = false },
    })
  end,

  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
        disable = { "missing-fields" },
      },
      completion = { callSnippet = "Replace" },
      telemetry = { enable = false },
    },
  },
}

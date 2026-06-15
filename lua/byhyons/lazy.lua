-- ############################################
-- ##                                        ##
-- ##            LAZY CONFIG                 ##
-- ##                                        ##
-- ############################################
--  Configura Lazy.nvim, il gestore che installa e carica tutti i plugin.

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({ { import = "byhyons.plugins" }, { import = "byhyons.plugins.lsp" } }, {
  -- defaults = { version = "*" }, -- NOTE: blocca gli upgrade alle versioni più stabili
  checker = {
    enabled = true,
    notify = false,
  },
  change_detection = {
    notify = false,
  },
})

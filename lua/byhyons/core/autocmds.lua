-- ############################################
-- ##                                        ##
-- ##               AUTOCMDS                 ##
-- ##                                        ##
-- ############################################

local function augroup(name)
  return vim.api.nvim_create_augroup("byhyons_" .. name, { clear = true })
end

-- ============================================
--   A capo dopo 145 caratteri in file text
-- ============================================
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("wrap_settings"),
  pattern = { "markdown", "norg", "text", "gitcommit" },
  callback = function()
    vim.opt_local.textwidth = 145
    -- 't' abilita l'andata a capo automatica mentre scrivi (hard wrap)
    vim.opt_local.formatoptions:append("t")
    -- Abilita anche il wrapping visivo (soft wrap)
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true
    vim.opt_local.breakindent = true
  end,
})

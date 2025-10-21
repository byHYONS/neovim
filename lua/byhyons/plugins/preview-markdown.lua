--  Preview Markdown
return {
  "iamcco/markdown-preview.nvim",
  ft = { "markdown" },
  cmd = { "MarkdownPreview", "MarkdownPreviewStop", "MarkdownPreviewToggle" },

  build = function()
    require("lazy").load({ plugins = { "markdown-preview.nvim" } })
    vim.fn["mkdp#util#install"]()
  end,

  init = function()
    vim.g.mkdp_auto_start = 0
    vim.g.mkdp_auto_close = 1
    vim.g.mkdp_echo_preview_url = 1
    vim.g.mkdp_preview_options = {
      mkit = { gfm = 1 },
      katex = 1,
      uml = 1,
      maid = 1,
      disable_sync_scroll = 0,
      sync_scroll_type = "middle",
      hide_yaml_meta = 1,
      disable_filename = 0,
      toc = 1,
    }
  end,
}

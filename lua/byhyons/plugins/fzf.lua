-- FZF
return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  cmd = "FzfLua",
  config = function()
    require("fzf-lua").setup({
      winopts = {
        height = 0.85,
        width = 0.85,
        row = 0.3,
        col = 0.5,
        border = "rounded",
        preview = {
          layout = "vertical",
          vertical = "up:65%",
        },
      },
      fzf_opts = {
        ["--layout"] = "reverse",
        ["--info"] = "inline",
      },
      files = {
        prompt = "",
        git_icons = true,
        file_icons = true,
        color_icons = true,
      },
      grep = {
        prompt = "",
      },
    })
  end,
}

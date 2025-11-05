-- HTML
return {
  cmd = { "vscode-html-language-server", "--stdio" },
  filetypes = { "html", "templ", "blade", "vue", "php" },
  root_markers = { "package.json", ".git" },
  init_options = {
    provideFormatter = true,
    embeddedLanguages = { css = true, javascript = true },
    configurationSection = { "html", "css", "javascript" },
  },
  settings = {},
}

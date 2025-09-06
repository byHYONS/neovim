-- Neorg Exporter
local M = {}

-- CONFIGURAZIONE (percorsi di template e reference)
local BOOTSTRAP_TEMPLATE = vim.fn.expand("~/.config/neorg/templates/bootstrap.html")
local PPTX_REFERENCE = vim.fn.expand("~/.config/neorg/templates/reference.pptx")
local PDF_TEMPLATE = vim.fn.expand("~/.config/neorg/templates/pdf_style.tex")
local SETUP_TEX = vim.fn.expand("~/.config/neorg/templates/tex_to_pdf_style.tex")

-- ===========================================
-- Apre un file nel browser in modo portatile
-- ===========================================
local function open_in_browser(path)
  if vim.fn.has("mac") == 1 then
    vim.fn.jobstart({ "open", path }, { detach = true })
  elseif vim.fn.executable("xdg-open") == 1 then
    vim.fn.jobstart({ "xdg-open", path }, { detach = true })
  elseif vim.fn.executable("gio") == 1 then
    vim.fn.jobstart({ "gio", "open", path }, { detach = true })
  else
    vim.notify("Apri manualmente: " .. path, vim.log.levels.WARN)
  end
end

-- ========================
-- Esegue un job asincrono
-- ========================
local function run_job(cmd, opts)
  opts = opts or {}
  local on_success = opts.on_success or function(_, _) end
  local on_failure = opts.on_failure or function(_, _) end
  local summary = opts.summary or table.concat(cmd, " ")
  local stderr_output = {}
  local stdout_output = {}

  if vim.fn.executable(cmd[1]) == 0 then
    vim.notify(("Comando non trovato: %s"):format(cmd[1]), vim.log.levels.ERROR)
    on_failure("Comando non trovato: " .. cmd[1], "")
    return
  end

  vim.fn.jobstart(cmd, {
    stdout_buffered = true,
    stderr_buffered = true,
    on_stdout = function(_, data)
      for _, line in ipairs(data or {}) do
        if line ~= "" then
          table.insert(stdout_output, line)
        end
      end
    end,
    on_stderr = function(_, data)
      for _, line in ipairs(data or {}) do
        if line ~= "" then
          table.insert(stderr_output, line)
        end
      end
    end,
    on_exit = function(_, code)
      local full_stdout = table.concat(stdout_output, "\n")
      local full_stderr = table.concat(stderr_output, "\n")

      if code == 0 then
        vim.notify(("%s completato."):format(summary), vim.log.levels.INFO)
        on_success(full_stdout, full_stderr)
      else
        local err_msg = full_stderr ~= "" and full_stderr or full_stdout
        vim.notify(("Errore in: %s (codice %d)\n%s"):format(summary, code, err_msg), vim.log.levels.ERROR)
        on_failure(full_stdout, full_stderr)
      end
    end,
    detach = false,
  })
end

-- =======================================================
-- Chiede directory di output (default: stessa del .norg)
-- =======================================================
local function choose_output_dir(default_dir)
  local input =
    vim.fn.input({ prompt = "Directory output (Invio=default): ", default = default_dir, completion = "dir" })
  if input == "" then
    return default_dir
  end
  local exp = vim.fn.fnamemodify(input, ":p")
  if vim.fn.isdirectory(exp) == 0 and vim.fn.mkdir(exp, "p") ~= 1 then
    vim.notify(("Impossibile creare: %s"):format(exp), vim.log.levels.ERROR)
    return default_dir
  end
  return exp
end

-- =====================================================================
-- Funzione principale: .norg → .md → (pdf/html/pptx/tex) e .tex → .pdf
-- =====================================================================
function M.export_pipeline(opts)
  local format = (opts.args and opts.args ~= "") and opts.args or "pdf"
  local fname = vim.api.nvim_buf_get_name(0)

  -- =======================
  -- .tex → PDF con XeLaTeX
  -- =======================
  if fname:match("%.tex$") and format == "pdf" then
    local default_dir = vim.fn.fnamemodify(fname, ":h")
    local out_dir = choose_output_dir(default_dir)
    local base_name = vim.fn.fnamemodify(fname, ":t:r")
    local output_pdf = out_dir .. "/" .. base_name .. ".pdf"

    -- Leggi il sorgente
    local lines = vim.fn.readfile(fname)
    local text = table.concat(lines, "\n")
    local is_standalone = text:match("\\documentclass")

    -- Helper: inietta \input{...setup.tex} subito prima di \begin{document}
    local function inject_before_begin_document(src_lines, _)
      -- 1) se il setup è già incluso, non fare nulla
      for _, ln in ipairs(src_lines) do
        if ln:match("\\input%s*{%s*.-tokyo_ubuntu_setup%.tex%s*}") then
          return src_lines, true
        end
      end
      -- 2) inserisci prima di \begin{document}
      local new, inserted = {}, false
      for _, ln in ipairs(src_lines) do
        if (not inserted) and ln:match("\\begin%s*{%s*document%s*}") then
          table.insert(new, "")
          table.insert(new, "%% injected style (auto)")
          table.insert(new, "\\input{" .. SETUP_TEX .. "}")
          table.insert(new, "%% end injected")
          table.insert(new, "")
          inserted = true
        end
        table.insert(new, ln)
      end
      return new, inserted
    end

    -- Caso: .tex senza \documentclass → usa Pandoc + template PDF_TEMPLATE
    if not is_standalone then
      local cmd_pdf = {
        "pandoc",
        "-f",
        "latex",
        fname,
        "-o",
        output_pdf,
        "--pdf-engine=xelatex",
        "--listings",
        "--template=" .. PDF_TEMPLATE,
      }
      run_job(cmd_pdf, {
        summary = "TEX (no preambolo) → PDF: " .. output_pdf,
        on_success = function()
          open_in_browser(output_pdf)
        end,
        on_failure = function(_, stderr)
          vim.notify(("Errore TEX→PDF via Pandoc:\n%s"):format(stderr), vim.log.levels.ERROR)
        end,
      })
      return
    end

    -- Caso: .tex standalone → inietta preambolo e compila due volte con XeLaTeX
    local styled_tex = out_dir .. "/" .. base_name .. "__styled.tex"
    local setup_exists = (vim.fn.filereadable(SETUP_TEX) == 1)
    local used_file = fname

    if setup_exists then
      local new_lines, inserted = inject_before_begin_document(lines, SETUP_TEX)
      if inserted then
        vim.fn.writefile(new_lines, styled_tex)
        used_file = styled_tex
      else
        -- nessuna iniezione (già presente o niente \begin{document})
        used_file = fname
      end
    else
      vim.notify(
        "ATTENZIONE: setup stile non trovato: " .. SETUP_TEX .. " (compilo senza iniezione)",
        vim.log.levels.WARN
      )
    end

    local cmd_xelatex = {
      "xelatex",
      "-interaction=nonstopmode",
      "-halt-on-error",
      "-output-directory=" .. out_dir,
      "-jobname=" .. base_name,
      used_file,
    }

    local function cleanup_latex_files()
      for _, ext in ipairs({ ".aux", ".log", ".out", ".toc" }) do
        local f = out_dir .. "/" .. base_name .. ext
        if vim.fn.filereadable(f) == 1 then
          os.remove(f)
        end
      end
      if used_file == styled_tex and vim.fn.filereadable(styled_tex) == 1 then
        os.remove(styled_tex)
      end
    end

    run_job(cmd_xelatex, {
      summary = "Compilazione LaTeX (1/2): " .. fname,
      on_success = function()
        run_job(cmd_xelatex, {
          summary = "Compilazione LaTeX (2/2): " .. fname,
          on_success = function()
            vim.notify("PDF generato: " .. output_pdf, vim.log.levels.INFO)
            cleanup_latex_files()
            open_in_browser(output_pdf)
          end,
          on_failure = function(_, stderr)
            vim.notify(("Errore seconda compilazione LaTeX:\n%s"):format(stderr), vim.log.levels.ERROR)
          end,
        })
      end,
      on_failure = function(_, stderr)
        vim.notify(("Errore prima compilazione LaTeX:\n%s"):format(stderr), vim.log.levels.ERROR)
      end,
    })
    return
  end

  -- ============================================
  -- Funzione sincrona per esportare .norg → .md
  -- ============================================
  local function export_to_markdown(md_path)
    local norg_file = vim.api.nvim_buf_get_name(0)
    local pandoc_reader_path = vim.fn.expand("~/.config/neorg/neorg-pandoc/init.lua")
    local cmd = { "pandoc", "--from=" .. pandoc_reader_path, "--to=markdown", norg_file, "-o", md_path }

    local result = vim.fn.system(cmd)
    if vim.v.shell_error == 0 then
      vim.notify("Neorg → Markdown riuscito: " .. md_path, vim.log.levels.INFO)
      return true
    else
      vim.notify("Errore conversione Neorg → Markdown:\n" .. result, vim.log.levels.ERROR)
      return false
    end
  end

  -- =========================
  -- .md -> PDF/HTML/PPTX/TEX
  -- =========================
  if fname:match("%.md$") then
    if format ~= "pdf" and format ~= "html" and format ~= "pptx" and format ~= "tex" then
      vim.notify("Per file .md, i formati supportati sono 'pdf', 'html', 'pptx' e 'tex'.", vim.log.levels.ERROR)
      return
    end

    local base = vim.fn.fnamemodify(fname, ":t"):gsub("%.md$", "")
    local dir = vim.fn.fnamemodify(fname, ":h")
    local out = choose_output_dir(dir)

    if format == "html" then
      local html = out .. "/" .. base .. ".html"
      local cmd = { "pandoc", "-s", fname, "-o", html }
      if vim.fn.filereadable(BOOTSTRAP_TEMPLATE) == 1 then
        table.insert(cmd, "--template=" .. BOOTSTRAP_TEMPLATE)
      end
      run_job(cmd, {
        summary = "MD -> HTML: " .. html,
        on_success = function()
          open_in_browser(html)
        end,
        on_failure = function(_, stderr)
          vim.notify(("Errore conversione MD -> HTML:\n%s"):format(stderr), vim.log.levels.ERROR)
        end,
      })
    elseif format == "pdf" then
      local pdf = out .. "/" .. base .. ".pdf"
      local cmd_pdf = {
        "pandoc",
        "-s",
        fname,
        "-o",
        pdf,
        "--pdf-engine=xelatex",
        "--listings",
        "--template=" .. PDF_TEMPLATE,
      }
      run_job(cmd_pdf, {
        summary = "MD -> PDF: " .. pdf,
        on_success = function()
          open_in_browser(pdf)
        end,
        on_failure = function(_, stderr)
          vim.notify(("Errore conversione MD -> PDF:\n%s"):format(stderr), vim.log.levels.ERROR)
        end,
      })
    elseif format == "pptx" then
      local pptx = out .. "/" .. base .. ".pptx"
      local cmd = { "pandoc", fname, "-o", pptx, "--slide-level=2" }
      if vim.fn.filereadable(PPTX_REFERENCE) == 1 then
        table.insert(cmd, "--reference-doc=" .. PPTX_REFERENCE)
      end
      run_job(cmd, {
        summary = "MD -> PPTX: " .. pptx,
        on_success = function()
          vim.notify("PPTX generato: " .. pptx, vim.log.levels.INFO)
          open_in_browser(pptx)
        end,
        on_failure = function(_, stderr)
          vim.notify(("Errore conversione MD -> PPTX:\n%s"):format(stderr), vim.log.levels.ERROR)
        end,
      })
    elseif format == "tex" then
      local tex = out .. "/" .. base .. ".tex"
      local cmd = { "pandoc", "-s", fname, "-o", tex }
      run_job(cmd, {
        summary = "MD -> LaTeX: " .. tex,
        on_success = function()
          vim.notify("LaTeX generato: " .. tex, vim.log.levels.INFO)
        end,
        on_failure = function(_, stderr)
          vim.notify(("Errore conversione MD -> LaTeX:\n%s"):format(stderr), vim.log.levels.ERROR)
        end,
      })
    end
    return
  end

  -- ==========================================
  -- Richiede file .norg per gli altri formati
  -- ==========================================
  if not fname:match("%.norg$") then
    vim.notify("Apri un file .norg o .md prima (o usa 'texpdf' in un file .tex).", vim.log.levels.ERROR)
    return
  end

  local base = vim.fn.fnamemodify(fname, ":t"):gsub("%.norg$", "")
  local dir = vim.fn.fnamemodify(fname, ":h")
  local out = choose_output_dir(dir)
  local md = out .. "/" .. base .. ".md"
  local html = out .. "/" .. base .. ".html"
  local pdf = out .. "/" .. base .. ".pdf"
  local pptx = out .. "/" .. base .. ".pptx"
  local tex = out .. "/" .. base .. ".tex"

  if format == "md" then
    if export_to_markdown(md) then
      vim.notify("Markdown esportato: " .. md, vim.log.levels.INFO)
    end
  elseif format == "html" then
    if not export_to_markdown(md) then
      return
    end
    local cmd = { "pandoc", "-s", md, "-o", html }
    if vim.fn.filereadable(BOOTSTRAP_TEMPLATE) == 1 then
      table.insert(cmd, "--template=" .. BOOTSTRAP_TEMPLATE)
    end
    run_job(cmd, {
      summary = "HTML: " .. html,
      on_success = function()
        open_in_browser(html)
        os.remove(md)
      end,
      on_failure = function(_, stderr)
        vim.notify(("Errore HTML finale:\n%s"):format(stderr), vim.log.levels.ERROR)
      end,
    })
  elseif format == "pdf" then
    if not export_to_markdown(md) then
      return
    end
    local cmd_pdf = {
      "pandoc",
      "-s",
      md,
      "-o",
      pdf,
      "--pdf-engine=xelatex",
      "--listings",
      "--template=" .. PDF_TEMPLATE,
    }
    run_job(cmd_pdf, {
      summary = "PDF: " .. pdf,
      on_success = function()
        os.remove(md)
        vim.notify("PDF generato: " .. pdf, vim.log.levels.INFO)
        open_in_browser(pdf)
      end,
      on_failure = function(_, stderr)
        vim.notify(("Errore PDF finale:\n%s"):format(stderr), vim.log.levels.ERROR)
      end,
    })
  elseif format == "pptx" then
    if not export_to_markdown(md) then
      return
    end
    local cmd = { "pandoc", md, "-o", pptx, "--slide-level=2" }
    if vim.fn.filereadable(PPTX_REFERENCE) == 1 then
      table.insert(cmd, "--reference-doc=" .. PPTX_REFERENCE)
    end
    run_job(cmd, {
      summary = "PPTX: " .. pptx,
      on_success = function()
        os.remove(md)
        vim.notify("PPTX generato: " .. pptx, vim.log.levels.INFO)
        open_in_browser(pptx)
      end,
      on_failure = function(_, stderr)
        vim.notify(("Errore PPTX finale:\n%s"):format(stderr), vim.log.levels.ERROR)
      end,
    })
  elseif format == "tex" then
    if not export_to_markdown(md) then
      return
    end
    local cmd = { "pandoc", "-s", md, "-o", tex }
    run_job(cmd, {
      summary = "LaTeX: " .. tex,
      on_success = function()
        os.remove(md)
        vim.notify("LaTeX esportato: " .. tex, vim.log.levels.INFO)
      end,
      on_failure = function(_, stderr)
        vim.notify(("Errore LaTeX finale:\n%s"):format(stderr), vim.log.levels.ERROR)
      end,
    })
  else
    vim.notify(("Formato non supportato: %s"):format(format), vim.log.levels.ERROR)
  end
end

-- ===============
-- Comandi utente
-- ===============
vim.api.nvim_create_user_command("NeorgExport", function(opts)
  M.export_pipeline(opts)
end, {
  nargs = "?",
  complete = function(input)
    return vim.tbl_filter(function(v)
      return v:match("^" .. vim.pesc(input))
    end, { "pdf", "html", "pptx", "md", "tex" })
  end,
})

vim.api.nvim_create_user_command("NeorgExportPick", function()
  vim.ui.select({ "pdf", "html", "pptx", "md", "tex" }, { prompt = "Scegli formato di export:" }, function(c)
    if c then
      vim.cmd("NeorgExport " .. c)
    end
  end)
end, {})

vim.keymap.set(
  "n",
  "<leader>aN",
  ":NeorgExportPick<CR>",
  { noremap = true, silent = true, desc = "Scegli formato export" }
)

return M

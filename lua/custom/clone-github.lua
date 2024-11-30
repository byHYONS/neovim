-- Clonare una repo

local Job = require("plenary.job")

local M = {}

-- Funzione per selezionare una directory usando Telescope File Browser
function M.select_directory(callback)
  -- Apri il file browser e aspetta la selezione della directory
  require("telescope").extensions.file_browser.file_browser({
    prompt_title = "Seleziona Directory",
    cwd = vim.loop.cwd(),
    respect_gitignore = false,
    hidden = true,
    grouped = true,
    layout_config = {
      height = 40,
    },
    only_dirs = true, -- mostra solo directory
    attach_mappings = function(prompt_bufnr, map)
      local actions = require("telescope.actions")
      local actions_state = require("telescope.actions.state")
      actions.select_default:replace(function()
        local selection = actions_state.get_selected_entry()
        actions.close(prompt_bufnr)
        -- Ottieni il percorso della directory selezionata
        local dir = selection.path
        -- Verifica se il percorso selezionato è una directory
        Job:new({
          command = "test",
          args = { "-d", dir },
          on_exit = function(j, return_val)
            if return_val == 0 then
              callback(dir)
            else
              print("Seleziona una directory valida.")
            end
          end,
        }):start()
      end)
      return true
    end,
  })
end

-- Funzione per clonare tramite link
function M.CloneRepoFromLink()
  vim.ui.input({ prompt = "Inserisci il link della repository da clonare: " }, function(link)
    if not link or link == "" then
      print("Link non valido.")
      return
    end

    -- Estrai il nome della repository dal link
    local repo_name = link:match(".*/([^/]+)%.git$")
    if not repo_name then
      repo_name = link:match(".*/([^/]+)$")
    end

    if not repo_name or repo_name == "" then
      print("Non è stato possibile estrarre il nome della repository dal link.")
      return
    end

    -- Chiedi la directory di destinazione
    M.select_directory(function(directory)
      if not directory or directory == "" then
        directory = vim.loop.cwd()
        print("Clonando nella directory corrente: " .. directory)
      else
        print("Clonando nella directory: " .. directory)
      end

      -- Definisci il percorso di destinazione completo
      local target_dir = directory .. "/" .. repo_name

      -- Controlla se target_dir esiste già
      Job:new({
        command = "test",
        args = { "-d", target_dir },
        on_exit = function(j, return_val)
          if return_val == 0 then
            print("Errore: La directory di destinazione '" .. target_dir .. "' esiste già.")
          else
            -- Esegui il comando git clone
            Job:new({
              command = "git",
              args = { "clone", link, target_dir },
              on_exit = function(j_clone, return_val_clone)
                if return_val_clone == 0 then
                  print("Repository clonata con successo in: " .. target_dir)
                else
                  print("Errore nella clonazione: " .. table.concat(j_clone:stderr_result(), "\n"))
                end
              end,
            }):start()
          end
        end,
      }):start()
    end)
  end)
end

-- Funzione per clonare selezionando una repository dal tuo account GitHub
function M.CloneRepoFromList()
  -- Esegui il comando `gh repo list` per ottenere le repository
  Job:new({
    command = "gh",
    args = { "repo", "list", "--json", "nameWithOwner", "--limit", "100" },
    on_exit = function(job, return_val)
      if return_val ~= 0 then
        print("Errore nell'esecuzione del comando `gh repo list`: " .. table.concat(job:stderr_result(), "\n"))
        return
      end

      local result = table.concat(job:result(), "\n")
      local success, repos = pcall(vim.json.decode, result)

      if not success or type(repos) ~= "table" then
        print("Errore nel parsing dell'output JSON.")
        return
      end

      -- Crea l'elenco delle repository
      local repo_names = {}
      for _, repo in ipairs(repos) do
        table.insert(repo_names, repo.nameWithOwner)
      end

      -- Mostra un popup per selezionare la repository
      vim.ui.select(repo_names, { prompt = "Seleziona una repository da clonare:" }, function(choice)
        if not choice then
          print("Nessuna repository selezionata.")
          return
        end

        -- Estrai il nome della repository dal nameWithOwner
        local repo_name = choice:match(".*/([^/]+)$")

        -- Chiedi la directory di destinazione
        M.select_directory(function(directory)
          if not directory or directory == "" then
            directory = vim.loop.cwd()
            print("Clonando nella directory corrente: " .. directory)
          else
            print("Clonando nella directory: " .. directory)
          end

          -- Definisci il percorso di destinazione completo
          local target_dir = directory .. "/" .. repo_name

          -- Controlla se target_dir esiste già
          Job:new({
            command = "test",
            args = { "-d", target_dir },
            on_exit = function(j, return_val)
              if return_val == 0 then
                print("Errore: La directory di destinazione '" .. target_dir .. "' esiste già.")
              else
                -- Esegui il comando git clone
                Job:new({
                  command = "git",
                  args = { "clone", "https://github.com/" .. choice, target_dir },
                  on_exit = function(j_clone, ret_val_clone)
                    if ret_val_clone == 0 then
                      print("Repository clonata con successo in: " .. target_dir)
                    else
                      print("Errore nella clonazione: " .. table.concat(j_clone:stderr_result(), "\n"))
                    end
                  end,
                }):start()
              end
            end,
          }):start()
        end)
      end)
    end,
  }):start()
end

return M

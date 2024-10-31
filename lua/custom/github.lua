local Job = require("plenary.job")

function CreateGitHubRepo()
  local repo_name = vim.fn.input("Nome della nuova repository GitHub: ")
  if repo_name == "" then
    print("Nome repository non valido.")
    return
  end

  local visibility = vim.fn.input("Repository pubblica o privata? (pubblica/privata): ")
  local is_public = (visibility == "pubblica")

  -- Step 1: Inizializza Git se necessario
  Job:new({
    command = "git",
    args = { "rev-parse", "--is-inside-work-tree" },
    on_exit = function(j, return_val)
      if return_val ~= 0 then
        Job
          :new({
            command = "git",
            args = { "init" },
            on_exit = function()
              print("Repository Git locale inizializzata.")

              -- Salta la creazione di README.md, continua con il commit se necessario

              -- Step 4: Crea la repository su GitHub e aggiungi il remote origin
              Job
                :new({
                  command = "gh",
                  args = {
                    "repo",
                    "create",
                    repo_name,
                    is_public and "--public" or "--private",
                    "--source=.",
                    "--remote=origin",
                  },
                  on_exit = function(j, return_val)
                    if return_val == 0 then
                      print("Repository creata con successo su GitHub con il commit iniziale!")
                      -- Step 5: Esegue il primo push
                      Job:new({
                        command = "git",
                        args = { "push", "-u", "origin", "main" },
                        on_exit = function(j, return_val)
                          if return_val == 0 then
                            print("Upstream impostato correttamente per il branch 'main'.")
                          else
                            print("Errore nel push iniziale: " .. table.concat(j:stderr_result(), "\n"))
                          end
                        end,
                      }):start()
                    else
                      print(
                        "Errore nella creazione della repository su GitHub: " .. table.concat(j:stderr_result(), "\n")
                      )
                    end
                  end,
                })
                :start()
            end,
          })
          :start()
      else
        -- Se è già una repository Git, crea la repository su GitHub e aggiunge il remote
        Job:new({
          command = "gh",
          args = {
            "repo",
            "create",
            repo_name,
            is_public and "--public" or "--private",
            "--source=.",
            "--remote=origin",
          },
          on_exit = function(j, return_val)
            if return_val == 0 then
              print("Repository esistente collegata a GitHub!")
              -- Esegue il push iniziale per una repository esistente
              Job:new({
                command = "git",
                args = { "push", "-u", "origin", "main" },
                on_exit = function(j, return_val)
                  if return_val == 0 then
                    print("Upstream impostato correttamente per il branch 'main'.")
                  else
                    print("Errore nel push iniziale: " .. table.concat(j:stderr_result(), "\n"))
                  end
                end,
              }):start()
            else
              print("Errore nel collegamento della repository: " .. table.concat(j:stderr_result(), "\n"))
            end
          end,
        }):start()
      end
    end,
  }):start()
end

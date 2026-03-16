return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "mason-org/mason.nvim",
        opts = {
          registries = {
            "github:mason-org/mason-registry",
            "github:Crashdummyy/mason-registry",
          },
        },
      },
      "mason-org/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    config = function()
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
        callback = function(event)
          local map = function(keys, func, desc, mode)
            mode = mode or "n"
            vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
          end
          local lsp_references = function()
            require("telescope.builtin").lsp_references({ fname_width = 120 })
          end

          map("grd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
          map("grr", lsp_references, "[G]oto [R]eferences")
          map("gri", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
          map("grt", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
          map("gO", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
          map("gW", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
          map("grn", vim.lsp.buf.rename, "[R]e[n]ame")
          map("gra", vim.lsp.buf.code_action, "[C]ode [A]ction", { "n", "x" })
          map("grD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
            client.server_capabilities.semanticTokensProvider = nil
            local highlight_augroup = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })
            vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.clear_references,
            })

            vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "InsertLeave" }, {
              group = vim.api.nvim_create_augroup("lsp-codelens", { clear = true }),
              buffer = event.buf,
              callback = function(event2)
                vim.lsp.codelens.refresh({ bufnr = event2.buf })
              end,
            })

            vim.api.nvim_create_autocmd("LspDetach", {
              group = vim.api.nvim_create_augroup("lsp-detach", { clear = true }),
              callback = function(event2)
                vim.lsp.buf.clear_references()
                vim.api.nvim_clear_autocmds({ group = "lsp-highlight", buffer = event2.buf })
              end,
            })
          end
        end,
      })

      local servers = {
        angularls = {
          filetypes = { "htmlangular" },
        },
        cssls = {
          init_options = {
            provideFormatter = false,
          },
        },
        html = {
          init_options = {
            provideFormatter = false,
          },
        },
        marksman = {},
        tsgo = {},
        lua_ls = {
          on_init = function(client)
            if client.workspace_folders then
              local path = client.workspace_folders[1].name
              if
                path ~= vim.fn.stdpath("config")
                and (vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc"))
              then
                return
              end
            end

            client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
              runtime = {
                version = "LuaJIT",
                path = { "lua/?.lua", "lua/?/init.lua" },
              },
              workspace = {
                checkThirdParty = false,
                library = { vim.env.VIMRUNTIME, "${3rd}/luv/library" },
              },
            })
          end,
          settings = {
            Lua = {
              completion = {
                callSnippet = "Replace",
              },
              diagnostics = { disable = { "missing-fields" } },
              format = {
                enable = false,
              },
            },
          },
        },
        roslyn_ls = {
          cmd = { "roslyn", "--logLevel", "Information", "--extensionLogDirectory", "/tmp/roslyn_ls/logs", "--stdio" },
          settings = {
            ["csharp|completion"] = {
              dotnet_provide_regex_completions = true,
              dotnet_show_completion_items_from_unimported_namespaces = true,
              dotnet_show_name_completion_suggestions = true,
            },
            ["csharp|background_analysis"] = {
              dotnet_analyzer_diagnostics_scope = "openFiles",
              dotnet_compiler_diagnostics_scope = "openFiles",
            },
            ["csharp|symbol_search"] = {
              dotnet_search_reference_assemblies = true,
            },
            ["csharp|inlay_hints"] = {
              csharp_enable_inlay_hints_for_implicit_object_creation = true,
              csharp_enable_inlay_hints_for_implicit_variable_types = true,
              csharp_enable_inlay_hints_for_lambda_parameter_types = true,
              csharp_enable_inlay_hints_for_types = true,
              dotnet_enable_inlay_hints_for_indexer_parameters = true,
              dotnet_enable_inlay_hints_for_literal_parameters = true,
              dotnet_enable_inlay_hints_for_object_creation_parameters = true,
              dotnet_enable_inlay_hints_for_other_parameters = true,
              dotnet_enable_inlay_hints_for_parameters = true,
              dotnet_suppress_inlay_hints_for_parameters_that_differ_only_by_suffix = true,
              dotnet_suppress_inlay_hints_for_parameters_that_match_argument_name = true,
              dotnet_suppress_inlay_hints_for_parameters_that_match_method_intent = true,
            },
            ["csharp|code_lens"] = {
              dotnet_enable_references_code_lens = true,
              dotnet_enable_tests_code_lens = true,
            },
          },
        },
      }

      local ensure_installed = vim.tbl_filter(function(key)
        return key ~= "roslyn_ls"
      end, vim.tbl_keys(servers or {}))

      vim.list_extend(ensure_installed, {
        "prettierd",
        "eslint_d",
        "netcoredbg",
        "js-debug-adapter",
        "stylua",
      })

      require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

      for name, server in pairs(servers) do
        vim.lsp.config(name, server)
        vim.lsp.enable(name)
      end
    end,
  },
}

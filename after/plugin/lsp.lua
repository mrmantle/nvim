require('mason').setup()
require('mason-lspconfig').setup()

local common = function(client, bufnr)
  client.server_capabilities.semanticTokensProvider = nil
  vim.api.nvim_set_option_value('omnifunc', 'v:lua.vim.lsp.omnifunc', { buf = bufnr })
  local bufopts = { noremap = true, silent = true, buffer = bufnr }

  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', '<C-s>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
end

local lsp_formatting = function(bufnr)
  vim.lsp.buf.format({
    async = false,
    filter = function(client)
      return client.name ~= 'tsserver'
    end,
    bufnr = bufnr,
  })
end

local formatting = function(client, bufnr)
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set({ 'n', 'x' }, '<leader>f', function() lsp_formatting(bufnr) end, bufopts)
  if client.supports_method('textDocument/formatting') then
    local group = vim.api.nvim_create_augroup('LspFormatOnSave', { clear = false })
    local event = 'BufWritePre'
    vim.api.nvim_clear_autocmds({ buffer = bufnr, group = group })
    vim.api.nvim_create_autocmd(event, {
      buffer = bufnr,
      group = group,
      callback = function() lsp_formatting(bufnr) end
    })
  end
end

local null_ls = require('null-ls')
null_ls.setup {
  on_attach = function(client, bufnr)
    formatting(client, bufnr)
  end,
  sources = {
    null_ls.builtins.formatting.prettierd
  }
}

local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lspconfig = require('lspconfig')

lspconfig.clangd.setup {
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    common(client, bufnr)
    formatting(client, bufnr)
  end
}

lspconfig.lua_ls.setup {
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    common(client, bufnr)
    formatting(client, bufnr)
  end,
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT'
      },
      diagnostics = {
        globals = { 'vim' }
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file('', true),
        checkThirdParty = false
      },
      telemetry = {
        enable = false
      }
    }
  }
}

lspconfig.marksman.setup {
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    common(client, bufnr)
  end,
}

lspconfig.html.setup {
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    common(client, bufnr)
  end,
  init_options = {
    provideFormatter = false
  }
}

lspconfig.cssls.setup {
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    common(client, bufnr)
  end,
  init_options = {
    provideFormatter = false
  }
}

lspconfig.jsonls.setup {
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    common(client, bufnr)
  end,
  init_options = {
    provideFormatter = false
  }
}

lspconfig.omnisharp.setup {
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    common(client, bufnr)
    formatting(client, bufnr)
  end
}

lspconfig.tsserver.setup {
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    common(client, bufnr)
  end
}

lspconfig.eslint.setup {
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    common(client, bufnr)
  end
}

lspconfig.angularls.setup {
  root_dir = lspconfig.util.root_pattern('angular.json', 'project.json'),
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    common(client, bufnr)
  end
}

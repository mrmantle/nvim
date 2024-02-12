require('mason').setup()
require('mason-lspconfig').setup()

local on_attach = function(client, bufnr)
  client.server_capabilities.semanticTokensProvider = nil
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  local bufopts = { noremap = true, silent = true, buffer = bufnr }

  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-s>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set({ 'n', 'x' }, '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)

  if client.supports_method('textDocument/formatting') then
    local group = vim.api.nvim_create_augroup('lsp_format_on_save', { clear = false })
    local event = 'BufWritePre'
    local async = event == 'BufWritePost'
    vim.api.nvim_clear_autocmds({ buffer = bufnr, group = group })
    vim.api.nvim_create_autocmd(event, {
      buffer = bufnr,
      group = group,
      callback = function()
        vim.lsp.buf.format({ bufnr = bufnr, async = async })
      end,
      desc = '[lsp] format on save',
    })
  end
end

require('null-ls').setup()
require('prettier').setup({
  bin = 'prettierd',
  filetypes = {
    'css',
    'graphql',
    'html',
    'javascript',
    'javascriptreact',
    'json',
    'less',
    'markdown',
    'scss',
    'typescript',
    'typescriptreact',
    'yaml',
  },
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lspconfig = require('lspconfig')

lspconfig.clangd.setup {
  capabilities = capabilities,
  on_attach = on_attach
}

lspconfig.lua_ls.setup {
  capabilities = capabilities,
  on_attach = on_attach,
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
  on_attach = on_attach
}

lspconfig.html.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  init_options = {
    provideFormatter = false
  }
}

lspconfig.cssls.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  init_options = {
    provideFormatter = false
  }
}

lspconfig.jsonls.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  init_options = {
    provideFormatter = false
  }
}

lspconfig.omnisharp.setup {
  capabilities = capabilities,
  on_attach = on_attach
}

lspconfig.tsserver.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  init_options = {
    provideFormatter = false
  }
}

lspconfig.eslint.setup {
  capabilities = capabilities,
  on_attach = on_attach
}

lspconfig.angularls.setup {
  root_dir = lspconfig.util.root_pattern('angular.json', 'project.json'),
  capabilities = capabilities,
  on_attach = on_attach
}

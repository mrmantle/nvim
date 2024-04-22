require('mason').setup()
require('mason-lspconfig').setup()

local common_on_attach = function(client, bufnr)
  client.server_capabilities.semanticTokensProvider = nil
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  local bufopts = { noremap = true, silent = true, buffer = bufnr }

  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-s>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
end

local lsp_formatting = function(bufnr, async)
  vim.lsp.buf.format({
    async = async,
    filter = function(client)
      return client.name ~= 'tsserver'
    end,
    bufnr = bufnr,
  })
end

local formatting_callback = function(client, bufnr)
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set({ 'n', 'x' }, '<leader>f', function() lsp_formatting(bufnr) end, bufopts)
  if client.supports_method('textDocument/formatting') then
    local group = vim.api.nvim_create_augroup('lsp_format_on_save', { clear = false })
    local event = 'BufWritePre'
    local async = event == 'BufWritePost'
    vim.api.nvim_clear_autocmds({ buffer = bufnr, group = group })
    vim.api.nvim_create_autocmd(event, {
      buffer = bufnr,
      group = group,
      callback = function() lsp_formatting(bufnr, async) end,
      desc = '[lsp] format on save',
    })
  end
end

require('null-ls.init').setup {
  on_attach = function(client, bufnr)
    formatting_callback(client, bufnr)
  end
}

local prettier = require('prettier')
prettier.setup({
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
  on_attach = function(client, bufnr)
    common_on_attach(client, bufnr)
    formatting_callback(client, bufnr)
  end
}

lspconfig.lua_ls.setup {
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    common_on_attach(client, bufnr)
    formatting_callback(client, bufnr)
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
    common_on_attach(client, bufnr)
  end,
}

lspconfig.html.setup {
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    common_on_attach(client, bufnr)
  end
}

lspconfig.cssls.setup {
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    common_on_attach(client, bufnr)
  end
}

lspconfig.jsonls.setup {
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    common_on_attach(client, bufnr)
  end
}

lspconfig.omnisharp.setup {
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    common_on_attach(client, bufnr)
    formatting_callback(client, bufnr)
  end
}

lspconfig.tsserver.setup {
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    common_on_attach(client, bufnr)
  end
}

lspconfig.eslint.setup {
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    common_on_attach(client, bufnr)
  end
}

lspconfig.angularls.setup {
  root_dir = lspconfig.util.root_pattern('angular.json', 'project.json'),
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    common_on_attach(client, bufnr)
  end
}

return {
  'mfussenegger/nvim-dap',
  dependencies = {
    'rcarriga/nvim-dap-ui',
    'nvim-neotest/nvim-nio',
  },
  keys = function(_, keys)
    local dap = require('dap')
    local dapui = require('dapui')
    return {
      { '<F5>', dap.continue, desc = 'Debug: Start/Continue' },
      { '<F1>', dap.step_into, desc = 'Debug: Step Into' },
      { '<F2>', dap.step_over, desc = 'Debug: Step Over' },
      { '<F3>', dap.step_out, desc = 'Debug: Step Out' },
      { '<F4>', dap.step_back, desc = 'Debug: Step Back' },
      { '<F8>', dap.close, desc = 'Debug: Stop' },
      { '<F9>', dap.disconnect, desc = 'Debug: Disconnect' },
      { '<leader>b', dap.toggle_breakpoint, desc = 'Debug: Toggle Breakpoint' },
      {
        '<leader>B',
        function()
          dap.set_breakpoint(vim.fn.input('Breakpoint condition: '))
        end,
        desc = 'Debug: Set Breakpoint',
      },
      { '<F7>', dapui.toggle, desc = 'Debug: See last session result.' },
      unpack(keys),
    }
  end,
  config = function()
    local dap = require('dap')
    dap.adapters.coreclr = {
      type = 'executable',
      command = vim.fn.exepath('netcoredbg'),
      args = { '--interpreter=vscode' },
      options = {
        detached = false,
      },
    }

    local function find_dll()
      local root = vim.fs.find(function(name, path)
        return name:match('%.csproj$') and path == vim.fn.getcwd()
      end, { type = 'file' })[1]
      if not root then
        return nil
      end

      local project_dir = vim.fn.fnamemodify(root, ':h')
      local dll_name = vim.fn.fnamemodify(root, ':t:r')

      local dlls = vim.fs.find({ dll_name .. '.dll' }, {
        path = project_dir .. '/bin/Debug/',
        type = 'file',
        limit = 10,
      })

      return dlls[#dlls]
    end

    dap.configurations.cs = {
      {
        type = 'coreclr',
        name = 'NetCoreDbg: Launch',
        request = 'launch',
        cwd = function()
          return vim.fn.getcwd()
        end,
        program = find_dll,
        justMyCode = false,
        stopAtEntry = false,
        env = {
          ASPNETCORE_ENVIRONMENT = 'Development',
          ASPNETCORE_URLS = 'http://localhost:5050',
        },
      },
    }

    local dapui = require('dapui')
    dapui.setup({
      expand_lines = false,
      icons = { expanded = '', collapsed = '', current_frame = '' },
      controls = {
        icons = {
          pause = '',
          play = '',
          step_into = '',
          step_over = '',
          step_out = '',
          step_back = '',
          run_last = '',
          terminate = '',
          disconnect = '',
        },
      },
      layouts = {
        {
          elements = {
            {
              id = 'scopes',
              size = 0.25,
            },
            {
              id = 'breakpoints',
              size = 0.25,
            },
            {
              id = 'stacks',
              size = 0.25,
            },
            {
              id = 'watches',
              size = 0.25,
            },
          },
          position = 'right',
          size = 85,
        },
        {
          elements = {
            {
              id = 'repl',
              size = 1,
            },
          },
          position = 'bottom',
          size = 25,
        },
      },
    })

    dap.listeners.after.event_initialized['dapui_config'] = dapui.open
    dap.listeners.before.event_terminated['dapui_config'] = dapui.close
    dap.listeners.before.event_exited['dapui_config'] = dapui.close
    dap.listeners.after.disconnect['dapui_config'] = dapui.close
  end,
}

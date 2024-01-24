local dap = require('dap')

vim.keymap.set('n', '<F5>', function() require('dap').continue() end)
vim.keymap.set('n', '<F10>', function() require('dap').step_over() end)
vim.keymap.set('n', '<F11>', function() require('dap').step_into() end)
vim.keymap.set('n', '<F12>', function() require('dap').step_out() end)
vim.keymap.set('n', '<Leader>b', function() require('dap').toggle_breakpoint() end)
vim.keymap.set('n', '<Leader>B', function() require('dap').set_breakpoint() end)
vim.keymap.set('n', '<Leader>lp',
  function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end)
vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end)
vim.keymap.set({ 'n', 'v' }, '<Leader>dh', function()
  require('dap.ui.widgets').hover()
end)
vim.keymap.set({ 'n', 'v' }, '<Leader>dp', function()
  require('dap.ui.widgets').preview()
end)
vim.keymap.set('n', '<Leader>df', function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.frames)
end)
vim.keymap.set('n', '<Leader>ds', function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.scopes)
end)

dap.adapters.coreclr = {
  type = 'executable',
  command =
  'C:\\Users\\matthew.mantle\\AppData\\Local\\nvim-data\\mason\\packages\\netcoredbg\\netcoredbg\\netcoredbg.exe',
  args = { '--interpreter=vscode' }
}

require("dap").adapters["pwa-chrome"] = {
  type = "server",
  host = "localhost",
  port = "4200",
  executable = {
    command = "node",
    -- 💀 Make sure to update this path to point to your installation
    args = { "C:\\Users\\matthew.mantle\\AppData\\Local\\nvim-data\\mason\\packages\\js-debug-adapter\\js-debug\\dapDebugServer.js", "4200" },
  }
}

dap.configurations.cs = {
  {
    type = 'coreclr',
    name = 'launch - netcoredbg',
    request = 'launch',
    program = function()
      return vim.fn.input('Path to dll: ', vim.fn.getcwd() .. '\\bin\\Debug\\', 'file')
    end,
  }
}

require("dap").configurations.typescript = {
  {
    type = "pwa-chrome",
    name = "Attach - Remote Debugging",
    request = "attach",
    program = "${file}",
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = "inspector",
    port = 9345,
    webRoot = "${workspaceFolder}",
  },
}

local dapui = require('dapui')
dapui.setup {
  controls = {
    element = "repl",
    enabled = true,
    icons = {
      disconnect = "",
      pause = "",
      play = "",
      run_last = "",
      step_back = "",
      step_into = "",
      step_out = "",
      step_over = "",
      terminate = ""
    }
  },
  element_mappings = {},
  expand_lines = true,
  floating = {
    border = "single",
    mappings = {
      close = { "q", "<Esc>" }
    }
  },
  force_buffers = true,
  icons = {
    collapsed = "",
    current_frame = "",
    expanded = ""
  },
  layouts = {
    {
      elements = {
        {
          id = "scopes",
          size = 0.25
        },
        {
          id = "breakpoints",
          size = 0.25
        },
        {
          id = "stacks",
          size = 0.25
        },
        {
          id = "watches",
          size = 0.25
        }
      },
      position = "left",
      size = 40
    },
    {
      elements = {
        {
          id = "repl",
          size = 0.5
        },
        {
          id = "console",
          size = 0.5
        }
      },
      position = "bottom",
      size = 10
    }
  },
  mappings = {
    edit = "e",
    expand = { "<CR>", "<2-LeftMouse>" },
    open = "o",
    remove = "d",
    repl = "r",
    toggle = "t"
  },
  render = {
    indent = 1,
    max_value_lines = 100
  }
}

dap.listeners.after.event_initialized['dapui_config'] = function()
  dapui.open()
end
dap.listeners.before.event_terminated['dapui_config'] = function()
  dapui.close()
end
dap.listeners.before.event_exited['dapui_config'] = function()
  dapui.close()
end

require('nvim-dap-virtual-text').setup {}


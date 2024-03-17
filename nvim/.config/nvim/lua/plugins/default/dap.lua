return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "mfussenegger/nvim-dap-python",
    "rcarriga/nvim-dap-ui",
    "theHamsta/nvim-dap-virtual-text",
    "tpope/vim-fugitive",
  },
  config = function()
    require("dapui").setup()
    require("dap-python").setup("python")

    local dap, dapui = require("dap"), require("dapui")

    dap.adapters.python = {
      type = 'executable',
      command = 'python',
      args = { '-m', 'debugpy.adapter' },
    }

    vim.keymap.set('n', '<F5>', function() require('dap').continue() end, {})
    vim.keymap.set('n', '<F10>', function() require('dap').step_over() end, {})
    vim.keymap.set('n', '<F11>', function() require('dap').step_into() end, {})
    vim.keymap.set('n', '<F12>', function() require('dap').step_out() end, {})
    vim.keymap.set('n', '<Leader>b', function() require('dap').toggle_breakpoint() end, {}) -- set breakpoint
    vim.keymap.set('n', '<Leader>B', function() require('dap').set_breakpoint() end, {})    -- terminate
    vim.keymap.set('n', '<Leader>lp',
      function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end, {})
    vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end, {})
    vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end, {})
    vim.keymap.set({ 'n', 'v' }, '<Leader>dh', function()
      require('dap.ui.widgets').hover()
    end, {})
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

    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end

    require("nvim-dap-virtual-text").setup({})
  end,
}

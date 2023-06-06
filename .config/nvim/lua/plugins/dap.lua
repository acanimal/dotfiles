  return {
  "mfussenegger/nvim-dap",
  dependencies = {
    'theHamsta/nvim-dap-virtual-text',
    'rcarriga/nvim-dap-ui',
    'mxsdev/nvim-dap-vscode-js'
  },
  config = function()
    local dap = require("dap")
    local dapwidgets = require('dap.ui.widgets')
    local dapui = require("dapui")
    dapui.setup()
    require("nvim-dap-virtual-text").setup()

    -- define keymap for dap
    vim.keymap.set('n', '<F5>', function() dap.continue() end)
    vim.keymap.set('n', '<F10>', function() dap.step_over() end)
    vim.keymap.set('n', '<F11>', function() dap.step_into() end)
    vim.keymap.set('n', '<F12>', function() dap.step_out() end)
    vim.keymap.set('n', '<Leader>b', function() dap.toggle_breakpoint() end)
    vim.keymap.set('n', '<Leader>B', function() dap.set_breakpoint() end)
    vim.keymap.set('n', '<Leader>lp', function() dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
    vim.keymap.set('n', '<Leader>dr', function() dap.repl.open() end)
    vim.keymap.set('n', '<Leader>dl', function() dap.run_last() end)
    vim.keymap.set({'n', 'v'}, '<Leader>dh', function() dapwidgets.hover() end)
    vim.keymap.set({'n', 'v'}, '<Leader>dp', function() dapwidgets.preview() end)
    vim.keymap.set('n', '<Leader>df', function() dapwidgets.centered_float(dapwidgets.frames) end)
    vim.keymap.set('n', '<Leader>ds', function() dapwidgets.centered_float(dapwidgets.scopes) end)

    -- define listeners to open/close dapui automatically
    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close()
    end

    -- configure adapter for node
    dap.adapters["node-terminal"] = {
      type = "server",
      host = "localhost",
      port = "${port}",
      executable = {
        command = "js-debug-adapter",
        args = {"${port}"}
      }
    }

    dap.configurations.typescript = {
      {
        type= "node-terminal",
        request= "launch",
        name="Worker Automatic Vetting",
        runtimeArgs={
          "-r", "ts-node/register"
        },
        cwd="${workspaceFolder}/paclages/api",
        env={TS_NODE_PROJECT="${workspaceFolder}/packages/api/tsconfig.json"},
        args={"${workspaceFolder}/packages/api/workers/AutomaticVetting/run.ts"}
      }
    }

    -- note we attach the "node" configuration types to TS and JS configurations
    -- require('dap.ext.vscode').load_launchjs(nil, {
    --   node = {'typescript', 'javascript'}
    -- })
  end
}


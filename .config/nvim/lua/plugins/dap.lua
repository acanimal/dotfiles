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
    local dapvscode = require("dap-vscode-js")
    local dapextcode = require('dap.ext.vscode')
    local dapvirtualtext = require("nvim-dap-virtual-text")

    dapui.setup()
    dapvirtualtext.setup()

    -- define keymap for dap
    vim.keymap.set('n', '<Leader>dc', function() dap.continue() end, { desc = 'Debug start/continue' })
    vim.keymap.set('n', '<Leader>ds', function() dap.terminate({}, {}, function() print "DAP session finished" end) end,
      { desc = 'Debug stop/delete session' })
    vim.keymap.set('n', '<Leader>do', function() dap.step_over() end, { desc = 'Debug step over' })
    vim.keymap.set('n', '<Leader>di', function() dap.step_into() end, { desc = 'Debug step into' })
    vim.keymap.set('n', '<Leader>du', function() dap.step_out() end, { desc = 'Debug step out' })
    vim.keymap.set('n', '<Leader>db', function() dap.toggle_breakpoint() end, { desc = 'Debug toggle breakpoint' })
    vim.keymap.set('n', '<Leader>dB', function() dap.set_breakpoint() end, { desc = 'Debug set breakpoint' })
    vim.keymap.set('n', '<Leader>dlp', function() dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end,
      { desc = 'Debug set breackpoint with log message' })
    vim.keymap.set('n', '<Leader>dr', function() dap.repl.open() end, { desc = 'Debug open REPL' })
    vim.keymap.set('n', '<Leader>dR', function() dap.repl.close() end, { desc = 'Debug close REPL' })
    vim.keymap.set('n', '<Leader>dl', function() dap.run_last() end, { desc = 'Debug run last' })
    vim.keymap.set({ 'n', 'v' }, '<Leader>dh', function() dapwidgets.hover() end, { desc = 'Debug widgets hover' })
    vim.keymap.set({ 'n', 'v' }, '<Leader>dp', function() dapwidgets.preview() end, { desc = 'Debug widgets preview' })
    vim.keymap.set('n', '<Leader>dF', function() dapwidgets.centered_float(dapwidgets.frames) end,
      { desc = 'Debug widgets frames' })
    vim.keymap.set('n', '<Leader>dS', function() dapwidgets.centered_float(dapwidgets.scopes) end,
      { desc = 'Debug widgets scopes' })

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

    dapvscode.setup({
      debugger_path = require('mason-registry').get_package('js-debug-adapter'):get_install_path(),
      debugger_cmd = { "js-debug-adapter" },
      adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' },                          -- which adapters to register in nvim-dap
      log_file_path = require('mason-registry').get_package('js-debug-adapter'):get_install_path() ..
      "/dap_vscode_js.log",                                                                                                 -- Path for file logging
      log_file_level = vim.log.levels.DEBUG,                                                                                -- Logging level for output to file. Set to false to disable file logging.
      log_console_level = vim.log.levels
      .DEBUG                                                                                                                -- Logging level for output to console. Set to false to disable console output.
    })

    -- We need to redefine pwd-node adapter due some issue with vscode-js-debug
    -- See: https://github.com/mxsdev/nvim-dap-vscode-js/issues/42
    dap.adapters["pwa-node"] = {
      type = "server",
      host = "localhost",
      port = "${port}",
      executable = {
        -- If vscode-js-debug is installed with mason it is in the path
        command = "js-debug-adapter",
        args = { "${port}" },
      }
    }

    -- Load .vscode/launch.json file and associate all "node" configurations to typescript and javascript filetypes
    if vim.loop.fs_stat('.vscode/launch.json') then
      dapextcode.load_launchjs(nil, {
        node = { 'typescript', 'javascript' }
      })
      -- ensure all configurations are pwa-node to work properly with dap-vscode-js
      for i, config in ipairs(dap.configurations.typescript) do
        config["type"] = "pwa-node"
      end
    end
  end
}


local dap = require('dap')
dap.adapters.node2 = {
  type = 'executable',
  command = 'node',
  args = {DATA_PATH .. '/debuggers/vscode-node-debug2/out/src/nodeDebug.js'},
}
dap.configurations.typescript = {
	{
	  name = "jest test",
      type = 'node2',
      request = 'launch',
      cwd = vim.fn.getcwd(),
      runtimeArgs = {
			'--inspect-brk',
			'${workspaceRoot}/node_modules/.bin/jest',
			'--config',
			'${workspaceRoot}/jest.config.unit.js',
			'--no-coverage',
			'--',
			"${file}",
      sourceMaps = true,
      protocol = 'inspector',
      skipFiles = {'<node_internals>/**/*.js'},
      console = 'integratedTerminal',
      port = 9229,
      }
}}

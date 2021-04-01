
local dap = require('dap')
dap.adapters.node2 = {
  type = 'executable',
  command = 'node',
  args = {DATA_PATH .. '/debuggers/vscode-node-debug2/out/src/nodeDebug.js'},
}
dap.configurations.typescript = {
  {
	name = "debug test npm",
    type = 'node2',
    request = 'launch',
	runtimeExecutable="npm",
	runtimeArgs = {
		"test"
	},
	port = 9229
   --  program = '${file}',
   --  cwd = vim.fn.getcwd(),
   --  sourceMaps = true,
   --  protocol = 'inspector',
   --  console = 'integratedTerminal',
  },
  {
    type = 'node2',
    request = 'launch',
	name = "debug Mocha",
	runtimeExecutable="npm",
	runtimeArgs = {
		"-r",
		"ts-node/require",
		"--timeout",
		"999999"
	},
    program = '${file}',
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = 'inspector',
    console = 'integratedTerminal',
  },
}

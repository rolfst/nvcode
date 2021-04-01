local dap = require('dap')
dap.set_log_level('TRACE')
dap.adapters.node2 = {
  name = 'node-debug',
  type = 'executable',
  command = 'node',
  args = 	'/home/rolfst/.local/share/nvim/debuggers/vscode-node-debug2/out/src/nodeDebugAdapter.js',

}
dap.configurations.javascript = {
  {
--	name = "debug test npm",
--    type = 'node2',
--    request = 'launch',
--	runtimeExecutable="npm",
--	runtimeArgs = {
--		"test"
--	},
--	port = 9229
--   --  program = '${file}',
--   --  cwd = vim.fn.getcwd(),
--   --  sourceMaps = true,
--   --  protocol = 'inspector',
--   --  console = 'integratedTerminal',
--  },
--  {
    type = 'node2',
    request = 'launch',
	name = "debug Mocha",
    program = '${workspaceFolder}/${file}',
   --  cwd = vim.fn.getcwd(),
   --  sourceMaps = true,
   --  protocol = 'inspector',
   --  console = 'integratedTerminal',
  },
}

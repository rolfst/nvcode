local dap = require('dap')
dap.set_log_level('TRACE')
dap.adapters.node2 = {
  type = 'executable',
  command = 'node',
  args = 	'/home/rolfst/.local/share/nvim/debuggers/vscode-node-debug2/out/src/nodeDebugAdapter.js',

}
dap.configurations.javascript = {
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
	  },
      sourceMaps = true,
      protocol = 'inspector',
      skipFiles = {'<node_internals>/**/*.js'},
      console = 'integratedTerminal',
      port = 9229,
      },
	{
	  name = "launch",
      type = 'node2',
      request = 'launch',
      cwd = vim.fn.getcwd(),
	  program = '${workspaceFolder}/${file}',
      sourceMaps = true,
      protocol = 'inspector',
      skipFiles = {'<node_internals>/**/*.js'},
      console = 'integratedTerminal',
      port = 9229,
      }
--   {
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
--   {
--     type = 'node2',
--     request = 'launch',
-- 	name = "debug Mocha",
--     program = '${workspaceFolder}/${file}',
--    --  cwd = vim.fn.getcwd(),
--    --  sourceMaps = true,
--    --  protocol = 'inspector',
--    --  console = 'integratedTerminal',
--   },
}


local dap = require('dap')
vim.fn.sign_define('DapBreakpoint', {text='🟥', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapStopped', {text='🟢', texthl='', linehl='', numhl=''})
require('nv-nvim-dap.javascript')
require('nv-nvim-dap.typescript')

-- vim.cmd [[nnoremap <silent> <F5> :lua require'dap'.continue()<CR>]]
-- vim.cmd [[nnoremap <silent> <F10> :lua require'dap'.step_over()<CR>]]
-- vim.cmd [[nnoremap <silent> <F11> :lua require'dap'.step_into()<CR>]]
-- vim.cmd [[nnoremap <silent> <F10> :lua require'dap'.step_out()<CR>]]

-- vim.cmd [[nnoremap <silent> <leader>db :lua require'dap'.toggle_breakpoint()<CR>]]
-- vim.cmd [[nnoremap <silent> <leader>dB :lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>]]
-- vim.cmd [[nnoremap <silent> <leader>dl :lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>]]
-- vim.cmd [[nnoremap <silent> <leader>dr :lua require'dap'.repl.open()<CR>]]
-- vim.cmd [[nnoremap <silent> <leader>drl :lua require'dap'.repl.run_last()<CR>]]


-- vim.cmd [[nnoremap <silent> <space>dh :lua require('dap.ui.variables').hover()<CR>]]

-- vim.cmd [[nnoremap <leader>dcc  :lua require("telescope").extensions.dap.commands{}<CR>]]
-- vim.cmd [[nnoremap <leader>dco  :lua require("telescope").extensions.dap.configurations{}<CR>]]
-- vim.cmd [[nnoremap <leader>dlb  :lua require("telescope").extensions.dap.list_breakpoints{}<CR>]]
-- vim.cmd [[nnoremap <leader>dv   :lua require("telescope").extensions.dap.variables{}<CR>]]
-- vim.cmd [[nnoremap <leader>df   :lua require("telescope").extensions.dap.frames{}<CR>]]

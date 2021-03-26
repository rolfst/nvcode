
function buf_option(...)
  vim.api.nvim_buf_set_option(bufnr, ...)
end

local function on_attach(client)
  buf_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  vim.cmd('nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>')
  vim.cmd('nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>')
  vim.cmd('nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>')
  vim.cmd('nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>')
  vim.cmd('nnoremap <silent> ca :Lspsaga code_action<CR>')
  vim.cmd('nnoremap <silent> K :Lspsaga hover_doc<CR>')
  -- vim.cmd('nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>')
  vim.cmd('nnoremap <silent> <C-p> :Lspsaga diagnostic_jump_prev<CR>')
  vim.cmd('nnoremap <silent> <C-n> :Lspsaga diagnostic_jump_next<CR>')
  -- scroll down hover doc or scroll in definition preview
  vim.cmd('nnoremap <silent> <C-f> <cmd>lua require(\'lspsaga.action\').smart_scroll_with_saga(1)<CR>')
  -- scroll up hover doc
  vim.cmd('nnoremap <silent> <C-b> <cmd>lua require(\'lspsaga.action\').smart_scroll_with_saga(-1)<CR>')
  vim.cmd('command! -nargs=0 LspVirtualTextToggle lua require("lsp/virtual_text").toggle()')
  --   buf_map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  --   buf_map('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  --   buf_map('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  --   buf_map('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  --   buf_map('n', '<leader>ct', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  --   buf_map('n', '<leader>crn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  --   buf_map('n', '<leader>cr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  --   buf_map('n', '<leader>cl', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics({ show_header = false })<CR>', opts)
  --   buf_map('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  --   buf_map('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  --   buf_map('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  --   buf_map('n', '<leader>cq', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  --   buf_map('i', '<Tab>', 'pumvisible() ? "<C-n>" : "<Tab>"', { expr = true, noremap = true })
  --   buf_map('i', '<S-Tab>', 'pumvisible() ? "<C-p>" : "<S-Tab>"', { expr = true, noremap = true })

  -- if client.resolved_capabilities.document_formatting then
  --   vim.api.nvim_command [[augroup Format]]
  --   vim.api.nvim_command [[autocmd! * <buffer>]]
  --   vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync(nil, 1000)]]
  --   vim.api.nvim_command [[augroup END]]
  -- end

  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
      vim.cmd("nnoremap <silent> <leader>lf <cmd>lua vim.lsp.buf.formatting()<CR>")
  elseif client.resolved_capabilities.document_range_formatting then
      vim.cmd("nnoremap <silent> <leader>lf <cmd>lua vim.lsp.buf.range_formatting()<CR>")
  end

  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
      vim.api.nvim_exec([[
      hi LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
      hi LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
      hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
      augroup lsp_document_highlight
      autocmd! * <buffer>
      autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
      autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
      ]], false)
  end
end

return on_attach

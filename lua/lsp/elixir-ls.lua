local on_attach = require('lsp.on_attach')

require 'lspconfig'.elixirls.setup{
	cmd = DATA_PATH ..  { "nvim/nvim_lsp/elixir-ls/release/language_server.sh" },
	on_attach = function(client)
		client.resolved_capabilities.document_formatting = false
		on_attach(client)
  end
}

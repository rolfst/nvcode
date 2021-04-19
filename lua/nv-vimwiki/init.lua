vim.g.vimwiki_global_ext = 0
local wiki_1 = {}
wiki_1.path = '~/googlerolf/vimwiki/'
wiki_1.syntax = 'markdown'
wiki_1.ext = '.md'

vim.g.vimwiki_list = {wiki_1}
vim.g.vimwiki_ext2syntax = {
	
		['.md'] = 'markdown',
		['.markdown'] = 'markdown',
		['.mdown'] = 'markdown',
}

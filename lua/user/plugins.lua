--Basic Plugins Manager. Each Plugin will have its own .lua
--file for additional corrections


--TODO: Add bootstrap loader and autoload commands.


local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.local/nvim/plugged')

---------Plugins can begin after this line----------
--
--Lua Stuff
Plug('nvim-lua/popup.nvim')
Plug('nvim-lua/plenary.nvim')
Plug('hrsh7th/nvim-compe')

--Nerd Tree
Plug('scrooloose/nerdtree', {on = 'NERDTreeToggle'})
Plug('ryanoasis/vim-devicons')


--LSP
Plug('neovim/nvim-lspconfig')
Plug('kabouzeid/nvim-lspinstall')
Plug('glepnir/lspsaga.nvim') --TODO: Setup Plugins


--Powerline and Airline
Plug('vim-airline/vim-airline')
Plug('vim-airline/vim-airline-themes')
Plug('powerline/powerline') --TODO: Setup File


--Tree Sitter
Plug('nvim-treesitter/nvim-treesitter', {
	['do'] = vim.fn[':TSUpdate']
}) --TODO: Setupfile


--AutoPairs
Plug('jiangmiao/auto-pairs')


--Html plugins
Plug('mattn/emmet-vim')
Plug('tpope/vim-surround')


--Fzzy Finder
Plug('junegunn/fzf', {['do'] = vim.fn['fzf#install']})


--Telescope
Plug('nvim-telescope/telescope.nvim')


--Themes
Plug('joshdick/onedark.vim') --TODO: Setupfile
Plug('Tomasr/molokai')


--Snippits
Plug ('rafamadriz/friendly-snippets') --TODO: Setupfile

--TODO: Add completions
vim.call('plug#end')

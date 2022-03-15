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


--Completion and Snippits
Plug('hrsh7th/nvim-cmp') -- The completion plugin
Plug('hrsh7th/cmp-buffer') -- buffer completions
Plug('hrsh7th/cmp-path') -- path completions
Plug('hrsh7th/cmp-cmdline') -- cmdline completions
Plug('saadparwaiz1/cmp_luasnip') -- snippet completions
Plug('hrsh7th/cmp-nvim-lsp')

-- snippets
Plug('L3MON4D3/LuaSnip') --snippet engine
Plug('rafamadriz/friendly-snippets')

--LSP
Plug('neovim/nvim-lspconfig')
--Plug('kabouzeid/nvim-lspinstall')
Plug('williamboman/nvim-lsp-installer')
Plug('glepnir/lspsaga.nvim') --TODO: Setup Plugins
Plug('tamago324/nlsp-settings.nvim') -- language server settings defined in json for
Plug('jose-elias-alvarez/null-ls.nvim') -- for formatters and linters


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
Plug('overcache/NeoSolarized')


--Snippits
Plug ('rafamadriz/friendly-snippets') --TODO: Setupfile

--TODO: Add completions
Plug('ryanoasis/vim-devicons')

vim.call('plug#end')

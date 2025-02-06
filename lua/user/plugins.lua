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
Plug('Xuyuanp/nerdtree-git-plugin')

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
Plug('williamboman/nvim-lsp-installer')
Plug('neovim/nvim-lspconfig')
--Plug('kabouzeid/nvim-lspinstall')
Plug('glepnir/lspsaga.nvim') --TODO: Setup Plugins
Plug('tamago324/nlsp-settings.nvim') -- language server settings defined in json for
Plug('jose-elias-alvarez/null-ls.nvim') -- for formatters and linters


--Powerline and Airline
Plug('vim-airline/vim-airline')
Plug('vim-airline/vim-airline-themes')
--Plug('powerline/powerline') --TODO: Setup File

--Easy Motion
Plug('easymotion/vim-easymotion')
Plug('unblevable/quick-scope')
--Tree Sitter
Plug('nvim-treesitter/nvim-treesitter', {
	['do'] = vim.fn[':TSUpdate']
}) --TODO: Setupfile

-- Context plugins
--Plug('nvim-treesitter/nvim-treesitter-context')
--Plug('wellle/context.vim')

--AutoPairs
Plug('jiangmiao/auto-pairs')


--Html plugins
--Plug('mattn/emmet-vim')
Plug('tpope/vim-surround')
Plug('tpope/vim-fugitive')


--Fzzy Finder
Plug('junegunn/fzf', {['do'] = vim.fn['fzf#install']})


--Telescope
Plug('nvim-telescope/telescope.nvim')

--Scratch page
Plug('mtth/scratch.vim')

--Themes
Plug('joshdick/onedark.vim') --TODO: Setupfile
Plug('Tomasr/molokai')
Plug('overcache/NeoSolarized')
Plug('morhetz/gruvbox')


--TODO: Add completions
Plug('ryanoasis/vim-devicons')

--Git Support
Plug('lewis6991/gitsigns.nvim')

--floating terminal
Plug('voldikss/vim-floaterm')

Plug('bronson/vim-trailing-whitespace')
Plug('justinmk/vim-sneak')
Plug('AndrewRadev/linediff.vim')
Plug('dhruvasagar/vim-zoom')

Plug('vim-test/vim-test')
Plug('kdheepak/lazygit.nvim')
--Plug('harrisoncramer/gitlab.nvim')
--
Plug('smithbm2316/centerpad.nvim')

--Plug('psf/black')

-- maybe the gitlab integration:
-- gitlab.com/gitlab-org/editor-extensions/gitlab.vim
vim.call('plug#end')

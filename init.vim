call plug#begin('~/.local/nvim/plugged')

Plug 'mattn/emmet-vim'
""Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Tomasr/molokai'
Plug 'neovim/nvim-lspconfig'
Plug 'kabouzeid/nvim-lspinstall'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
""Plug 'bling/vim-airline'
Plug 'junegunn/vim-easy-align'
""Plug 'https://github.com/junegunn/vim-github-dashboard.git'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
""Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
""Plug 'dracula/vim'
Plug 'powerline/powerline'
Plug 'joshdick/onedark.vim'
Plug 'neovim/nvim-lspconfig'
Plug 'glepnir/lspsaga.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'tree-sitter/tree-sitter'
Plug 'hrsh7th/nvim-compe'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'jiangmiao/auto-pairs'
Plug 'ryanoasis/vim-devicons'
""Plug 'SirVer/ultisnips'
"lug 'honza/vim-snippets'
""Plug 'preservim/nerdcommenter'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
")"Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-surround'

call plug#end()
set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/
  
  " Always show statusline
  set laststatus=2
  
  " Use 256 colours (Use this setting only if your terminal supports 256 colours)
  set t_Co=256

let g:webdevicons_enable_flagship_statusline = 1
let g:airline_powerline_fonts = 1
let mapleader = " "

"" colorscheme evening
"" colorscheme dracula
colorscheme onedark

""colorscheme molkai
let g:airline_theme='papercolor'

inoremap jk <ESC>

"let g:airline#extensions#tabline#formatter = 'default'
lua << EOF
require'lspinstall'.setup() -- important

local servers = require'lspinstall'.installed_servers()
for _, server in pairs(servers) do
  require'lspconfig'[server].setup{}
end

require'lspconfig'.util.root_pattern{}
require'lspconfig'.cmake.setup{}
require'lspconfig'.pyright.setup{}
require'lspconfig'.clangd.setup{}

require'nvim-treesitter.configs'.setup {
    -- One of "all", "maintained" (parsers with maintainers), or a list of languages
    ensure_installed = "maintained",
    -- Install languages synchronously (only applied to `ensure_installed`)
    sync_install = false,
    -- List of parsers to ignore installing
    highlight = {
      -- `false` will disable the whole extension
      enable = true,
      -- list of language that will be disabled
      -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
      -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
      -- Using this option may slow down your editor, and you may see some duplicate highlights.
      -- Instead of true it can also be a list of languages
      additional_vim_regex_highlighting = false,
    },
  }

EOF

set equalalways
set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching 
set ignorecase              " case insensitive 
set mouse=v                 " middle-click paste with 
set hlsearch                " highlight search 
set incsearch               " incremental search
set tabstop=4               " number of columns occupied by a tab 
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
set cc=80                  " set an 80 column border for good coding style
filetype plugin indent on   "allow auto-indenting depending on file type
syntax on                   " syntax highlighting
set mouse=a                 " enable mouse click
set clipboard=unnamedplus   " using system clipboard
filetype plugin on
set cursorline              " highlight current cursorline
set ttyfast                 " Speed up scrolling in Vim
"set spell                 " enable spell check (may need to download language package)
set noswapfile            " disable creating swap file
" set backupdir=~/.cache/vim " Direkctory to store backup files.
set wrap

""inoremap ( ()<left>
""inoremap [ []<left>
""inoremap { {}<left>
""inoremap {<CR> {<CR>}<ESC>O
"""inoremap {;<CR> {<CR>};<ESC>O
""inoremap <expr> ) strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"
""inoremap <expr> } strpart(getline('.'), col('.')-1, 1) == "}" ? "\<Right>" : "}"
""inoremap <expr> ] strpart(getline('.'), col('.')-1, 1) == "]" ? "\<Right>" : "]"
""inoremap <expr> ' strpart(getline('.'), col('.')-1, 1) == "\'" ? "\<Right>" : "\'\'\<Left>"
"""inoremap <expr> " strpart(getline('.'), col('.')-1, 1) == "\"" ? "\<Right>" : "\"\"\<Left>"
nnoremap <leader>h <C-W>h
nnoremap <leader>j <C-W>j
nnoremap <leader>k <C-W>k
nnoremap <leader>l <C-W>l
nnoremap <leader>+ :vs<CR>
nnoremap <leader>- :close<CR>
nnoremap <C-t> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <leader>n :NERDTreeToggle<CR>
"nnoremap <C-f> NERDTreeFind<CR>

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

nnoremap <C-f> :FZF<cr>

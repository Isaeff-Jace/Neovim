local options = {
  backup = false,                          -- creates a backup file
  --clipboard = "unnamedplus",               -- allows neovim to access the system clipboard
  cmdheight = 2,                           -- more space in the neovim command line for displaying messages
  completeopt = { "menuone", "noselect" }, -- mostly just for cmp
  conceallevel = 0,                        -- so that `` is visible in markdown files
  encoding = "utf-8",                  -- the encoding written to a file
  hlsearch = false,                         -- highlight all matches on previous search pattern
  incsearch = true,
  ignorecase = true,                       -- ignore case in search patterns
  --mouse = "a",                             -- allow the mouse to be used in neovim
  mouse = "",                             -- allow the mouse to be used in neovim
  pumheight = 10,                          -- pop up menu height
  showmode = false,                        -- we don't need to see things like -- INSERT -- anymore
  --Shows the long blue lines where tabs are. 0 is none, 1 is some, 2 is always
  showtabline = 1,                         -- always show tabs
  smartcase = true,                        -- smart case
  smartindent = true,                      -- make indenting smarter again
  splitbelow = true,                       -- force all horizontal splits to go below current window
  splitright = true,                       -- force all vertical splits to go to the right of current window
  swapfile = false,                        -- creates a swapfile
  termguicolors = false,                    -- set term gui colors (most terminals support this)
  timeoutlen = 1000,                        -- time to wait for a mapped sequence to complete (in milliseconds)
  undofile = true,                         -- enable persistent undo
  updatetime = 300,                        -- faster completion (4000ms default)
  writebackup = false,                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  expandtab = true,                        -- convert tabs to spaces
  shiftwidth = 4,                          -- the number of spaces inserted for each indentation
  tabstop = 4,                             -- insert 2 spaces for a tab
  softtabstop = 4,
  --autoindent = true,
  cursorline = true,                       -- highlight the current line
  number = true,                           -- set numbered lines
  relativenumber = true,                  -- set relative numbered lines
  numberwidth = 4,                         -- set number column width to 2 {default 4}
  signcolumn = "yes",                      -- always show the sign column, otherwise it would shift the text each time
  colorcolumn = "80",
  wrap = false,                            -- display lines as one long line
  scrolloff = 8,                           -- is one of my fav
  sidescrolloff = 8,
  equalalways = true,
  textwidth = 80,
  guicursor = "",
}

vim.opt.shortmess:append "c"

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.api.nvim_command('autocmd TermOpen * startinsert')
vim.api.nvim_command('autocmd TermOpen * setlocal nonumber norelativenumber signcolumn=no')
vim.api.nvim_command('autocmd BufWinEnter,WinEnter term://* startinsert')
vim.api.nvim_command('autocmd BufLeave term://* stopinsert')

vim.g.python_host_prog = 'python3'
vim.g.python3_host_prog = 'python3.9'
vim.g.NERDTreeGitStatusUseNerdFonts = 1
vim.g.scratch_persistence_file = '/tmp/scratch.vim'

vim.lsp.set_log_level("debug")

vim.api.nvim_create_user_command('DiffOrig', 'vert new | set buftype=nofile | read ++edit # | 0d_ | diffthis | wincmd p | diffthis', {})

--vim.g.python_indent = {}
--vim.g.python_indent.disable_parentheses_indenting = false
--vim.g.python_indent.closed_paren_align_last_line = true
--vim.g.python_indent.searchpair_timeout = 150
--vim.g.python_indent.continue = 'shiftwidth()'
--vim.g.python_indent.open_paren = 'shiftwidth()'
--vim.g.python_indent.nested_paren = 'shiftwidth()'

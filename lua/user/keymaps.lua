local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap


--how the keymap works
--keymap(mode, newMapping, oldMapping, opts)


--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",
--
-- Git --
keymap("n", ",r", ":Gitsigns reset_hunk<CR>", opts)
keymap("v", ",r", ":Gitsigns reset_hunk<CR>", opts)
keymap("n", ",s", ":Gitsigns stage_hunk<CR>", opts)
keymap("v", ",s", ":Gitsigns stage_hunk<CR>", opts)
keymap("n", ",b", ":Gitsigns blame_line<CR>", opts)
keymap("n", "=", ":Gitsigns next_hunk<CR>", opts)
keymap("n", "-", ":Gitsigns prev_hunk<CR>", opts)
keymap("n", ",d", ":Gitsigns diffthis<CR>", opts)
keymap("n", ",S", ":Gitsigns stage_buffer<CR>", opts)
keymap("n", ",R", ":Gitsigns reset_buffer<CR>", opts)
keymap("n", ",t", ":Gitsigns toggle_deleted<CR>", opts)

-- Set F5 to refresh buffers
keymap("n", "<F5>", ":checkt<CR>", opts)

keymap("n", "<BS>", ":noh<CR>", opts)
-- Normal --
-- Better window navigation
-- keymap("n", "<leader>j", "<C-w>j", opts)
-- keymap("n", "<leader>h", "<C-w>h", opts)
-- keymap("n", "<leader>k", "<C-w>k", opts)
-- keymap("n", "<leader>l", "<C-w>l", opts)
-- keymap("n", "<leader>v", ":vs<CR>", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
keymap("n", "gl", "g_", opts)
keymap("n", "gh", "^", opts)
keymap("n", "gp", "%", opts)
keymap("v", "gl", "g_", opts)
keymap("v", "gh", "^", opts)
keymap("v", "gp", "%", opts)

keymap('n', 'mm', 'zz', opts)
-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<Tab>", ":bnext<CR>", opts)
keymap("n", "<S-Tab>", ":bprevious<CR>", opts)
--keymap("n", "<Tab>", ":tabNext<CR>", opts)
--keymap("n", "<S-Tab>", ":tabprevious<CR>", opts)
--keymap("n", "<leader><Tab>", ":tabnew<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

--NerdTree
keymap("n", "<leader>t", ":NERDTreeToggle<CR>", opts)
keymap("n", "<leader>n", ":NERDTreeFocus<CR>", opts)

-- FZF
keymap("n", "<C-f>", ":FZF<CR>", opts)

-- Telescope
-- This has a ripgrep dependency on it. 
keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts) --Live_grep
keymap("n", "<leader>fg", ":Telescope live_grep<CR>", opts) --Live_grep
keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts) --Live_grep
keymap("n", "<leader>fh", ":Telescope help_tags<CR>", opts) --Live_grep


keymap("n", "[q", ":cprevious<CR>", opts) --Live_grep
keymap("n", "]q", ":cnext<CR>", opts) --Live_grep

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
--Better terminal navigation
keymap("n", "<leader>\\", ":FloatermToggle<CR>", opts)
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)
keymap("t", "<Esc>", "<C-\\><C-N>", term_opts)

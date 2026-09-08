local opts = { noremap = true, silent = true }
local map = vim.api.nvim_set_keymap

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- No ops because I screw things up
map("", "<Space>", "<Nop>", opts)
map("n", "<F1>", "<Nop>", opts)
map("x", "<C-w>o", "<Nop>", opts)

-- Refresh with F5
map("n", "<F5>", ":checkt<CR>", opts)

-- Turn off highlight
map("n", "<BS>", ":noh<CR>", opts)

-- My awesome motions
map("n", "gl", "g_", opts)
map("n", "gh", "^", opts)
map("n", "gp", "%", opts)
map("v", "gl", "g_", opts)
map("v", "gh", "^", opts)
map("v", "gp", "%", opts)

-- Window resizing
map("n", "<C-Up>", ":resize -2<CR>", opts)
map("n", "<C-Down>", ":resize +2<CR>", opts)
map("n", "<C-Left>", ":vertical resize -2<CR>", opts)
map("n", "<C-Right>", ":vertical resize +2<CR>", opts)

--map("n", "<Up>", "5k", opts)
--map("n", "<Down>", "5j", opts)
--
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

vim.keymap.set('n', '<leader>m', function()
    prev_reg = vim.api.nvim_exec([[echo getreg('"')]], true)
    new_val = string.gsub(prev_reg, '^%s*(.-)%s*$', '%1')
    vim.fn.setreg('"', new_val)
    vim.api.nvim_command([[normal p]])
end)

vim.keymap.set("n", "<F3>", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Navigate buffers
map("n", "<Tab>", ":bnext<CR>", opts)
map("n", "<S-Tab>", ":bprevious<CR>", opts)
map("n", "L", ":tabnext<CR>", opts)
map("n", "H", ":tabprevious<CR>", opts)

-- Move text up and down
map("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
map("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Insert --
-- Press jk fast to enter
map("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- Move text up and down
map("v", "<A-j>", ":m .+1<CR>==", opts)
map("v", "<A-k>", ":m .-2<CR>==", opts)
--map("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
map("x", "J", ":move '>+1<CR>gv-gv", opts)
map("x", "K", ":move '<-2<CR>gv-gv", opts)
map("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
map("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Easy config editing
map("n", "<F7>", ":Vex ~/.config/nvim/", opts)

-- Term remaps
map("t", "<C-w>h", "<C-\\><C-N><C-w>h", opts)
map("t", "<C-w>j", "<C-\\><C-N><C-w>j", opts)
map("t", "<C-w>k", "<C-\\><C-N><C-w>k", opts)
map("t", "<C-w>l", "<C-\\><C-N><C-w>l", opts)
map("t", "<F1>", "<C-\\><C-N>", opts)

map("n", "<C-a>", "@q", opts)
map("n", "<C-x>", "<cmd>!chmod +x %<CR>", opts)

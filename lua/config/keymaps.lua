local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

local keymap = vim.api.nvim_set_keymap

function VisSelect()
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<ESC>', true, false, true), 'nx', false)
    vim.api.nvim_exec('normal! gv"xy', true)
    local txt = vim.api.nvim_exec([[echo getreg('x')]], true)
    return txt
end

vim.api.nvim_create_user_command("LatLon", function()
    local text = vim.fn.getreg("+"):gsub('[°%s]', '')
    vim.api.nvim_put({text}, "c", true, true)
end, {})

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
keymap("n", "<F1>", "<Nop>", opts)
keymap("x", "<C-w>o", "<Nop>", opts)

vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.EasyMotion_leader_key = "\\"

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",
--
-- Set F5 to refresh buffers
keymap("n", "<F5>", ":checkt<CR>", opts)

keymap("n", "<BS>", ":noh<CR>", opts)
keymap("n", "gl", "g_", opts)
keymap("n", "gh", "^", opts)
keymap("n", "gp", "%", opts)
keymap("v", "gl", "g_", opts)
keymap("v", "gh", "^", opts)
keymap("v", "gp", "%", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- greatest remap ever
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

vim.keymap.set("n", "<F2>", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gIc<Left><Left><Left><Left>]])
vim.keymap.set("v", "<M-r>", [["qy:%s/<C-r>q/<C-r>q/gIc<Left><Left><Left><Left>]])

vim.keymap.set('v', '<C-s>', function()
    require('telescope.builtin').grep_string({search=VisSelect()})
end)

-- Navigate buffers
keymap("n", "<Tab>", ":bnext<CR>", opts)
keymap("n", "<S-Tab>", ":bprevious<CR>", opts)
keymap("n", "L", ":tabnext<CR>", opts)
keymap("n", "H", ":tabprevious<CR>", opts)
--keymap("n", "<leader><Tab>", ":tabnew<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

keymap("n", "<leader>t", ":NvimTreeToggle<CR>", opts)
keymap("n", "<leader>n", ":NvimTreeFocus<CR>", opts)

-- FZF
--keymap("n", "<C-f>", ":FZF --walker-root=/home/jisaeff/workspaces/HF2/<CR>", opts)

-- Telescope
-- This has a ripgrep dependency on it.
keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts) --Live_grep
keymap("n", "<leader>fg", ":Telescope live_grep<CR>", opts) --Live_grep
keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts) --Live_grep
keymap("n", "<leader>fh", ":Telescope help_tags<CR>", opts) --Live_grep
keymap("n", "<leader>fs", ":Telescope lsp_document_symbols<CR>", opts)
keymap("n", "<leader>f/", ":Telescope current_buffer_fuzzy_find<CR>", opts)

-- https://github.com/nvim-telescope/telescope.nvim/wiki/Configuration-Recipes#find-files-using-ag

--local builtin = require('telescope.builtin')
--vim.keymap.set('n', '<leader>f/', builtin.live_grep({grep_open_files=vim.fn.expand("%:p")}))

keymap("n", "<leader>Tt", ":TestNearest<CR>", opts)
keymap("n", "<leader>Ts", ":TestSuite<CR>", opts)

--keymap("n", "[q", ":cprevious<CR>", opts) --Live_grep
--keymap("n", "]q", ":cnext<CR>", opts) --Live_grep

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
--keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

--local emacs_opts = { noremap = false, silent = true }
--keymap("i", "<C-a>", "<Home>", emacs_opts)
--keymap("i", "<C-e>", "$", emacs_opts)
--keymap("i", "<C-k>", "<Esc>ld$a", emacs_opts)
--keymap("i", "<C-u>", "<Esc>d0xi", emacs_opts)
--keymap("i", "<A-f>", "<Esc>lwi", emacs_opts)
--keymap("i", "<A-b>", "<Esc>bi", emacs_opts)
--keymap("i", "<A-x>", "<Esc>:", emacs_opts)


keymap("n", "<leader>lg", ":LazyGit<CR>", opts)

keymap("n", "<F7>", ":Vex ~/.config/nvim/lua/user/", opts)

-- Terminal --
--Better terminal navigation
keymap("n", "<leader>\\", ":FloatermToggle<CR>", opts)
keymap("t", "<C-w>h", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-w>j", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-w>k", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-w>l", "<C-\\><C-N><C-w>l", term_opts)
keymap("t", "<F1>", "<C-\\><C-N>", term_opts)

keymap("n", "<M-a>", "@q", opts)
keymap("n", "<C-x>", "<cmd>!chmod +x %<CR>", opts)

vim.keymap.set("n", "<leader>rb", function()
    --vim.api.nvim_cmd({cmd="black", args={"-l", "79", vim.fn.expand("%:p")}}, {})
    vim.fn.system {"/home/jisaeff/workspaces/hf2-venv/bin/black", "-l", "79", vim.fn.expand("%:p")}
    vim.api.nvim_command("checktime")
end)

vim.api.nvim_create_user_command("Date", function()
    local date = os.date("%Y-%m-%d")
    local row, col = unpack(vim.api.nvim_win_get_cursor(0))
    vim.api.nvim_buf_set_text(0, row - 1, col + 1, row - 1, col + 1, {date})
end, {})

keymap('i', "<C-f>", "<Esc>gwwA", opts)

vim.keymap.set({'n', 'v'}, '<leader>xo', function()
    local mode = vim.api.nvim_get_mode().mode
        local lines = {}

        if mode:match('[vV\22]') then -- Matches visual, visual-line, or visual-block
            -- Exit visual mode to populate the '< and '> selection marks
            vim.cmd('normal! \27')

            local start_line = vim.fn.getpos("'<")[2] - 1
            local end_line = vim.fn.getpos("'>")[2]

            lines = vim.api.nvim_buf_get_lines(0, start_line, end_line, false)
        else
            -- Normal mode: fetch current line
            table.insert(lines, vim.api.nvim_get_current_line())
        end

        -- Filter out empty selections
        if #lines == 0 or (#lines == 1 and lines[1]:match('^%s*$')) then
            vim.notify("Selection/Line is empty!", vim.log.levels.WARN)
            return
        end

    -- Search for an existing terminal window
    local term_win = nil
    local term_job_id = nil

    for _, win in ipairs(vim.api.nvim_list_wins()) do
      local buf = vim.api.nvim_win_get_buf(win)
      if vim.bo[buf].buftype == 'terminal' then
        term_win = win
        term_job_id = vim.bo[buf].channel
        break
      end
    end

    -- If no terminal exists, split vertically and open one
    if not term_win then
      vim.cmd('vsplit | terminal')
      term_win = vim.api.nvim_get_current_win()
      term_job_id = vim.bo[vim.api.nvim_win_get_buf(term_win)].channel
      vim.cmd('wincmd p') -- Jump back to original window
    end

    -- Send the line contents to the terminal job
    local command_txt = table.concat(lines, '\n') .. '\n'
    vim.api.nvim_chan_send(term_job_id, command_txt)
end, { desc = "Run line underneath cursor in terminal split" })

vim.api.nvim_create_user_command('Hp', function(opts)
  local query = opts.args
  if query == '' then
    print("Please provide a Python module or function (e.g., :Hp json)")
    return
  end

  -- Run pydoc and split lines
  local handle = io.popen(
      '/home/jisaeff/workspaces/hf2-venv/bin/python -m pydoc ' .. vim.fn.shellescape(query)
  )
  local result = handle:read('*a')
  handle:close()

  if result == '' then
    print("No pydoc entry found for: " .. query)
    return
  end

  -- Create a new horizontal split buffer
  vim.cmd('new')
  local buf = vim.api.nvim_get_current_buf()

  -- Populate buffer with pydoc output
  local lines = vim.split(result, '\n')
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)

  -- Set buffer options (scratch buffer behavior)
  vim.bo[buf].buftype = 'nofile'
  vim.bo[buf].bufhidden = 'wipe'
  vim.bo[buf].swapfile = false
  vim.bo[buf].readonly = true
  vim.bo[buf].modifiable = false
  vim.bo[buf].filetype = 'man' -- Gives nice syntax highlighting for docs

  -- Map 'q' to close the window easily
  vim.keymap.set('n', 'q', '<cmd>close<CR>', { buffer = buf, silent = true, nowait = true })
end, {
  nargs = '?',
  desc = 'Look up Python documentation via pydoc',
})

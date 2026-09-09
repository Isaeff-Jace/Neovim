return {
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("gitsigns").setup {
        signs = {
          add          = { text = '┃' },
          change       = { text = '┃' },
          delete       = { text = '_' },
          topdelete    = { text = '‾' },
          changedelete = { text = '~' },
          untracked    = { text = '┆' },
        },
        signs_staged = {
          add          = { text = '┃' },
          change       = { text = '┃' },
          delete       = { text = '_' },
          topdelete    = { text = '‾' },
          changedelete = { text = '~' },
          untracked    = { text = '┆' },
        },
        signs_staged_enable = true,
        signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
        numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
        linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
        word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
        watch_gitdir = {
          follow_files = true
        },
        auto_attach = true,
        attach_to_untracked = false,
        current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
        current_line_blame_opts = {
          virt_text = true,
          virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
          delay = 1000,
          ignore_whitespace = false,
          virt_text_priority = 100,
          use_focus = true,
        },
        current_line_blame_formatter = '<author>, <author_time:%R> - <summary>',
        sign_priority = 6,
        update_debounce = 100,
        status_formatter = nil, -- Use default
        max_file_length = 40000, -- Disable if file is longer than this (in lines)
        preview_config = {
          -- Options passed to nvim_open_win
          border = 'single',
          style = 'minimal',
          relative = 'cursor',
          row = 0,
          col = 1
        },
      }
    end,
    keys = {
        {",r", ":Gitsigns reset_hunk<CR>", mode = "n"},
        {",r", ":Gitsigns reset_hunk<CR>", mode = "v"},
        {",s", ":Gitsigns stage_hunk<CR>", mode = "n"},
        {",s", ":Gitsigns stage_hunk<CR>", mode = "v"},
        {",b", ":Gitsigns blame_line<CR>", mode = "n"},
        {"=", ":Gitsigns next_hunk<CR>", mode = "n"},
        {"-", ":Gitsigns prev_hunk<CR>", mode = "n"},
        {",d", ":Gitsigns diffthis<CR>", mode = "n"},
        {",S", ":Gitsigns stage_buffer<CR>", mode = "n"},
        {",R", ":Gitsigns reset_buffer<CR>", mode = "n"},
        {",t", ":Gitsigns toggle_deleted<CR>", mode = "n"},
    },
  },
  {
    "kdheepak/lazygit.nvim",
    cmd = "LazyGit",
  },
  --{
  --  "harrisoncramer/gitlab.nvim",
  --  build = function() vim.fn.system("touch " .. vim.fn.stdpath("data") .. "/gitlab.log") end,
  --  config = function()
  --    local gitlab = require("gitlab")
  --    gitlab.setup()
  --  end,
  --},
}

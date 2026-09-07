return {
  {
    "mtth/scratch.vim",
    cmd = "Scratch",
    config = function()
      vim.g.scratch_persistence_file = '/tmp/scratch.vim'
    end,
  },
  {
    "vim-test/vim-test",
    cmd = { "TestNearest", "TestSuite" },
  },
  {
    "laktak/tome",
    config = function()
      vim.g.tome_no_mappings = true
    end,
  },
}
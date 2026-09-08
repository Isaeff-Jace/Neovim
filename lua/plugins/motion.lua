return {
  {
    "folke/flash.nvim",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      modes = {
        search = { enabled = false },
      },
    },
    keys = {
      { "<leader>s", function() require("flash").jump() end, mode = { "n", "x", "o" }, desc = "Flash jump" },
      { "<leader>S", function() require("flash").treesitter() end, mode = { "n", "x", "o" }, desc = "Flash treesitter" },
    },
  },
  { "unblevable/quick-scope" },
  { "justinmk/vim-sneak" },
}
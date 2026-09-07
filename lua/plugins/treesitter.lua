return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("nvim-treesitter").setup()

      local highlight_langs = { "c", "rust", "cpp", "python", "dockerfile" }

      -- syntax highlighting, provided by Neovim core
      vim.api.nvim_create_autocmd("FileType", {
        pattern = highlight_langs,
        callback = function()
          pcall(vim.treesitter.start)
        end,
      })

      -- Install parsers (async).
      require("nvim-treesitter").install(highlight_langs)
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = { "BufReadPost", "BufNewFile" },
  },
}
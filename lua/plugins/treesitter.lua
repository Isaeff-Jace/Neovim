return {
    {
      'nvim-treesitter/nvim-treesitter',
      lazy = false,
      build = ':TSUpdate',
      config = function()
        require("nvim-treesitter").setup({
          -- Ensure python (and markdown/lua for convenience) are automatically installed
          ensure_installed = { "python", "lua", "vim", "vimdoc", "yaml", "dockerfile", "cpp", "toml", "query"},

          -- Install parsers synchronously (only applied to `ensure_installed`)
          sync_install = false,

          -- Automatically install missing parsers when entering buffer
          auto_install = true,

          highlight = {
            enable = true,
            -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
            -- Set to `false` if you depend on 'syntax' being enabled (e.g. for indentation).
            additional_vim_regex_highlighting = true,
          },
        })
      end,
    },
    {
      "nvim-treesitter/nvim-treesitter-context",
      event = { "BufReadPost", "BufNewFile" },
    },
}

return {
  { "joshdick/onedark.vim", lazy = true },
  { "Tomasr/molokai", lazy = true },
  { "overcache/NeoSolarized", lazy = true },
  { "morhetz/gruvbox", lazy = true },
  { "shaunsingh/nord.nvim", lazy = true },
  {
    "datsfilipe/vesper.nvim",
    priority = 1000,
    config = function()
      require('vesper').setup({
        transparent = false, -- Boolean: Sets the background to transparent
        italics = {
          comments = false, -- Boolean: Italicizes comments
          keywords = false, -- Boolean: Italicizes keywords
          functions = false, -- Boolean: Italicizes functions
          strings = false, -- Boolean: Italicizes strings
          variables = false, -- Boolean: Italicizes variables
        },
        overrides = {}, -- A dictionary of group names, can be a function returning a dictionary or a table.
        palette_overrides = {}
      })

      vim.cmd.colorscheme('vesper')
    end,
  },
}
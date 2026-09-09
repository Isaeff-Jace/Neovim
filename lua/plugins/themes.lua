return {
  { "joshdick/onedark.vim", lazy = true },
  { "Tomasr/molokai", lazy = true },
  { "overcache/NeoSolarized", lazy = true },
  { "morhetz/gruvbox", lazy = true },
  { "shaunsingh/nord.nvim", lazy = true },
  {
    "datsfilipe/vesper.nvim",
    enabled=false,
    lazy=false,
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
        palette_overrides = {borderDarker = "#B5B5B5", primary = "#B5B5B5"}
      })

      vim.cmd.colorscheme('vesper')
    end,
  },
  {
      "rebelot/kanagawa.nvim",
      enabled=true,
      lazy=false,
      config = function()
        require('kanagawa').setup({
            compile = false,             -- enable compiling the colorscheme
            undercurl = true,            -- enable undercurls
            commentStyle = { italic = true },
            functionStyle = {},
            keywordStyle = { italic = true},
            statementStyle = { bold = true },
            typeStyle = {},
            transparent = false,         -- do not set background color
            dimInactive = false,         -- dim inactive window `:h hl-NormalNC`
            terminalColors = true,       -- define vim.g.terminal_color_{0,17}
            colors = {                   -- add/modify theme and palette colors
                palette = {},
                theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
            },
            overrides = function(colors) -- add/modify highlights
                return {}
            end,
            theme = "wave",              -- Load "wave" theme
            background = {               -- map the value of 'background' option to a theme
                dark = "wave",           -- try "dragon" !
                light = "lotus"
            },
        })
        vim.cmd.colorscheme('kanagawa-dragon')
      end,
  }
}

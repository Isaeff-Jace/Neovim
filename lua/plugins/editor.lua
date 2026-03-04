return {
    {
        "datsfilipe/vesper.nvim",
        fazy=false,
        priority=1000,
        config = function()
            vim.cmd([[colorscheme vesper]])
        end,
    },
    {"ryanoasis/vim-devicons", lazy=true},
    {'nvim-lualine/lualine.nvim', lazy=false},
}

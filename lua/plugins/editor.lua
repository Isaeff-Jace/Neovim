return {
    {
        "datsfilipe/vesper.nvim",
        lazy=false,
        priority=1000,
        config = function()
            vim.cmd([[colorscheme vesper]])
        end,
    },
    {"ryanoasis/vim-devicons", lazy=true},
    {'nvim-lualine/lualine.nvim', lazy=false},
}

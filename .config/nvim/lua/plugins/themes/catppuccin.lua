
return {
    {
        "catppuccin/nvim",
        lazy = false,
        name = "catppuccin",
        priority = 1000,
        config = function()
            require("catppuccin").setup({
                transparent_background = true,
            })
            vim.cmd([[colorscheme catppuccin-mocha]])
        end
    },
    {
        "ellisonleao/gruvbox.nvim",
        priority = 1000,
        lazy = false,
        opts = ...,
        config = function()
            require("gruvbox").setup({
                transparent_mode = true
            })

            --vim.cmd([[colorscheme gruvbox]])
        end
    }
}

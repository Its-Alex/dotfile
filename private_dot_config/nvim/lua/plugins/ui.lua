return {
    {
        "HiPhish/rainbow-delimiters.nvim"
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {},
        config = function()
            require("ibl").setup()
        end,
    }
}

return function()
    local treesitter = require("nvim-treesitter.configs")

    treesitter.setup({
        -- ensure_installed = {},
        auto_install = true,
        highlight = {
            enable = true,        -- false will disable the whole extension
            disable = { "json" }, -- list of language that will be disabled
        },
        indent = { enable = true },
        autopairs = { enable = true },
        autotag = { enable = true },
        context_commentstring = { enable = true },
    })

    local rainbow_delimiters = require("rainbow-delimiters")
    vim.g.rainbow_delimiters = {
        strategy = {
            [""] = rainbow_delimiters.strategy["global"],
            vim = rainbow_delimiters.strategy["local"],
        },
        query = {
            [""] = "rainbow-delimiters",
            lua = "rainbow-blocks",
        },
        highlight = {
            "RainbowDelimiterRed",
            "RainbowDelimiterYellow",
            "RainbowDelimiterBlue",
            "RainbowDelimiterOrange",
            "RainbowDelimiterGreen",
            "RainbowDelimiterViolet",
            "RainbowDelimiterCyan",
        },
    }
end

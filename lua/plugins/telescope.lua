-- TODO(chandrat) add LSP picker later
return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        -- Required dependencies
        "nvim-lua/popup.nvim",
        "nvim-lua/plenary.nvim",
        -- Suggested dependencies
        "BurntSushi/ripgrep",
        "nvim-telescope/telescope-fzf-native.nvim",
        -- Optional dependencies
        "sharkdp/fd",
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        require("telescope").setup {
            defaults = {
              file_ignore_patterns = {
                ".git/.*",
                "%.class",
              },
            },
            pickers = {
                find_files = { theme = "dropdown" },
                live_grep = { theme = "dropdown" },
                buffers = { theme = "dropdown" },
            },
        }
    end,
}

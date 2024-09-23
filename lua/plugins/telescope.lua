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
        "nvim-telescope/telescope-live-grep-args.nvim" ,
        -- This will not install any breaking changes.
        -- For major updates, this must be adjusted manually.
        version = "^1.0.0",
    },
    config = function()
        local telescope = require("telescope")
        telescope.setup {
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
        telescope.load_extension("live_grep_args")
    end,
}

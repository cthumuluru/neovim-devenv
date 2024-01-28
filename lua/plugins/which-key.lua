local function setup()
  require("which-key").setup {
    plugins = {
      marks = true,
      registers = true,
      spelling = {
        enabled = true,
        suggestions = 20,
      },
      presets = {
        operators = true,
        motions = true,
        text_objects = true,
        windows = true,
        nav = true,
        z = true,
        g = true,
      },
    },
    operators = { gc = "Comments" },
    popup_mappings = {
      scroll_down = "<c-d>",
      scroll_up = "<c-u>",
    }
  }
end

return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = setup,
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
}

local function config()
  local status_ok, configs = pcall(require, "nvim-treesitter.configs")
  if not status_ok then
    return
  end

  configs.setup({
    ensure_installed = { "c", "lua", "markdown", "markdown_inline", "bash", "python" }, -- list of languages
    sync_install = false,
    highlight = {
      enable = true, -- false will disable the whole extension
      disable = { "" }, -- disabled list of languages
      additional_vim_regex_highlighting = true,
    },
    indent = {
      enable = true,
      disable = { "yaml" },
    },
    -- autopairs integration
    autopairs = {
      enable = true,
    },
    -- comments integration
    -- context_commentstring = {
    --   enable = true,
    --   enable_autocmd = false,
    -- },
    -- rainbow parantesis
    rainbow = {
      enable = true,
      extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
      max_file_lines = nil,
    }
  })
end

return {
  "nvim-treesitter/nvim-treesitter",
  build  = ":TSUpdate",
  dependencies = {
    "p00f/nvim-ts-rainbow",
    "JoosepAlviste/nvim-ts-context-commentstring",
  },
  config = config,
}

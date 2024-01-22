local function setup()
  local status_ok, configs = pcall(require, "nvim-treesitter.configs")
  if not status_ok then
    return
  end

  configs.setup({
    ensure_installed = { "lua", "c", "cpp", "java", "go", "bash", "python", "markdown", "markdown_inline"}, -- list of languages
    sync_install = false,
    highlight = {
      enable = true,    -- false will disable the whole extension
      disable = { "css", "vimdoc" }, -- disabled list of languages
      additional_vim_regex_highlighting = true,
    },
    indent = {
      enable = true,
      disable = { "yaml" },
    },
  })

  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  }

  -- rainbow parantesis
  rainbow = {
    enable = true,
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil,
  }
end

return {
  "nvim-treesitter/nvim-treesitter",
  version = "v0.9.2",
  build  = ":TSUpdate",
  dependencies = {
    -- Optional dependencies
    "p00f/nvim-ts-rainbow",
    "JoosepAlviste/nvim-ts-context-commentstring",
  },
  config = setup,
}

local function setup()
  vim.o.background = 'dark' -- 'light'

  -- Use a protected call so we don't error out on first use
  local status_ok, vscode_colors = pcall(require, "vscode.colors")
  if not status_ok then
    return
  end

  -- Use a protected call so we don't error out on first use
  local status_ok, vscode = pcall(require, "vscode")
  if not status_ok then
    return
  end

  local c = vscode_colors.get_colors()
  vscode.setup({
    -- Enable transparent background
    transparent = false,
    -- Enable italic comment
    italic_comments = true,
    -- Disable nvim-tree background color
    disable_nvimtree_bg = true,
    -- Override colors (see ./lua/vscode/colors.lua)
    color_overrides = {
      vscLineNumber = '#FFFFFF',
    },
    -- Override highlight groups (see ./lua/vscode/theme.lua)
    group_overrides = {
      -- this supports the same val table as vim.api.nvim_set_hl
      -- use colors from this colorscheme by requiring vscode.colors!
      Cursor = { fg=c.vscDarkBlue, bg=c.vscLightGreen, bold=true },
    }
  })

  vscode.load()

end

return {
  "Mofiqul/vscode.nvim",
  config = setup,
}

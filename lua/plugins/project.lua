return {
  "ahmedkhalf/project.nvim",
  config = function()
    require("project_nvim").setup {
      sync_root_with_cwd = true,
      respect_buf_cwd = true,
      update_focused_file = {
        enable = true,
        update_root = true
      },
    }

    -- Telescope integration
    local status_ok, telescope = pcall(require, "telescope")
    if not status_ok then
      return
    end
    telescope.load_extension('projects')

  end
}

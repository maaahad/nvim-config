return {
  "catppuccin/nvim",
  lazy = false,
  name = "catppuccin",
  -- enabled / disabled
  enabled = false,
  priority = 1000,
  config = function()
    vim.cmd.colorscheme("catppuccin-mocha")
  end,
}

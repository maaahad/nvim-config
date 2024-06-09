return -- lazy.nvim
{
  "folke/noice.nvim",
  -- disable/disable noice
  enabled = true,
  config = function()
    require("noice").setup({
      cmdline = {
        -- classic Cmdline
        view = "cmdline",
      },
    })
  end,
}

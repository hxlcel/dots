return {
  "rose-pine/neovim",
  enabled = true,
  name = "rose-pine",
  config = function ()
    require("rose-pine").setup({
      -- variant = "moon",
      variant = "main",
      styles = {
        transparency = true,
      },
      highlight_groups = {
        SnacksDashboardHeader = { fg = "muted" },
        SnacksDashboardDesc = { fg = "muted" },
      }
    })
vim.cmd("colorscheme rose-pine")
end
}

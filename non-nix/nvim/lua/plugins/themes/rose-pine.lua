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
        SnacksDashboardHeader = { fg = "love" },
      }
    })
vim.cmd("colorscheme rose-pine")
end
}
